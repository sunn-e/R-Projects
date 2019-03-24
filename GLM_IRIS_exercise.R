
library(dplyr)
library('ggplot2')
data(iris)
head(iris)

#visialized the data
ggplot(iris, aes(x= Petal.Length, y=Sepal.Length , colour = Species)) +geom_point() + ggtitle('Iris species by Petal and Sepal Length')


#I’ll first create a dummy variable for versicolors. Then we’ll fit our model, and assume any observation who’s predicted probability is greater than one-half is a versicolor. Finally, we’ll examine our type 1 and type 2 errors.

iris[['Is.Versicolor']] <- as.numeric(iris[['Species']] == 'versicolor')
fit.lm <- lm(Is.Versicolor ~ Petal.Length + Sepal.Length, data = iris)
summary(fit.lm)
fit.lm
#
iris[['Predict.Versicolor.lm']] <- as.numeric(predict(fit.lm) >0.5)
table(iris [,c('Is.Versicolor','Predict.Versicolor.lm')])


#the model has 
#poor predictive power. We correctly classified 92 species with only 3 true
#positives. That’s  bad. 
#We could refine our model, but instead,
#let’s attempt logistical regression.

fit.logit<- glm(Is.Versicolor~ Petal.Length + Sepal.Length, data = iris, family = binomial (link='logit'))

summary(fit.logit)
fit.logit

iris[['Predict.Versicolor.logit']] <- as.numeric(predict(fit.logit) >0.5)
table (iris [, c('Is.Versicolor','Predict.Versicolor.logit')])

cor(iris[,c('Petal.Length','Sepal.Length')])


#df <- mtcars %>% select(-c(am,vs,cyl,gear,carb))
#df
#glimpse(df)
#str(df)
#model<-mpg~disp+hp+drat+wt
#fit <-lm(model,df) #(formula,data)
#fit