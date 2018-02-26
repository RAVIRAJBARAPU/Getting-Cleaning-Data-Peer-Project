setwd("D:/Ravi/Readfin/CE/FEB_G&C-Data/UCI HAR Dataset")
# Read the required information 
TB_activity <- read.table ("activity_labels.txt")
TB_features <- read.table ("features.txt")
# Read all the training set details
TB_X_train <- read.table ("train/X_train.txt")
TB_y_train <- read.table ("train/y_train.txt")
TB_subject_train <- read.table ("train/subject_train.txt")
# Read all the test set details
TB_X_test <- read.table ("test/X_test.txt")
TB_y_test <- read.table ("test/y_test.txt")
TB_subject_test <- read.table ("test/subject_test.txt")
# Add names to the un named columns for all the data
TB_activity[,2] <- as.character(TB_activity[,2])
TB_features[,2] <- as.character(TB_features[,2])
colnames(TB_X_train) <- TB_features[,2] 
colnames(TB_y_train) <-"activityId"
colnames(TB_subject_train) <- "subjectId"
colnames(TB_X_test) <- TB_features[,2] 
colnames(TB_y_test) <- "activityId"
colnames(TB_subject_test) <- "subjectId"
colnames(TB_activity) <- c('activityId','activityType')
# Merging the data sets
Train <- cbind(TB_X_train,TB_y_train,TB_subject_train)
Test <- cbind(TB_X_test,TB_y_test,TB_subject_test)
TB_All <- rbind(Train,Test)
# Extracts only the measurements on the mean and standard deviation for each measurement. 
colnames <- colnames(TB_All)
Mean_SD <- grep(".*mean.*|.*std.*|.*activityId.*|.*subjectId.*", colnames)
a<- c(Mean_SD)
TB_subset <- TB_All[,a]
colnames_subset <- colnames(TB_subset)
colnames_subset.names = gsub('-mean', 'Mean', colnames(TB_subset))
colnames_subset.names = gsub('-std', 'Std', colnames(TB_subset))
colnames_subset.names = gsub('[-()]', '', colnames(TB_subset))
colnames(TB_subset) <- colnames_subset.names
# Uses descriptive activity names to name the activities in the data set & Appropriately labels the data set with descriptive variable names.
library(reshape2)
TB_subset$activityId <- factor(TB_subset$activityId, levels = TB_activity[,1], labels = TB_activity[,2])
TB_subset$subjectId <- as.factor(TB_subset$subjectId)
TB_Subset.melted <- melt(TB_subset, id = c("activityId","subjectId"))
# independent tidy data set with the average of each variable for each activity and each subject
TB_Subset.mean <- dcast(TB_Subset.melted, subjectId + activityId ~ variable, mean)
write.table(TB_Subset.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
