## 001
# Q1. 시험 점수 변수 만들고 출력하기
# 다섯 명의 학생이 시험을 봤습니다.
# 학생 다섯 명의 시험 점수를 담고 있는 변수를 만들어 출력해 보세요.
# 각 학생의 시험 점수는 다음과 같습니다.
# 80, 60, 70, 50, 90
score <- c(80, 60, 70, 50, 90)

# Q2. 전체 평균 구하기
# 앞 문제에서 만든 변수를 이용해서
# 이 학생들의 전체 평균 점수를 구해보세요.
mean(score)

# Q3. 전체 평균 변수 만들고 출력하기
# 전체 평균 점수를 담고 있는 새 변수를 만들어 출력해 보세요.
# 앞 문제를 풀 때 사용한 코드를 응용하면 됩니다.
score_mean <- mean(score)

## 002
# Q1. data.frame()과 c()를 조합해서
# 표의 내용을 데이터 프레임으로 만들어 출력해보세요.
df_example <- data.frame(
  제품 = c('사과', '딸기', '수박'),
  가격 = c(1800, 1500, 3000),
  판매량 = c(24, 38, 13)
)

# Q2. 앞에서 0만든 데이터 프레임을 이용해서
# 과일 가격 평균, 판매량 평균을 구해보세요.
mean(df_example$가격)
mean(df_example$판매량)

## 003
# Q1. ggplot2 패키지의 mpg 데이터를 사용할 수 있도록 불러온 뒤 복사본을 만드세요.
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg
# Q2. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명을 수정하세요.
mpg <- rename(mpg, city = cty, highway = hwy)
mpg

# 문제1. ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
# 문제2. poptotal(전체 인구)을 total로, popasian(아시아 인구)을 asian으로 변수명을 수정하세요.
midwest <- rename(midwest, total = poptotal, asian = popasian)
head(midwest)
# 문제3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보세요.
midwest$per_asian <- (midwest$asian / midwest$total * 100)
head(midwest$per_asian)
hist(midwest$per_asian)
# 문제4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.
midwest$many_asian <-
  ifelse(midwest$per_asian > mean(midwest$per_asian), "large", "small")
midwest$many_asian
# 문제5. "large"와 "small"에 해당하는 지역이 얼마나 되는지, 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
table(midwest$many_asian)
qplot(midwest$many_asian)