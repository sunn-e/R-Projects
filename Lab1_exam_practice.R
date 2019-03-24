v<- "TRUE"
print(class(v))
apple <- list(c('a','b'))
apple
class(apple)
M = matrix(c('a','b','c','d','e','g'),nrow=2,ncol=3)
M
array1<-array(c('a','b','c'), dim=c(3,2,5))
array1

apple_colors<-c("red","blue","white")
factor_apple<- factor(apple_colors)
factor_apple
nlevels(factor_apple)


#data frame function

bmi<- data.frame(
  gender =c("Male","Male","Female"),
  height=c(152,124,111),
  age=c(42,38,26),
  wgt=c(1,2,3)
  
)
bmi

sunny<-"sunny"
cat("sunny is",class(sunny),"data type\n")
ls(all.name=TRUE)
rm(sunny)
sunny
v2 <<- c(3,1,TRUE,2+3i)
v2
v1 <- c(3,1,TRUE,2+3i)
v1
v3 = c(3,1,TRUE,2+3i)
v3M = matrix( c(2,6,5,1,10,4), nrow=2,ncol=3,byrow =
                TRUE) 
t = M %*% t(M)
print(t)
