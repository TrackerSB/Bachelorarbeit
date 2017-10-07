library(ggplot2)
library(plyr)
library(readr)

#Define global configs
defaultColorSequence <- c("#B25A00", "#FFBB76", "#FF9A34", "#0188B2", "#8BE3FF",
                          "#B20300", "#FF7876", "#FF3834", "#01B239", "#8BFFB0",
                          "#8C00B2", "#E176FF", "#D334FF", "#70B201", "#D4FF8B",
                          "#000000", "#999999")

#Following should always be added to ensure consistency
defaultSettings <- scale_fill_manual(values=defaultColorSequence)

#Load and filter data
report_ratiosMaxRegions <- read_csv("../csv/report_ratiosMaxRegions.csv")
report_ratiosMaxRegions <- report_ratiosMaxRegions[report_ratiosMaxRegions$dyncov <= 100,]

report_ratiosScops <- read_csv("../csv/report_ratiosScops.csv")
report_ratiosScops <- report_ratiosScops[report_ratiosScops$dyncov <= 100,]

report_invalidReasons <- read_csv("../csv/report_invalidReasons.csv")

#Create combination of tables
report_ratiosMaxRegions$is_parent <- 'max_region'
report_ratiosScops$is_parent <- 'scop'
report_ratiosParents <- rbind(plyr::rename(report_ratiosMaxRegions, c("t_parent"="t_region")), plyr::rename(report_ratiosScops, c("t_scop"="t_region")))


#Example histogram
#ggplot(report_ratiosScops, aes(x=dyncov)) + geom_histogram(binwidth = 0.5)

#Compare distribution of Dyncov of SCoPs and parents
compDyncovScopParent <- ggplot(report_ratiosParents, aes(factor(is_parent), dyncov)) +
  geom_violin(aes(fill=factor(is_parent)), draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(y = 'DynCov'[p]~'/DynCov'[s]) +
  theme(legend.position = "None", axis.title.x = element_blank()) +
  scale_y_continuous(label=function(x){return(paste("", x, "%"))})+
  defaultSettings

#Plot invalidReasons
pieInvalidReasons <- ggplot(report_invalidReasons, aes(x="", y=occurrence, fill=invalid_reason)) +
  geom_bar(width=1, stat="identity")+coord_polar("y", start=0) +
  theme(legend.title=element_blank(), legend.position = "bottom", axis.title = element_blank()) +
  guides(legend = guide_legend(ncol=2)) +
  defaultSettings

#Create table with means, variance, standard deviation, ...
means <- c(mean(report_ratiosScops$dyncov), mean(report_ratiosMaxRegions$dyncov))
vars <- c(var(report_ratiosScops$dyncov), var(report_ratiosMaxRegions$dyncov))
sds <- c(sd(report_ratiosScops$dyncov), sd(report_ratiosMaxRegions$dyncov))
statsMatrix <- matrix(data=c(means, vars, sds), nrow = 3, ncol = 2, byrow = TRUE)
rownames(statsMatrix) <- c("Mean", "Var", "StdVar")
colnames(statsMatrix) <- c("SCoPs", "MaxRegions")

#ttest p values
ttestDyncovScopsP <- t.test(report_ratiosScops$dyncov)$p.value
ttestDyncovMaxRegionsP <- t.test(report_ratiosMaxRegions$dyncov)$p.value

#If the script reaches to this point export all plots and data
svg(filename = "../svg/compDyncovScopParent.svg")
compDyncovScopParent
dev.off()
svg(filename = "../svg/pieInvalidReasons.svg")
pieInvalidReasons
dev.off()
write.csv2(x = statsMatrix, file = "../csv/statsMatrix.csv")