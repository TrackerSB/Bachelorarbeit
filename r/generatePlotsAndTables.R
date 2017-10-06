#Define global configs
defaultColorSequence <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#Following should always be added to ensure consistency
defaultSettings <- scale_fill_manual(values=defaultColorSequence)

#Load and filter data
library(readr)
report_ratiosMaxRegions <- read_csv("../csv/report_ratiosMaxRegions.csv")
report_ratiosMaxRegions <- report_ratiosMaxRegions[report_ratiosMaxRegions$dyncov <= 100,]

report_ratiosScops <- read_csv("../csv/report_ratiosScops.csv")
report_ratiosScops <- report_ratiosScops[report_ratiosScops$dyncov <= 100,]

#Create combination of tables
library(plyr)
report_ratiosMaxRegions$is_parent <- 'max_region'
report_ratiosScops$is_parent <- 'scop'
report_ratiosParents <- rbind(plyr::rename(report_ratiosMaxRegions, c("t_parent"="t_region")), plyr::rename(report_ratiosScops, c("t_scop"="t_region")))

library(ggplot2)

#Example histogram
#ggplot(report_ratiosScops, aes(x=dyncov)) + geom_histogram(binwidth = 0.5)

#Compare distribution of Dyncov of SCoPs and parents
compDyncovScopParent <- ggplot(report_ratiosParents, aes(factor(is_parent), dyncov)) +
  geom_violin(aes(fill=factor(is_parent)), draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(y = 'DynCov'[p]~'/DynCov'[s]) +
  scale_y_continuous(label=function(x){return(paste("", x, "%"))})+
  theme(legend.position="bottom")+
  defaultSettings

#Plot invalidReasons
pieInvalidReasons <- ggplot(report_invalidReasons, aes(x="", y=occurrence, fill=invalid_reason)) +
  geom_bar(width=1, stat="identity")+coord_polar("y", start=0) +
  defaultSettings

#If the script reaches to this point export all plots
svg(filename = "../svg/compDyncovScopParent.svg")
compDyncovScopParent
dev.off()
svg(filename = "../svg/pieInvalidReasons.svg")
pieInvalidReasons
dev.off()