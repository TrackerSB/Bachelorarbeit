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
  geom_violin(aes(fill=factor(is_parent))) +
  theme(legend.position="bottom")
svg(filename = "../svg/compDyncovScopParent.svg")
compDyncovScopParent
dev.off()

#Plot invalidReasons