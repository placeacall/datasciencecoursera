
##get a list of all feautures
features <- read.table("features.txt", header=FALSE, stringsAsFactors=FALSE)

##load activity label
activityLabel <- read.table("activity_labels.txt", header=FALSE)

##load the y training predictor value
y.train <- read.table("./train/y_train.txt", header=FALSE)
names(y.train) <- "Y"

##load the training subject feature
train.subject <- read.table("./train/subject_train.txt", header=FALSE)
names(train.subject) <- "SubjectID"

##load the training data set
train.x <- read.table("./train/X_train.txt", header=FALSE)

#Merge Training Set Activity info
y.train.activityLabel <- merge(x=y.train, y=activityLabel, by.x="Y", by.y="V1", all=TRUE)
names(y.train.activityLabel) <- c("ActivityID", "Activity")

##Combine training set
train <- cbind(train.subject, y.train.activityLabel, train.x)

##load the y testing predictor value
y.test <- read.table("./test/y_test.txt", header=FALSE)
names(y.test) <- "Y"

##load the testing subject feature
test.subject <- read.table("./test/subject_test.txt", header=FALSE)
names(test.subject) <- "SubjectID"

#Merge Testing Set Activity info
y.test.activityLabel <- merge(x=y.test, y=activityLabel, by.x="Y", by.y="V1", all=TRUE)
names(y.test.activityLabel) <- c("ActivityID", "Activity")

##load the test data set
test.x <- read.table("./test/X_test.txt", header=FALSE)

##Combine testing set
test <- cbind(test.subject, y.test.activityLabel, test.x)

##combine row bind
data <- rbind(train, test)

##rename the column names
names(data)[4:length(names(data))] <- features[, 2]

##identify listed feautures, features with mean() & std()
features.listed <- names(data)[grep("std\\(\\)|mean\\(\\)", tolower(names(data)))]

##get all listed features with mean() and std()
data.features <- data[, features.listed]

##Introduce SubjectID, ActivityID, Activity to the identified features(*mean(), *std())
data.features <- cbind(data[c(1, 3)], data.features)

##4 Appropriately labels the data set with descriptive activity names. 
##Clean up feature names
names(data.features) <- gsub("\\(\\)", "", gsub("-", ".", names(data.features)))

##load reshape2 library
library(reshape2)

##5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##Using melt and dcast to aggregate data set
data.features.melt <- melt(data.features, id=c("SubjectID", "Activity"), measure.vars=setdiff(names(data.features), c("SubjectID", "Activity")))
data.features.melt.transpose <- dcast(data.features.melt, Activity + SubjectID ~ variable, mean) 

##Write dataset to tidy.txt
write.table(data.features.melt.transpose, file = "tidy.txt", sep = ",", row.names=FALSE)
