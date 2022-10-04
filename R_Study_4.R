# Preprocessing : dplyr(data plier), 데이터 전처리 라이브러리 : install.packages("dplyr")
library(dplyr)
exam <-
  read.csv("PortFolio/DO-IT-R-For-Data-Analysis/Data/csv_exam.csv")
head(exam, 10)

#filter(조건) : 행 추출
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(english <= 80)
exam %>% filter(class == 1 & math >= 50) # & : and
exam %>% filter(english >= 90 | math >= 90) # | : or
exam %>% filter(class %in% c(1, 3, 5)) # %in% : 포함
class1 <- exam %>% filter(class == 1) # class == 1인 것들을 class1에 할당

mean(class1$math)

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
displ1 <- mpg %>% filter(displ <= 4)
displ2 <- mpg %>% filter(displ >= 5)

mean(displ1$hwy)
mean(displ2$hwy)


manu1 <- mpg %>% filter(manufacturer == "audi")
manu2 <- mpg %>% filter(manufacturer == "toyota")

mean(manu1$hwy)
mean(manu2$hwy)

manu3_1 <-
  mpg %>% filter(manufacturer == "chevrolet" |
                   manufacturer == "ford" | manufacturer == "honda")
mean(manu3_1$hwy)

manu3_2 <-
  mpg %>% filter(manufacturer %in% c('chevrolet', 'ford', 'honda'))
mean(manu3_2$hwy)

# select(열 이름) : 열(변수) 추출
exam %>% select(class, math)
exam %>% select(-math)

# dplyr 함수 조합
exam %>% filter(class == 1) %>% select(english)
exam %>%
  filter(class == 2) %>%
  select(math)

exam %>%
  select(id, math) %>%
  head

# 열 정렬
exam %>% arrange(math)
exam %>% arrange(desc(math))

head(mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)), 5)
mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)

# 새로운 열 추가
exam %>% mutate(total = math + english + science) %>% head
exam %>% mutate(sum = math + english + science, mean = sum / 3) %>% arrange(sum)
exam %>% mutate(test = ifelse(science >= 60, "pass", "fail")) %>% head

prac <- as.data.frame(ggplot2::mpg)
prac %>% mutate(sum = cty + hwy, mean = sum / 2) %>% arrange(desc(mean)) %>% head(3)