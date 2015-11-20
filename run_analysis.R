



# Read Activiy Labels into factors
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
activity_labels

# Read Features into factors
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
features

# Pattern Matching for mean and std values in features
features_matched <- grepl("mean|std",features)

# Read X,Y, and Subject test data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

head(x_test)
head(y_test)
head(subject_test)

# Add Column names to X_test and multiply with T/F Vector containing mean/std only
names(x_test) <- features
x_test_matched <- x_test[,features_matched]

# Add actvity labels to Y_test
y_test[,2] <- activity_labels[y_test[,1]]

# Assign column names to Y_test and subject_test 
names(y_test) = c("activity_ID", "activity_Label")
names(subject_test) = "Subject"



#####################

# Bind all data tables
data <- cbind(as.data.table(subject_test), y_test, x_test_matched)

# Load and process X_train & y_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Load column names into X_train
names(X_train) = features

# Add Column names to X_train and multiply with T/F Vector containing mean/std only
X_train_matched = X_train[,features_matched]

# Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train_matched)

# Merge test and train data
data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(train_data), id_labels)
melt_data      = melt(train_data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")











