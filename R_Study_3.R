exam <- read.csv("./Data/csv_exam.csv")
exam

head(exam) # 데이터 앞 부분 출력 (default = 6)
head(exam, 10)

tail(exam) # 데이터 뒷 부분 출력 (default = 6)

dim(exam) # 행, 열 개수 출력
str(exam) # 데이터 구조 출력
summary(exam) # 데이터 프레임 통계 요약

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg

View(mpg) # Raw 형태로 데이터 프레임 확인
dim(mpg)
str(mpg)
summary(mpg)
