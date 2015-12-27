# GettinandCleaningData
Course project for Getting and Cleaning Data.

The first line of the R script removes all variables and objects in the current environment to make sure there are no overlap issues. The dplyr package is then loaded as it is needed for the script to run.

1. Reading data.
 * Each text file is read into R using the read.table command. The default seperator value is used (whitespace).
 * The training and test sets are then combined with the subject and activity vectors using cbind to create the combined training and test data sets.
 * The training and test sets are then concatenated using rbind to create a total data set that has a column indicating subject, a column indicating activity, and 561 feature columns.
 * The names for the feature columns are taken from the features.txt file, with the first two columns being named "subject" and "activity".

2. Subsetting for mean and stdev
 * grep was used on the column names of the data set to subset for features containing the mean() and std() of the variables. Only featuers that included the mean of measured values (as opposed to mean of calculated values) were selected, since the latter do not inlcude standard deviations.

3. Renaming the activity column
 * First the second column, containing the numbers for each activity, was converted to factors using as.factor.
 * The activity labels were taken directly from the activity_labels.txt file, since those already seemed to be descriptive.
 * The revalue() function from the dplyr package was then used to rename the factors in the column to descriptive factors.

4. Creating new tidy data set
 * The subject vector is also converted to a factor using as.factor to allow for grouping.
 * The group_by function in dplyr is then used to group the data by subject first, and by activity second.
 * summarize_each is then used throught the pipe operator to calculate the mean of the grouped variables.
 * The table is then exported using write.table
 
