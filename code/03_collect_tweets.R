# load packages

library(tidyverse)
library(twitteR)


# Read list of politicians
polits_df <- read_csv("../data_polit_twitter/german_politicians_twitter.csv")


# check remaining limits
getCurRateLimitInfo()


# Read existing tweet data
load("../data_polit_twitter/tweets_df2017-08-03 18/11/18.Rdata")
load("../data_polit_twitter/tweets_accounts_1to29.Rdata")


# get older ids

polits_df %>%
  left_join(tweets_oldest, by = "screenName") -> polits_df



# Scrape tweets
scrape_polit_tweets <- function(accounts, max_tweets_per_account = 4, tweets_df, start_at = 1, end_at = length(accounts), oldest_ID = NULL){


  for (i in start_at:end_at) {
    tweets_temp <- userTimeline(accounts[i], n = max_tweets_per_account, includeRts = TRUE, maxID = oldest_ID[i])
    if (length(tweets_temp) > 0) {
      tweets_temp_df <- twListToDF(tweets_temp)
      tweets_temp_df$timestamp <- lubridate::now()
      tweets_df %>% bind_rows(tweets_temp_df) -> tweets_df
    }

    cat(polits_df$screenName[i]," number of tweets retrieved: ", length(tweets_temp),", account ", i," of ",  end_at - start_at, "\n")
  }

  return(tweets_df)
}  # end of `scrape_polit_tweets`


#undebug(scrape_polit_tweets)

# repeat the following steps several times, depending on rate limits,
# until sufficient tweets have been collected
tweets_older_154 <- scrape_polit_tweets(accounts = polits_df$screenName,
                    tweets_df = tweets_older_125,
                    start_at = 154,
                    max_tweets_per_account = 3200,
                    oldest_ID = polits_df$id)




tweets_polits %>%
  bind_rows(tweets_older) -> tweets_polits

save(tweets_polits, file = "tweets_polits.Rdata")










# check for duplicates
tweets_df %>%
  mutate(is_duplicated = duplicated(id)) %>%
  filter(!is_duplicated) -> tweets_df



# save output
save(tweets_df, file = paste0("../data_polit_twitter/tweets_df_", lubridate::now(),".Rdata"))



# load all data

tweets_accounts_1to29 %>%
  bind_rows(tweets_accounts_30, tweets_accounts_132, tweets_accounts_161) -> tweets_polits

save(tweets_polits, file = "../data_polit_twitter/tweets_polits.Rdata")
