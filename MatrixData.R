y<-matrix(1:120,nrow=5,ncol=4,byrow=TRUE)
y
cells<-c(1,26,24,68)
rnm <-c("baban","naman")
cnm <-c("karan","bablu")
mymatrix <- matrix(cells,nrow=2,ncol=2, dimnames=list(cnm,rnm))
mymatrix

x<-y
x[,4]
x[3,]
x[2:4,1:3]


d<-c(1,2,3,4)
e<-c("red","white","red",NA)
f<-c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(d,e,f)
mydata

names(mydata)<-c("ID","color","passed")
mydata


w<-list(name="Fred", mynumbers=d,mat =mymatrix)
w[0]
