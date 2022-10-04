a <- 2
b <- 3
a + b # 5

# c() 여러 개의 값을 넣는 것
var1 <- c(1, 2, 3)
var2 <- c(6, 7, 8)

# seq() # 연속된 값 생성
var3 <- seq(1, 5) # 1,2,3,4,5
var4 <- seq(1, 5, 2) # 1,3,5,7,9


var1 + var2 # 각 위치 값끼리 연산
var3 + 2 # 각 요소마다 연산

str1 <- "Hello "
str2 <- "World!"
paste(str1, str2) # 문자열끼리의 이항 연산자 사용은 불가능
paste(str1, str2, collapse = "?") # ?을 구분자로 연결
str_arr1 <- c("DongHun", "Park")
paste(str_arr1, collapse = "-")

mean(var1) # 2
max(var1) # 3
min(var1) # 1

? paste() # 함수에 대한 정보 확인

# install.packages("ggplot2") ggplot 라이브러리 설치
library(ggplot2)

x <- c("a", "a", "b", "c")
qplot(x)

qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg,
      x = drv,
      y = hwy,
      geom = "line")
qplot(data = mpg,
      x = drv,
      y = hwy,
      geom = "boxplot")
qplot(
  data = mpg,
  x = drv,
  y = hwy,
  geom = "boxplot", # 그래프 형태
  colour = drv # 색 설정
)

# manufacturer model : 자동차 제조사
# displ : 배기량
# yeal : 제조년도
# cyl : 실린더 수
# trans : 변속기
# drv : 구동 방식(f = 전륜구동, r = 후륜구동, 4ㅍ = 사륜구동)
# city : 도시 연비
# hwy : 고속도로 연비
# fl : 연료 종류
# class : 자동차 종류