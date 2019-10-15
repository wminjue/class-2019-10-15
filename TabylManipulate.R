library(tidyverse)

library(janitor)

x <- tibble(replicate = 1:1000) %>%
  mutate(which_bowl = sample(c("Bowl 1", "Bowl 2"), size = 1000, replace = TRUE)) %>%
  mutate(cookie = ifelse(which_bowl == "Bowl 1", 
                          sample(c("vanilla", "chocolate"), size = 1000, replace = TRUE, prob = c(3/4, 1/4)), 
                          sample(c("vanilla","chocolate"), size = 1000, replace = TRUE, prob = c(1/2, 1/2))))

y <- tabyl(x, var1 = which_bowl, var2 = cookie) %>%
  adorn_percentages(denominator = "col") %>%
  adorn_pct_formatting()
y

download.file(destfile = "trains.csv", "https://docs.google.com/spreadsheets/d/e/2PACX-1vSaerGnn1tDQfgiyJRl7jnn1Au7Ev6Qt7BwMpl53ZgzAyMnANQfog9y4es4ZExlX5tjEgl0mPIyTGcP/pub?gid=480043959&single=true&output=csv")
trains <- read_csv("trains.csv")

result <- trains %>%
  group_by(treatment) %>%
  summarize(av = mean(attitude))






