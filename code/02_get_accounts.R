# # Prepare list of politicians

library(tidyverse)
library(stringr)

polits_raw <- read_csv("../data_polit_twitter/raw/german_politicians_twitter_raw.csv")


# check duplicates
polits_raw %>%
  mutate(is_duplicate = duplicated(.$screenName)) %>%
  filter(!is_duplicate) -> polits_unique


# only humans (ie., accounts that map to an individual politician)
polits_unique %>%
  filter(human == "y", party != "invalid") -> polits_df


# fix typo
polits_df %>%
  mutate(party = str_to_lower(party)) %>%
  mutate(party = str_replace(string = party,
                                 pattern = "grune",
                                 replacement = "gruene"),
         screenName = str_replace(string = screenName,
                                  pattern = "@",
                                  replacement = "")) -> dummy



write_csv(polits_df, path = "../data_polit_twitter/german_politicians_twitter.csv")


fdps <- polits_df %>%
  filter(party == "fdp")


