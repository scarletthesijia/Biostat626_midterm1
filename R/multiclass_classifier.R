
library(dplyr)
library(caret)
library(randomForest)
library(e1071)


train <- read.table("training_data.txt", header = TRUE)
test <- read.table("test_data.txt", header = TRUE)


train <- train %>% 
  mutate(activity = ifelse(activity %in% c(7,8,9,10,11,12), 7, activity)) 



train$activity <- factor(train$activity) 
train$activity <- as.factor(train$activity)

# Train a random forest model to select important features
rf_model <- randomForest(activity ~ ., data = train, ntree = 500, importance = TRUE)
imp_features <- importance(rf_model)
head(imp_features)
top_features <- names(sort(imp_features[, "MeanDecreaseAccuracy"], decreasing = TRUE)[1:500])

activity <- train$activity
activity <- as.data.frame(activity)

train_top <- as.data.frame(train[,c(top_features)])

train_top <- cbind(activity,train_top)

test_top <- test[,c(top_features)]



# convert the activity variable to a factor
train_top$activity <- factor(train_top$activity)

ctrl <- trainControl(method = "cv", number = 10)

svm_model_tuned <- svm(activity ~ ., data = train_top, cost = 0.1, kernel = "linear",
                       shrinking = T, trControl = ctrl)

svm_pred <- predict(svm_model_tuned, test_top, type="class")

svm_pred <- as.data.frame(svm_pred)


write.table(svm_pred, file = "multiclass_957777.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)


