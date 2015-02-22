# CleaningData
Course project

This project uses data from the UCI HAR Dataset. In this dataset, 30 individuals performed each of 6 activities (laying, sitting, standing, walking, walking downstairs, and walking upstairs) while wearing a smartphone. Measurements were collected for 561 dimensions using the smartphone's accelerometer and gyroscope. The subjects were divided into 2 groups, "test" and "train"

The run_analysis R script:

1. Loads the relevant files from the UCI HAR Dataset and assigns the appropriate column names:

features.txt - contains the names of the 561 measurements, used as the column names for the X_test and X_train datasets

subject_test.txt - subject ID numbers for the test group

X_test.txt - measurement values for the test group  

Y_test.txt - activity numbers (corresponding with the 6 activity names) for the test groups

subject_train.txt - subject ID numbers for the train group

X_train.txt - measurement values for the train group  

Y_train.txt - activity numbers (corresponding with the 6 activity names) for the train group

2.  Creates the data_test and data_train dataframes by cbinding the subject, Y, and X datasets
3.  Creates the data_full dataframe by rbinding the data_test and data_train dataframes and sorts by Subject and Activity
4.  Creates the df dataframe, which selects only those measurement columns that contain means ("mean") or standard deviations ("std"). Omits those that contain "meanFreq".
5.  Renames the activity codes (1 through 6) with their corresponding descriptive variable names.
6.  Groups the data frame by Subject and Activity, then takes the mean for each measurement by subject and activity, resulting in the tidydata dataframe.

The R script assumes that the the dplyr package is installed. To run the R script locally, replace the paths to the files listed in step 1 with the location of these files on your local machine.

As part of the assignment, a text file with the tidydata dataframe was exported and uploaded through the course website. To read the tidydata.txt file back into R, use the following code (where file_path is the location of the saved file on your local directory):
    data <- read.table(file_path, header = TRUE)
    View(data)
