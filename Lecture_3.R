installed.packages()
install.packages(c("keras","magick"))
library(keras)
library(magick)

install_keras

# MNIST dataset
mnist <- dataset_mnist()

mnist$train


xtrain <- mnist$train$x
ytrain <- mnist$train$y

xtest <- mnist$test$x
ytest <- mnist$test$y

i = 6000
arr <- array(rep(xtrain[i,,],3), c(28,28,3))

plot(image_read(arr/255))
ytrain[i]     

dim(xtrain)     

xtrain <- array_reshape(xtrain,
                        dim = c(nrow(xtrain), 28*28))

xtest <- array_reshape(xtest,
                        dim = c(nrow(xtest), 28*28))

dim(xtrain)
# rescale to a value range from 0 to 1
xtrain <- xtrain/255
xtest <- xtest/255


# Convert y to a categorical variable
ytrain <- to_categorical(ytrain, 10)
dim(ytrain)
ytrain[i,]
ytest <- to_categorical(ytest, 10)

# Build neural Network
model <- keras_model_sequential()

# Network design 
model %>% 
  layer_dense(units = 256, activation = "relu", input_shape = 784) %>% 
  layer_dense(units = 128, activation = "relu") %>% 
  layer_dense(units = 10, activation = "softmax")
summary(model)

# Learning Design
model %>%  compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_rmsprop(),
  metrics = "accuracy"
  
)

# learning
history <- fit(
  model, xtrain, ytrain, 
  epochs = 10, batch_size = 128, 
  validation_split = 0.2
)

evaluate(model, xtest, ytest)
ytest_hat <- predict(model, xtest)
ytest_hat <- as.numeric(k_argmax(ytest_hat))

ytest_hat[200]
mnist$test$y[200]

dim(ytest_hat)

# Loss function
# Optimizer
# Number of iterations
# Batch Size 

# EXERCISE
# changing the activation function to "sigmoid"

# Network design 
model %>% 
  layer_dense(units = 256, activation = "sigmoid", input_shape = 784) %>% 
  layer_dense(units = 128, activation = "sigmoid") %>% 
  layer_dense(units = 10, activation = "sigmoid")
summary(model)

# Learning Design
model %>%  compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_rmsprop(),
  metrics = "accuracy"
  
)

# learning
history <- fit(
  model, xtrain, ytrain, 
  epochs = 10, batch_size = 128, 
  validation_split = 0.2
)

evaluate(model, xtest, ytest)
ytest_hat <- predict(model, xtest)
ytest_hat <- as.numeric(k_argmax(ytest_hat))

ytest_hat[200]
mnist$test$y[200]

dim(ytest_hat)


# EXERCISE
# changing the activation function to "sigmoid", changing the bathc size

# Network design 
model %>% 
  layer_dense(units = 256, activation = "sigmoid", input_shape = 784) %>% 
  layer_dense(units = 128, activation = "sigmoid") %>% 
  layer_dense(units = 10, activation = "sigmoid")
summary(model)

# Learning Design
model %>%  compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_rmsprop(),
  metrics = "accuracy"
  
)

# learning
history <- fit(
  model, xtrain, ytrain, 
  epochs = 10, batch_size = 128, 
  validation_split = 0.5
)

evaluate(model, xtest, ytest)
ytest_hat <- predict(model, xtest)
ytest_hat <- as.numeric(k_argmax(ytest_hat))

ytest_hat[200]
mnist$test$y[200]

dim(ytest_hat)

