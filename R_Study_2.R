english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)

df_midterm <- data.frame(english, math)
df_midterm

class <- c(1, 1, 2, 2)

df_midterm <- data.frame(english, math, class)
df_midterm

#데이터 프레임명$열 이름으로 개별 열 접근
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(
  english = c(10, 20, 30, 50),
  math = c(20, 60, 80, 90),
  class = c(1, 2, 3, 3)
)


# install.packages("readxl") 엑셀 파일을 불러오는 패키지
library(readxl)

# getwd()를 통해 작업 폴더를 확인, setwd()를 통해 작업 폴더를 설정
df_exam <- read_excel("./Data/excel_exam.xlsx")
df_exam

mean(df_exam$english)

# 엑셀 시트가 여러 개 존재하면 시트 번호를 지정하여 읽기
df_exam_sheet <-
  read_excel("./Data/excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

df_exam_novar <- read_excel("./Data/excel_exam_novar.xlsx")
df_exam_novar

# col_names = F : 첫 번째 행을 변수명이 아닌 데이터로 인식(...숫자)
df_exam_novar <-
  read_excel("./Data/excel_exam_novar.xlsx", col_names = F)
df_exam_novar

df_csv_exam <- read.csv("./Data/csv_exam.csv")
df_csv_exam

# 서수형으로 되어있는 것은 stringsAsFactors로 설정
df_csv_exam <-
  read.csv("./Data/csv_exam.csv", stringsAsFactors = TRUE)
df_csv_exam

df_midterm <- data.frame(
  english = c(10, 20, 30, 50),
  math = c(20, 60, 80, 90),
  class = c(1, 2, 3, 2)
)

# 데이터 프레임을 csv 파일로 저장
write.csv(df_midterm, file = "./Data/df_midterm.csv")

# RData : R 전용 데이터 파일, 용량이 작고 빠름
save(df_midterm, file = "./Data/df_midterm.rda")
rm(df_midterm) # 데이터 프레임을 지움

load("df_midterm.rda") # RData 파일 이름으로 데이터 프레임을 불러옴
df_midterm