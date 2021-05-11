library(readr)
data <- read.csv("C://JKH/r_project/data/one_sample.csv", header = TRUE)
head(data)
x <- data$time
x
head(x)

summary(x) #NA- 41개
mean(x) 

mean(x, na.rm = T) #NA 제외 평균(방법1)

#데이터 정제 -> 5.556881

x1 <- na.omit(x) #NA제외 평균(방법2)
x1

shapiro.test(x1) #x1데이터에 대한 정규분포를 결정하는 함수
# W = 0.9914, p-value = 0.7242 <- 정규분포(0.05보다 크면 정규분포!)
#t.test()사용 / 정규분포 아닐 시 wilcox.test()

hist(x1) 

help(t.test)
mean(x1)

t.test(x1, mu=5.2) #mu그리스로마-평균 기존 5.2시간 기준 검정
#정제데이터와 5.2시간 비교
t.test(x, mu=5.2, alter="two.side", conf.level = 0.95)
#p-value = 0.0001417
# 해설 : 평균 사용시간 5.2시간과 차이가 있다.(귀무가설 기각)
#alternative hypothesis: true mean is not equal to 5.2
#95 percent confidence interval:
#  5.377613~5.736148  -> 구간추정(95% 신뢰구간 추정)

#sample estimates:
#  mean of x 
# 5.556881    -> 점추정 : mean값과 직접비교하여 추정 

# 점추정(point) vs 구간추정(interval estimation)
# 점추정 : 모수를 하나의 값으로 추정(평균이나 중위수 사용)
# 구간추정 : 모수가 포함될 것이라고 제시하는 구간추정(신뢰구간)

##단측검정 /. 단일표본 T검정

t.test(x1, mu=5.2, alter="greater", conf.level = 0.95)
#p-value = 7.083e-05 <0.05
#A회사의 노트북 평균 이용시간은 5.2시간보다 더 길다.

#검정 결과를 변수에 저장하여 특정 변수 확인

result <- t.test(x1, mu=5.2, alter="greater", conf.level = 0.95)
names(result)
str(result)
result$p.value 


