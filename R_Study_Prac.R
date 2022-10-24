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


## 004
# Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요.
mpg <- as.data.frame(ggplot2::mpg)
displ1 <- mpg %>% filter(displ <= 4)
displ2 <- mpg %>% filter(displ >= 5)

mean(displ1$hwy)
mean(displ2$hwy)

# Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota" 중 어느 manufacturer(자동차 제조 회사)의 cty(도시 연비)가 평균적으로 높은지 알아보세요.
manu1 <- mpg %>% filter(manufacturer == "audi")
manu2 <- mpg %>% filter(manufacturer == "toyota")

mean(manu1$hwy)
mean(manu2$hwy)

# Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려 합니다. 이 회사들의 데이터를 추출한 후 hwy 전체 평균을 구해 보세요.
manu3_1 <-
  mpg %>% filter(manufacturer == "chevrolet" |
                   manufacturer == "ford" | manufacturer == "honda")
mean(manu3_1$hwy)

manu3_2 <-
  mpg %>% filter(manufacturer %in% c('chevrolet', 'ford', 'honda'))
mean(manu3_2$hwy)


# Q1. mpg 데이터는 11개 변수로 구성되어 있습니다. 이 중 일부만 추출해 분석에 활용하려고 합니다. mpg데이터에서는 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만드세요. 새로 만든 데이터의 일부를 출력해 두 변ㄴ수로만 구성되어 있는지 확인하세요.
new_mpg <- mpg %>% select(class, cty)
head(new_mpg)

# Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 앞에서 추출한 데이터를 이용해 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비) 평균이 더 높은지 알아보세요.
class1 <- new_mpg %>% filter(class == 'suv')
class2 <- new_mpg %>% filter(class == 'compact')

mean(class1$cty)
mean(class2$cty)


# Q1. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 합니다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하세요.
audi <-
  mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)
audi


# Q1. mpg() 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하세요.
# Q2. 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가하세요.
# Q3. '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하세요.
prac <- as.data.frame(ggplot2::mpg)
prac %>% mutate(sum = cty + hwy, mean = sum / 2) %>% arrange(desc(mean)) %>% head(3)


# Q1. 어떤 차종의 도시 연비가 가장 높은지 비교해보려합니다. class별 cty 평균을 구해보세요.
# Q2. cty 평균이 높은 순으로 정렬해 출력하세요.
mpg %>%
  group_by(class) %>%
  mutate(sum = hwy + cty) %>%
  summarise(mean = mean(sum)) %>%
  arrange(desc(mean))

# Q3. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 합니다. hwy 평균이 가장 높은 회사 세 곳을 출력하세요.
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean = mean(hwy)) %>%
  arrange(desc(mean)) %>%
  head(3)

# Q4. 어떤 회사에서 'compact'(경차) 차종을 가장 많이 생산하는지 알아보려고 합니다. 각 회사별 compact 차종 수를 내림차순으로 정렬해 출력하세요.
mpg %>%
  group_by(manufacturer) %>%
  filter(class == "compact") %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(5)


## 005
fuel <- data.frame(
  fl = c("c", "d", "e", "p", "r"),
  price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22)
)
head(mpg)


# fuel 데이터를 이용해 mpg데이터에 price_fl(연료 가격) 변수를 추가하세요.
# model, fl, price_fl 변수를 추출해 앞부분 5행을 출력하세요.
mpg_join <- left_join(mpg, fuel, by = "fl")
mpg_join %>% select(model, fl, price_fl) %>% head(5)


# 문제1. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타냅니다. midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 변수를 추가하세요.
midwest <- as.data.frame(ggplot2::midwest)

midwest_new <-
  midwest %>% mutate(per_not_adult = (poptotal - popadults) / poptotal)
head(midwest_new)

# 문제2. 미성년 인구 백분율이 가장 높은 상위 5개 country(지역)의 미성년 인구 백분율을 출력하세요.
midwest_new %>% arrange(desc(per_not_adult)) %>% select(county, per_not_adult) %>% head(5)

# 문제3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보세요.
midwest_new <-
  midwest_new %>% mutate(high_not_adult = ifelse(
    per_not_adult >= 0.40,
    "large",
    ifelse(per_not_adult >= 0.30, "middle", "small")
  ))
table(midwest_new$high_not_adult)

# 문제4. popasian은 해당 지역의 아시아인 인구를 나타냅니다.
# '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고
# 하위 10개 지역의 state(주), country(지역), 아시아인 인구 백분율을 출력하세요.
midwest %>% mutate(per_asian = (popasian / poptotal) * 100) %>% arrange(per_asian) %>% select(state, county, per_asian) %>% head(10)


## 006
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

# Q1. drv(구동 방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보려고 합니다.
# 분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인해야 합니다.
# drv 변수와 hwy 변수에 결측치가 몇 개 있는 지 알아보세요.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고,
# 어떤 구동 방식의 hwy 평균이 높은지 알아보세요.
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>%  summarise(hwy_mean = mean(hwy))


