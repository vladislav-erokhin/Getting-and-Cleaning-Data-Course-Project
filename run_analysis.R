# Course project instructions:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

library("dplyr")

# Load and merge training and test sets ('train/X_train.txt', 'test/X_test.txt').
X_train <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"))
X_test <- read.table(file.path("UCI HAR Dataset", "test", "X_test.txt"))
X_data <- rbind(X_train, X_test)

# Load column names from 'features.txt' and sets them to dataset. 
# (Appropriately labels the data set with descriptive variable names).
names(X_data) <- read.table(file.path("UCI HAR Dataset", "features.txt"))[,2]

# Extract only the measurements on the mean and standard deviation for each measurement
X_data1 <- X_data[, grepl("-mean\\(|-std\\(", names(X_data))]

# Load and merge training and test labels ('train/y_train.txt', 'test/y_test.txt').
y_train <-read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"))
y_test <- read.table(file.path("UCI HAR Dataset", "test", "y_test.txt"))
y_data <- rbind(y_train, y_test)

# Load and set descriptive activity names from 'activity_labels.txt'.
activity_labels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"))[,2]

y_data[,2] <- activity_labels[y_data[,1]]

colnames(y_data) <- c("ActivityID", "Activity")

# Load and merge training and test subjects ('train/subject_train.txt', 'test/subject_test.txt').
subject_data <- rbind(
    read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt")),
    read.table(file.path("UCI HAR Dataset", "test", "subject_test.txt"))
)

names(subject_data) <- "Subject"

# Bind subjects, activities, and measurments into one dataset using bind_cols() function from dplyr package.
data <- bind_cols(subject_data, select(y_data, Activity), X_data1)

# Independent tidy dataset with the average of each variable for each activity and each subject
tidy <- data %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))

write.table(tidy, file = "tidy.txt", row.names = FALSE)