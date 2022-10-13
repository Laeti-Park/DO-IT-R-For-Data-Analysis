# 결측치 형태는 'NA'로 표기된다.

df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df

is.na(df) # 결측치 확인, 결측치가 포함된 상태의 평균과 합계는 NA로 표기된다.
table(is.na(df))
table(is.na(df$score))

library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# 함수를 통한 결측치 제거(na.omit())
df_nomiss_2 <- na.omit(df)
df_nomiss_2

# 속성을 통한 결측치 제외(na.rm)
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)


exam <-
  read.csv("PortFolio/Do-it-R-For-Data-Analysis/Data/csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA
head(exam)
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

exam %>% summarise(
  mean_math = mean(math, na.rm = T),
  sum_math = sum(math, na.rm = T),
  median_math = median(math, na.rm = T)
)
