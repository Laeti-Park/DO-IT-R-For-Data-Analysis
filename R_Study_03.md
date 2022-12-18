### 데이터 프레임 파악 함수
- head(exam) : 데이터 앞 부분 출력 (default = 6)
- tail(exam) : 데이터 뒷 부분 출력 (default = 6)
- View() : Raw 형태로 데이터 프레임 확인
- dim(exam) : 행, 열 구성 출력
- str(exam) : 데이터 구조 출력
```r
exam <- read.csv("./Data/csv_exam.csv")
exam

head(exam) # 데이터 앞 부분 출력 (default = 6)
head(exam, 10)
tail(exam) # 데이터 뒷 부분 출력 (default = 6)

View() # Raw 형태로 데이터 프레임 확인
dim(exam) # 행, 열 구성 출력
str(exam) # 데이터 구조 출력
# 'data.frame':	20 obs. of  5 variables:
# $ id     : int  1 2 3 4 5 6 7 8 9 10 ...
# $ class  : int  1 1 1 1 2 2 2 2 3 3 ...
# $ math   : int  50 60 45 30 25 50 80 90 20 50 ...
# $ english: int  98 97 86 98 80 89 90 78 98 98 ...
# $ science: int  50 60 78 58 65 98 45 25 15 45 ...
```
- mpg 데이터 파악
- manufacturer(manufacturer model) : 자동차 제조사
- displ(displacement) : 배기량
- year : 제조년도
- cyl(cylinder) : 실린더 수
- trans(transmission) : 변속기
- drv(drivetrain) : 구동 방식(f = 전륜구동, r = 후륜구동, 4 = 사륜구동)
- cty(city miles per gallon) : 도시 연비
- hwy(highway miles per gallon) : 고속도로 연비
- fl(fuel type) : 연료 종류
- class : 자동차 종류
```r
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg) # 특정 패키지에 포함된 함수나 데이터 지정
head(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)
```

### 데이터 가공
- 변수명 변경
- install.packages("dplyr") : 데이터 추출, 필터링, 계산, 열 추가, 요약, 그룹화를 편리하게 할 수 있는 함수 제공하는 패키지
- install.packages("ggplot2") : 그래프 함수 제공하는 패키지
```r
library(dplyr)
library(ggplot2)
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw
df_new <- df_raw # 데이터 프레임 복사
df_new <- rename(df_new, v2 = var2) # var2 열을 v2 열로 수정
df_new
```
- 파생변수 만들기
```r
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df$var_sum <- df$var1 + df$var2 # 파생변수 생성
df

df$var_mean <- (df$var1 + df$var2) / 2
df
```
- 조건문을 통해 파생변수 만들기
```r
# 조건문을 활용한 파생변수 만들기
mpg$total <- (mpg$cty + mpg$hwy) / 2 # 통합 연비 변수 생성
head(mpg)
summary(mpg$total) # 요약 통계
hist(mpg$total) # 히스토그램 생성
# 고연비 합격 판정을 받은 자동차는 몇 대인가?
mpg$high_test <-
  ifelse(mpg$total >= 20, "pass", "fail")
mpg$high_test
head(mpg, 10)
table(mpg$high_test)

qplot(mpg$high_test)

# 중첩 조건문 활용하기
mpg$grade <-
  ifelse(mpg$total >= 30, "A",
         ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 10)
```

### 데이터 빈도 확인
- 빈도표 확인
```r
table(mpg$grade)
```
- 막대 그래프 확인
```r
qplot(mpg$grade)
```