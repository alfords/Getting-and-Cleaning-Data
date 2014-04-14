
# Read feature names and activity names
features <- read.table("features.txt")
features_name <- features[, 2]
activity_labels <- read.table("activity_labels.txt")
activity_name <- activity_labels[, 2]

# Read train, test values and labels
train_value <- read.table("train/X_train.txt")
train_label <- read.table("train/y_train.txt")
test_value <- read.table("test/X_test.txt")
test_label <- read.table("test/y_test.txt")

# Uses descriptive activity names to name the activities in the data set
train_label <- factor(train_label[,1], labels=activity_name)
test_label <- factor(test_label[,1], labels=activity_name)

# Make names of value to be feature names
names(train_value) <- features_name
names(test_value) <- features_name

# Choose the features on the mean and standard deviation for each measurement.
target <- grep("mean\\(\\)|std\\(\\)", features_name)

# Bind values and labels, also extracts the mean and std data
train_data <- cbind(train_label, train_value[, target])
test_data <- cbind(test_label, test_value[, target])

# Make name of label data to be "activity"
names(train_data)[1] <- "activity"
names(test_data)[1] <- "activity"

# Bind train data and test data
clean_data <- rbind(train_data, test_data)

# Create new clean data into "clean_data.txt"
write.table(clean_data, "clean_data.txt")
