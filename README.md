# Getting-Cleaning-Data-Peer-Project
# Read the Required Information

STEP 1: (Reading required information)
TB_activity:
Read the information from the file activity as a table format.
TB_features:
Read the information from the file features as a table format.
STEP 2: (Reading training set information)
TB_X_train:
Read the information from the file X_train as a table format.
TB_y_train:
Read the information from the file y_train as a table format.
TB_subject_train:
Read the information from the file subject_train as a table format.
STEP 3: (Reading test set information)
TB_X_test:
Read the information from the file X_test as a table format.
TB_y_test:
Read the information from the file y_test as a table format.
TB_subject_test:
Read the information from the file subject_test as a table format.
STEP 4: (Add names to the unnamed columns for the files loaded in R)
STEP 5: (Merging all the training set information & test set information)
Train: The final training set, which has the information of all the three sets. (Obtained by binding the columns)
Test:  The final test set, which has the information of all the three sets. (Obtained by binding the columns)
TB_All:Dataframe contains the information of both the training set & test set, obtained as a result of binding the rows of Train & Test set. 
STEP 6: (Extracts only the measurements on the mean and standard deviation for each measurement)
colnames: The list that was used to store the column names of complete dataset.
Mean_SD: List which gives the column number of the parameter that contains either meam,std,activityId & subjectId
a: Vector used to store the column number
TB_subset: subset drew from the main set to store the mean & standard deviation measurements.
colnames_subset: Variable used to store the column names of the subset, for further tidying the column names.
STEP 7:
TB_subset.melted: Used for melting the data of subset, such that each row represents a unique id-variable combination.
STEp 8:
TB_Subset.mean: casted dataframe with subjectid+activityid ~ variables while calculating mean.

