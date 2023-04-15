#Packages needed
library(dplyr)

#Load training and testing datasets
train <- read.table("training_data.txt", header = TRUE)
test <- read.table("test_data.txt", header = TRUE)

#Data preprocessing: change activity data to binary 
train <- train %>% 
  mutate(activity = ifelse(activity %in% c(4,5,6,7,8,9,10,11,12), 0, activity)) %>%
  mutate(activity = ifelse(activity %in% c(1,2,3), 1, activity))

train$activity <- as.factor(train$activity)

#Build binary classifier model 
model <- glm(activity~. , data = train, family = binomial)

#Predict using builded model on test dataset
test_probabilities <- predict(model, newdata = test, type = "response")

test_predictions <- ifelse(test_probabilities >= 0.5, 1, 0)

#Save the predicted label 
write.table(test_predictions, file = "binary_SID.txt", col.names = FALSE, 
            row.names = FALSE)
