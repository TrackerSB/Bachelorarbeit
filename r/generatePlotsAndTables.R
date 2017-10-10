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
report_ratiosMaxRegions <-
  read_csv("../csv/report_ratiosMaxRegions.csv")
report_ratiosMaxRegions <-
  report_ratiosMaxRegions[report_ratiosMaxRegions$dyncov <= 100,]
report_ratiosMaxRegions$project <-
  paste(report_ratiosMaxRegions$project,
        apply(report_ratiosMaxRegions, 1,
              function(row) if(endsWith(row["project"], ".simple")) "_{lnt}" else ""),
        sep = "")
write.csv(x = report_ratiosMaxRegions,
          file = "../csv/report_ratiosMaxRegions.csv",
          quote = FALSE, row.names = FALSE)

report_ratiosScops <- read_csv("../csv/report_ratiosScops.csv")
report_ratiosScops <-
  report_ratiosScops[report_ratiosScops$dyncov <= 100,]
report_ratiosScops$project <-
  paste(report_ratiosScops$project,
        apply(report_ratiosScops, 1,
              function(row) if(endsWith(row["project"], ".simple")) "_{lnt}" else ""),
                                    sep = "")
write.csv(x = report_ratiosScops,
          file = "../csv/report_ratiosScops.csv",
          quote = FALSE, row.names = FALSE)

report_invalidReasons <- read_csv("../csv/report_invalidReasons.csv")

#Create combination of tables
report_ratiosMaxRegions$is_parent <- 'MaxRegions'
report_ratiosScops$is_parent <- 'SCoPs'
report_ratiosBoth <-
  rbind(plyr::rename(report_ratiosMaxRegions, c("t_parent"="t_region")),
        plyr::rename(report_ratiosScops, c("t_scop"="t_region")))

#Compare distribution of Dyncov of SCoPs and parents
compDyncovScopBoth <- ggplot(report_ratiosBoth, aes(factor(is_parent), dyncov)) +
  geom_violin(aes(x = reorder(is_parent, is_parent!="SCoPs"),
                  fill=factor(is_parent)),
              draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(y = 'DynCov'[p]~'/DynCov'[s]) +
  theme(legend.position = "None", axis.title = element_blank()) +
  scale_y_continuous(label=function(x){return(paste("", x, "%"))}) +
  defaultSettings

#Plot invalidReasons
pieInvalidReasons <- ggplot(report_invalidReasons,
                            aes(x = "", y = occurrence, fill=invalid_reason)) +
  geom_bar(width=1, stat = "identity", position = "fill") +
  coord_polar("y", start = 0, direction = 1) +
  scale_y_continuous(label=function(x){return(paste("", 100*x, "%"))}) +
  theme(legend.title=element_blank(),
        legend.position = "bottom", axis.title = element_blank()) +
  guides(fill=guide_legend(ncol=2)) +
  defaultSettings

#Create table with means, variance, standard deviation, ...
meanScops <- mean(report_ratiosScops$dyncov)
meanMaxRegions <- mean(report_ratiosMaxRegions$dyncov)
meanDelta <- (meanMaxRegions - meanScops) / meanScops * 100
means <- c(meanScops, meanDelta, meanMaxRegions)
sdScops <- sd(report_ratiosScops$dyncov)
sdMaxRegions <- sd(report_ratiosMaxRegions$dyncov)
sdDelta <- (sdMaxRegions - sdScops) / sdScops * 100
sds <- c(sdScops, sdDelta, sdMaxRegions)
varScops <- var(report_ratiosScops$dyncov)
varMaxRegions <- var(report_ratiosMaxRegions$dyncov)
varDelta <- (varMaxRegions - varScops) / varScops *100
vars <- c(varScops, varDelta, varMaxRegions)
statsMatrix <- matrix(data=c(means, sds, vars),
                      nrow = 3, ncol = 3, byrow = TRUE)
rownames(statsMatrix) <- c("µ", "s", "s²")
colnames(statsMatrix) <- c("SCoPs", "Delta", "MaxRegions")

#shapiro-wilk-test p values
swtDyncovScopsP <- shapiro.test(report_ratiosScops$dyncov)$p.value
swtDyncovMaxRegionsP <-
  shapiro.test(report_ratiosMaxRegions$dyncov)$p.value

#ttest p values (normal distribution needed)
ttestDyncovScopsP <- t.test(report_ratiosScops$dyncov)$p.value
ttestDyncovMaxRegionsP <-
  t.test(report_ratiosMaxRegions$dyncov)$p.value

#Mann-Whitney-U test
utestDyncovP <- wilcox.test(x = report_ratiosMaxRegions$dyncov,
                            y = report_ratiosScops$dyncov)$p.value

pValues <- matrix(data = c(swtDyncovScopsP, swtDyncovMaxRegionsP,
                           ttestDyncovScopsP, ttestDyncovMaxRegionsP),
                  nrow = 2, ncol = 2, byrow = TRUE)
rownames(pValues) <- c("Shapiro-Wilk-Test", "T-Test")
colnames(pValues) <- c("SCoPs", "MaxRegions")

#speedups
numProcessors <- 8
speedupScops <- numProcessors /
  ((1 - meanScops/100) * numProcessors + meanScops/100)
speedupMaxRegions <- numProcessors /
  ((1 - meanMaxRegions/100) * numProcessors + meanMaxRegions/100)

#If the script reaches to this point export all plots and data
svg(filename = "../svg/compDyncovScopParent.svg")
compDyncovScopBoth
dev.off()
svg(filename = "../svg/pieInvalidReasons.svg")
pieInvalidReasons
dev.off()
write.csv(x = statsMatrix, file = "../csv/statsMatrix.csv", quote = TRUE)
write.csv(x = pValues, file = "../csv/pValues.csv", quote = FALSE)
