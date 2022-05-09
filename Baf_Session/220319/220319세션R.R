# ????(0) ?̰?(1)
set.seed(11)

y = c(rep(0, 15),
      rep(1, 50))

y = as.factor(y)

math = c(rnorm(15, 50, 15),
         rnorm(50, 70, 12))

eng = c(rnorm(15, 70, 12),
        rnorm(50, 60, 18))

data = data.frame(y, math, eng)

plot(data$math, data$eng,
     col=as.numeric(data$y))

#########################
##### 1. ???????ø? #####
#########################

# 1. ???????????ø?

table(data$y)

문과 = data[1:15, ]
new_이과 = data[sample(16:65, 15), ]
data11 = rbind(문과, new_이과)

plot(data11$math, data11$eng,
     col=as.numeric(data11$y))

# ?Ź? ?ٲ?
glm(y~math+eng, data = data11, family = binomial)


# 2. Tomek Link
install.packages("UBL")
library(UBL)

# ???? 1�� ??��?ϴ? TomekClassif
TL = TomekClassif(y~., dat = data, Cl = 1)
data12 = TL[[1]]

plot(data12$math, data12$eng,
     col=as.numeric(data12$y))


######table(data12$y)###################
##### 2. ?��????ø? #####
#########################

# 1. ?????��????ø?

table(data$y)

new_???? = data[samp문과5, 50, replace=T), ]
?̰? = data[16:6이과
data21 = rbind(new_????, ?̰?)

plo문과ta이과ath, data21$eng,
     col=as.numeric(data21$y))

# ?????þ? ?????? ?߰?(jitter?? ?????ص? ??)
new_???? = data[samp문과5, 50, replace=T), ]
new_????$math = new_문과$math + rnor문과, 0, 1)
new_????$eng = new_?문과eng + rnorm문과 0, 1)
data21 = rbind(new_????, ?̰?)

plo문과ta이과ath, data21$eng,
     col=as.numeric(data21$y))


# 2. SMOTE
# install.packag("smotefamily")
library(smotefamily)

data22 = SMOTE(data[,2:3], as.numeric(data$y))$data

colnames(data22data22)[3] = "y"
data22$y = as.factor(as.numeric(data22$y)-1)

plot(data22$math, data22$eng,
     col=as.numeric(data22$y))
