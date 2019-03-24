library(dplyr)
df <- mtcars %>% select(-c(am,vs,cyl,gear,carb))
df
glimpse(df)
str(df)
model<-mpg~disp+hp+drat+wt
fit <-lm(model,df)
fit