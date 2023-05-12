installed.packages()
install.packages(c("keras","magick"))
library(keras)
library(magick)

install_keras

# MNIST dataset
mnist <- dataset_mnist()

xtrain <- mnist$train$x
ytrain <- mnist$train$y

xtest <- mnist$test$x
ytest <- mnist$test$y

i = 6000
arr <- array(rep(xtrain[i,,],3), c(28,28,3))
plot(image_read(arr/255))
ytrain[i]     
     