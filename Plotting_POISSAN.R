temp<-c(6.5,9.1,13.2,15.7,34.2,32)
beers<-c (5285,9133,15198,20676,5742,8807)

plot(temp,beers)
scatter.smooth(temp,beers)

fit1.glm<- glm(beers~temp,family='poisson')

plot(fit1.glm)

fit1.glm
fit2.glm<- glm(beers~poly(temp,2),family='poisson')
fit2.glm
summary(fit2.glm)

anova(fit2.glm, test = 'Chi')
summary(fit2.glm)
#create x with high res
xvals <- seq(5,35, 0.1)

yvals <- predict(fit2b.glm, list(temp = xvals), type = 'response')

#findin optimum temp

#############################################
#binary lo regre
#trials=one/observ
#
#
#############################################
