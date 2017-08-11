# # Prepare list of politicians

library(tidyverse)

polits <- read_csv("../data_polit_twitter/german_politicians_twitter.csv")


# check duplicates
polits %>%
  mutate(is_duplicate = duplicated(.$account)) %>%
  filter(!is_duplicate) -> polits_unique


# only humans (ie., accounts that map to an individual politician)
polits_unique %>%
  filter(human == "y", party != "invalid") -> polits_df


polits_df %>%
  mutate(party = str_to_lower(party)) -> polits_df


write.csv(polits_df, file = "../data_polit_twitter/german_politicians_twitter.csv")


# get followers


