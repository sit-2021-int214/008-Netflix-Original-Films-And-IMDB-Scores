sat_score <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

glimpse(sat_score)

# 485 obs.

head(sat_score)

assert_is_numeric(sat_score$math_score)
assert_is_numeric(sat_score$reading_score)
assert_is_numeric(sat_score$writing_score)

as.numeric(sat_score$math_score)
as.numeric(sat_score$reading_score)
as.numeric(sat_score$writing_score)

sat_score %>% filter(duplicated(sat_score))

sat_score <- sat_score %>% distinct()

glimpse(sat_score)

