install.packages("readr")
data <- read.csv("C://JKH/r_project/data/two_sample.csv", header = TRUE)
View(data)
head(data)

x <- data$method
y <- data$survey

x; y

#빈도 분석표
table(x)
table(y)

#교차 분석표
table(x, y, useNA = "ifany")

#두 집단 이상의 명목척도의 비율 검정
help(prop.test)                           #더크냐?             #신뢰수준
prop.test(c(110, 135), c(150, 150),
          alternative = "greater",
          conf.level = 0.95)#전체 성공횟수 벡터로(같은 속성을 같은 값들 묶음)
gender <- data$gender
survey <- data$survey
data
head(data)
gender; survey
table(gender, survey, useNA = "ifany")

table(gender)

table(survey)

prop.test(c(138, 107), c(174, 126), conf.level = 0.95) 