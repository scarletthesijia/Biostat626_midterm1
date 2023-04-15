README.md
================
Scarlett He
2023-04-05

# Binary and Multiclass Classifier using R for Human Activity Recognition

### Author : Scarlett He

This project contains R code for building binary and multi-class
classifiers that predict human activities based on sensor data captured
by a smart device worn by volunteers. The data includes 3-axial linear
acceleration and 3-axial angular velocity measurements captured at a
constant rate of 50Hz using the embedded accelerometer and gyroscope of
the device.

## Experiment design and data collection

The experiment involved recruiting a group of volunteers between the
ages of 19 and 48 to participate in six activities, three static
postures (standing, sitting, lying) and three dynamic activities
(walking, walking downstairs, and walking upstairs), as well as
recording postural transitions that occurred between the static
postures. Participants wore a smart device on their waist that captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz using the embedded accelerometer and gyroscope of the
device. The activities are considered outcomes, and the signals measured
by the smart device are considered features.

## Data Pre-processing and Description

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 seconds and 50% overlap (128 readings per window). The sensor
acceleration signal was separated into body acceleration and gravity
using a Butterworth low-pass filter into body acceleration and gravity.
A filter with a 0.3 Hz cutoff frequency was used to separate the
gravitational force which is assumed to have only low-frequency
components. A vector of 561 features was obtained from each window by
calculating variables from the time and frequency domain. Details of the
561 features can be found in files “data_dictionary.txt” and
“feature_info.txt”.

## Data Files

The experiment provides two tab-delimited text files,
“training_data.txt” and “test_data.txt”. The training data (labeled
activity information included) should be used to construct and test
machine learning algorithms. Apply the algorithms to the test data
(containing only feature information) to predict the activity
corresponding to each time window.

## Binary Classifier

The binary classifier in this project classifies each time window into
static (0) and dynamic (1) activities.

The R code for the binary classifier can be found in
‘binary_classifier.R’. The binary classifier uses a logistic regression
model to make predictions on the test data.

## Multi-Class Classifier

The multi-class classifier in this project classifies each time window
into one of the following activities: walking (1), walking upstairs (2),
walking downstairs (3), sitting (4), standing (5), lying (6), and static
postural transitions (7).

The R code for the multi-class classifier can be found in
‘multi_class_classifier.R’. The multi-class classifier uses a support
vector machine (SVM) model to make predictions on the test data.

## Usage on Classifiers

Required packages for each classifier can be found in R files.

Loading training and testing datasets are required to use these
classifiers.

``` r
train <- read.table("training_data.txt", header = TRUE)
test <- read.table("test_data.txt", header = TRUE)
```

The sample testing data provided in this project does not contain true
result for activity. If the data you use have true results, it should be
removed in prediction step. The true results can be used to test
accuracy for the model by using the R code provided below.

``` r
# The true results are named as "true_result" 
# The predicted labels are naed as "predicted" 

accuracy <- mean(predicted == true_result)
```

## Classifiers Development

More information about baseline/final algorithm, model performance, and
potential improvement can be found in file Development.

## Conclusion

With the binary and multi-class classifiers in this project, we can
predict human activities based on sensor data captured by a smart
device. We hope that this project can provide insights into human
activity recognition and contribute to the development of related
applications.

## Contributing

Contributions are welcome! Please submit a pull request with any
improvements.
