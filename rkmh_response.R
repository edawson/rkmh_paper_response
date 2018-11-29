require(tidyverse)
require(cowplot)

read_and_label <- function(fname, readlen, params){
  df <- read.csv(fname, header = T, sep = "\t")
  df <- df %>% mutate(ReadLength = readlen, Params = params)
  return (df)
}

lin_divergence <- c(1, 2, 5)
names(lin_divergence) <- c("A", "B", "C")

sublin_divergence <- c(0.1, 0.2, 0.5)
names(sublin_divergence) <- c("1","2","3")

##################################
## Table of lineage performance ##
##################################

## 75bp reads
lin_results_75bp_defaults <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_75bp_simpleModel.k16.s1000.N5.tsv", 75, "s = 1000")
lin_results_75bp_m100_i1_s1000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_75bp_simpleModel.k16.s1000.m100.i1.N5.tsv", 75, "s = 1000, I = 1, M = 100")
lin_results_75bp_m100_i1_s8000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_75bp_simpleModel.k16.s8000.m100.i1.N5.tsv", 75, "s = 8000, I = 1, M = 100")

lin_75_bp_df <- bind_rows(lin_results_75bp_defaults, lin_results_75bp_m100_i1_s1000, lin_results_75bp_m100_i1_s8000)

lin_75bp_tidy_df <- lin_75_bp_df %>% gather(key = "Category", "Percent",Unclassified, Correct, Incorrect) %>% mutate(Category = factor(Category, levels = c("Unclassified", "Incorrect", "Correct")))

ggplot(lin_75bp_tidy_df, aes(x = Sublineage, weight = Percent, fill = Category)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = c("grey", "red", "lightgreen")) +
  facet_wrap(~ Params)


## 150bp reads
lin_results_150bp_defaults <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_150bp_simpleModel.k16.s1000.N5.tsv", 150, "s = 1000")
lin_results_150bp_m100_i1_s1000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_150bp_simpleModel.k16.s1000.m100.i1.N5.tsv", 150, "s = 1000, I = 1, M = 100")
lin_results_150bp_m100_i1_s8000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_150bp_simpleModel.k16.s8000.m100.i1.N5.tsv", 150, "s = 8000, I = 1, M = 100")

lin_150_df <- bind_rows(lin_results_150bp_defaults, lin_results_150bp_m100_i1_s1000, lin_results_150bp_m100_i1_s8000)
lin_150bp_tidy_df <- lin_150_df %>% gather(key = "Category", "Percent",Unclassified, Correct, Incorrect) %>% mutate(Category = factor(Category, levels = c("Unclassified", "Incorrect", "Correct")))

ggplot(lin_150bp_tidy_df, aes(x = Sublineage, weight = Percent, fill = Category)) + 
  geom_bar(position = "fill") +
  scale_fill_manual(values = c("grey", "red", "lightgreen")) +
  facet_wrap(~ Params)

## 250bp ION Torrent
lin_results_250bp_defaults <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_250bp_simpleModel.k16.s1000.N5.tsv", 250, "s = 1000")
lin_results_250bp_m100_i1_s1000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_250bp_simpleModel.k16.s1000.m100.i1.N5.tsv", 250, "s = 1000, I = 1, M = 100")
lin_results_250bp_m100_i1_s8000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_250bp_simpleModel.k16.s8000.m100.i1.N5.tsv", 250, "s = 8000, I = 1, M = 100")

lin_250_df <- bind_rows(lin_results_250bp_defaults, lin_results_250bp_m100_i1_s1000, lin_results_250bp_m100_i1_s8000)
lin_250bp_tidy_df <- lin_250_df %>% gather(key = "Category", "Percent",Unclassified, Correct, Incorrect) %>% mutate(Category = factor(Category, levels = c("Unclassified", "Incorrect", "Correct")))

ggplot(lin_250bp_tidy_df, aes(x = Sublineage, weight = Percent, fill = Category)) + 
  geom_bar(position = "fill") +
  scale_fill_manual(values = c("grey", "red", "lightgreen")) +
  facet_wrap(~ Params)

## 5000bp reads, err
lin_results_5000bp_defaults <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_5000bp_simpleModel.k16.s1000.N5.tsv", 5000, "s = 1000")
lin_results_5000bp_m100_i1_s1000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_5000bp_simpleModel.k16.s1000.m100.i1.N5.tsv", 5000, "s = 1000, I = 1, M = 100")
lin_results_5000bp_m100_i1_s8000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_5000bp_simpleModel.k16.s8000.m100.i1.N5.tsv", 5000, "s = 8000, I = 1, M = 100")

lin_5000_df <- bind_rows(lin_results_5000bp_defaults, lin_results_5000bp_m100_i1_s1000, lin_results_5000bp_m100_i1_s8000)
lin_5000bp_tidy_df <- lin_5000_df %>% gather(key = "Category", "Percent",Unclassified, Correct, Incorrect) %>% mutate(Category = factor(Category, levels = c("Unclassified", "Incorrect", "Correct")))

ggplot(lin_5000bp_tidy_df, aes(x = Sublineage, weight = Percent, fill = Category)) + 
  geom_bar(position = "fill") +
  scale_fill_manual(values = c("grey", "red", "lightgreen")) +
  facet_wrap(~ Params)

## Multipass 5000bp reads
lin_results_5000bp_multipass_defaults <- read_and_label("~/academe/rkmh_paper_response/lineage_5000bp_simpleModel.k16.s1000.rk", 150, "s = 1000")
lin_results_5000bp_multipass_m100_i1_s1000 <- read_and_label("~/academe/rkmh_paper_response/lineage_5000bp_simpleModel.k16.s1000.m100.i1.N5.rk", 150, "s = 1000, I = 1, M = 100")
lin_results_5000bp_multipass_m100_i1_s8000 <- read_and_label("~/academe/rkmh_paper_response/lineage_5000bp_simpleModel.k16.s8000.m100.i1.N5.rk", 150, "s = 8000, I = 1, M = 100")

#####################################
## Table of sublineage performance ##
#####################################

## 75bp reads
sublin_results_75bp_defaults <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_75bp_simpleModel.k16.s1000.N5.tsv", 75, "s = 1000")
sublin_results_75bp_m100_i1_s1000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_75bp_simpleModel.k16.s1000.m100.i1.N5.tsv", 75, "s = 1000, I = 1, M = 100")
sublin_results_75bp_m100_i1_s8000 <- read_and_label("~/academe/rkmh_paper_response/scoreLineage.lineage_75bp_simpleModel.k16.s8000.m100.i1.N5.tsv", 75, "s = 8000, I = 1, M = 100")

sublin_75_bp_df <- bind_rows(sublin_results_75bp_defaults,
                             sublin_results_75bp_m100_i1_s1000,
                             sublin_results_75bp_m100_i1_s8000)

lin_75bp_tidy_df <- lin_75_bp_df %>% gather(key = "Category", "Percent",Unclassified, Correct, Incorrect) %>% mutate(Category = factor(Category, levels = c("Unclassified", "Incorrect", "Correct")))

ggplot(lin_75bp_tidy_df, aes(x = Sublineage, weight = Percent, fill = Category)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = c("grey", "red", "lightgreen")) +
  facet_wrap(~ Params)


