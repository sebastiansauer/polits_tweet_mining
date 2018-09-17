Mining German politicians' tweets
=================================


## tl;dr

This is an ongoing project on the analyses of some tweets of some German politicians.

In this repository, you will find code and output. Note that *NO* data is made available, as there are legal concerns in sharing Tweets. However, in acccordance with the regulations of Twitter, I have made the "dehydrated" tweets available (IDs only; the IDs can be re-hydrated using the open Twitter API, or a number of tools).

Analyses are conducted using R.

## Install and run:
### Mac
1. Install R: https://stackoverflow.com/questions/20457290/installing-r-with-homebrew
2. Download RStudio: https://www.rstudio.com/
3. `git clone https://github.com/sebastiansauer/polits_tweet_mining.git`
4. Open polit_tweets_mining.Rproj
5. Install Packages: Within RStudio, go to Tools>Install Packages…, type in the packages needed from the files to be found within /code (e.g. tidyverse)

## Collecting profiles/twitter accounts
Twitter accounts were collected based on these lists:

https://twitter.com/dw_politics/lists/german-politicians/members
https://www.afd.de/partei/bundesvorstand/

## Collecting tweets

Tweets were collected via the Twitter API, mediated via the R package `TwitteR`. For each entry in the list of accounts, the maximum number of tweets allowed (n=3200) were collected. However, in some situations, the API delivers fewer tweets.

In sum, ~320k tweets were collected.

Oldest tweet: March 2013
Most recent tweet: Aug 2017


## Analyses

Metadata of tweets and text of tweets were processed (after initial makeup/preparation). Stopwords and sentimens analyses (in prep) are included.
