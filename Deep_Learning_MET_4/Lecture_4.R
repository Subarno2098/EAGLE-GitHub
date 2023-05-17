library(keras)
library(tensorflow)
library(tfdatasets)
library(purrr)
library(ggplot2)
library(rsample)
library(reticulate)
library(mapview)

setwd("D:/EAGLE/SS_2023/Deep_Learning_MET_4/Data/airfield_train")

r <- terra::rast("D:/EAGLE/SS_2023/Deep_Learning_MET_4/Data/airfield_train/airfield_aoi.tif")
viewRGB(as(r, "Raster"))
# ??viewRGB

## DATA PREPROCESSING
data <- rbind(
  data.frame(
    img = list.files("D:/EAGLE/SS_2023/Deep_Learning_MET_4/Data/airfield_train/instance/true",full.names = T),
    label = 1
  ),
  data.frame(
    img = list.files("D:/EAGLE/SS_2023/Deep_Learning_MET_4/Data/airfield_train/instance/false",full.names = T),
  label = 0
)
)
n_true <- length(which(data$label==1))
n_false <- length(which(data$label==0))

# stratified split
data <- initial_split(data, prop = 0.75, strata = "label")

# check whether stratified sampling worked
length(which(testing(data)$label==1))
length(which(testing(data)$label==0))
length(which(training(data)$label==1))
length(which(training(data)$label==0))






























