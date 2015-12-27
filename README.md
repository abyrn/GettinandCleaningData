# GettinandCleaningData
Course project for Getting and Cleaning Data.

1. Reading data.
 * Each text file is read into R using the read.table command. The default seperator value is used.
 * The training and test sets are then combined with the subject and activity vectors using cbind to create the combined training and data sets.
 * The training and test sets are then concatenated using rbind to create a total data set that has a column indicating subject, a column indicating activity, and 561 feature columns.
 * The names for the feature columns are taken from the features.txt file, with the first two columns being named "subject" and "activity"

2.  
 
