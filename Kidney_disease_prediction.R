#we need few libraries
##class assignment to create a NN
library(matrixStats)
library(dplyr)
library('ggplot2')
library(neuralnet)


#read dataset
data = read.csv("chronic_kidney_disease_full.csv")
summary(data)
#sampling(random)
 sample_size = 0.65 * nrow(data)
 set.seed(75)
 index = sample( seqlen ( nrow (data) ), size = Sample_size)
 
 #ceationof train and test sets
 data_train = data[index,]
 data_tet = data[ -index, ]
 
 #we need to make a eural network
 #creating scaled data first
 max = apply(data, 2 , max)
 min = apply(data, 2 ,min)
 scaled = as.data.frame(scale(data, center = min, scale = max - min))
 
 #creating NN's datasets 
 train_NN = scaled[ index, ]
 test_NN = scaled [-index , ]
 
 set.seed(2)
 NN = neuralnet(class~age+bp+sg+al+su+pc+pcc+ba+bgr+bu+sc+sod+pot+hemo+pcv+wbcc+rbcc+htn+dm+cad+appet+pe+ane, hidden = 3 ,linear.output = T)
  plot(NN)
 
## Prediction using neural network

predict_testNN = compute(NN, testNN[,c(1:5)])
predict_testNN = (predict_testNN$net.result * (max(data$rating) - min(data$rating))) + min(data$rating)

plot(datatest$rating, predict_testNN, col='blue', pch=16, ylab = "predicted rating NN", xlab = "real rating")

abline(0,1)

# Calculate Root Mean Square Error (RMSE)
RMSE.NN = (sum((datatest$rating - predict_testNN)^2) / nrow(datatest)) ^ 0.5

# install relevant libraries
install.packages("boot")
install.packages("plyr")

# Load libraries
library(boot)
library(plyr)

# Initializing variables
set.seed(50)
k = 100
RMSE.NN = NULL

List = list( )

# Fit neural network model within nested for loop
for(j in 10:65){
    for (i in 1:k) {
        index = sample(1:nrow(data),j )

        trainNN = scaled[index,]
        testNN = scaled[-index,]
        datatest = data[-index,]

        NN = neuralnet(class~age+bp+sg+al+su+pc+pcc+ba+bgr+bu+sc+sod+pot+hemo+pcv+wbcc+rbcc+htn+dm+cad+appet+pe+ane, trainNN, hidden = 3, linear.output= T)
        predict_testNN = compute(NN,testNN[,c(1:23)])
        predict_testNN = (predict_testNN$net.result*(max(data$rating)-min(data$rating)))+min(data$rating)

        RMSE.NN [i]<- (sum((datatest$rating - predict_testNN)^2)/nrow(datatest))^0.5
    }
    List[[j]] = RMSE.NN
}

Matrix.RMSE = do.call(cbind, List)


med = colMedians(Matrix.RMSE)

X = seq(10,65)

plot (med~X, type = "l", xlab = "length of training set", ylab = "median RMSE", main = "Variation of RMSE with length of training set")
