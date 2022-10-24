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

# na.omit() : 함수를 통한 결측치 제거
df_nomiss_2 <- na.omit(df)
df_nomiss_2

# na.rm : 속성을 통한 결측치 제외
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)


exam <-
  read.csv("PortFolio/Do-it-R-For-Data-Analysis/Data/csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA # math 열의 3, 8, 15행을 NA 할당
head(exam)
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

exam %>% summarise(
  mean_math = mean(math, na.rm = T),
  sum_math = sum(math, na.rm = T),
  median_math = median(math, na.rm = T)
)


# 이상치 제거하기 - 존재할 수 없는 값
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier
table(outlier$sex)
table(outlier$score) # 이상치 확인

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex) # 이상치 결측 처리
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

outlier %>% # 결측치를 제외하고 성별에 따른 평균 구하기
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))

# 이상치 제거하기 - 극단적인 값
boxplot(mpg$hwy) # 상자 그림 : 정규분포를 직사각형 상자 모양으로 표현한 그래프
boxplot(mpg$hwy)$stats # 상자 그림 통계치 출력, 통계치 밖에 있는 값이 극단치로 분류
# [1,]   12
# [2,]   18
# [3,]   24
# [4,]   27
# [5,]   37
# 12~37을 제외한 값은 극단치로 분류

mpg$hwy <-
  ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy) # 이상치 결측 처리
table(is.na(mpg$hwy))

mpg %>% # 결측치 제외하고 분석
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))