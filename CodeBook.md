Objects name| Description | type/sise
test.set | Data from X_test.txt | list 2947x561
train.set | Data from X_train.txt | list 7352x561
test.subject | Data from subject_test | list 2947x1
train.subject| Data from subject_train | list 7352x1
test.activity | Data from y_test | list 2947x1
train.activity | Data from y_train |list 7352x1
test.total | Column concatenation of test.subject, test.activity, and test.set | list 2947x563
train.total | Column concatenation of train.subject,train.activity, and train.set | list 7352x563
data.total | Row concatenation of the test.total and train.total tables | list 10299x563
names.raw | Vaues for the row names of data.total | characer 563
sel | Indces for row names containing mean() and std() values, including the first two columns (activity and subject) | double 68
data.meanstd | Subset of data.total containing only features with mean and std values| list 10299x68
data.summary | Summary of dat.meanstd with mean values for sets grouped by subject first and activity second | list 180x68

