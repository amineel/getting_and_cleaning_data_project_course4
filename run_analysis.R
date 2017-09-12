######
###"script to clean data: amine elaji
#####"



##import variable names
var_names<-read.table("UCI HAR Dataset/features.txt")
var_names<-var_names[,2]
#import data test
data_test<-read.table("UCI HAR Dataset/test/X_test.txt",col.names = var_names)
#import labels
label<-read.table("UCI HAR Dataset/test/y_test.txt")
#merging label and data test
data_test<-cbind(data_test,label)
#RENAMING VARIABLE OF LABEL
data_test<-rename(data_test,label=V1)
#transforming label to factors
data_test$label<-factor(data_test$label,levels=c(1:6),labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
##adding subscriber id
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
#merging data
data_test<-cbind(data_test,subject_test)
#RENAMING VARIABLE OF subject
data_test<-rename(data_test,subject_id=V1)


#import data train
data_train<-read.table("UCI HAR Dataset/train/X_train.txt",col.names = var_names)
#import labels
label<-read.table("UCI HAR Dataset/train/y_train.txt")
#merging label and data test
data_train<-cbind(data_train,label)
#RENAMING VARIABLE OF LABEL
data_train<-rename(data_train,label=V1)
#transforming label to factors
data_train$label<-factor(data_train$label,levels=c(1:6),labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
##adding subscriber id
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
#merging data
data_train<-cbind(data_train,subject_train)
#RENAMING VARIABLE OF subject id
data_train<-rename(data_train,subject_id=V1)


##merging data
data_global<-rbind(data_test,data_train)
##Extracting only the measurements on the mean and standard deviation for each measurement
means_vector<-grep("[Mm]ean",var_names)
std_vector<-grep("std()",var_names)
data_global2<-data_global[,c(means_vector,std_vector,562,563)]

##create a new data set,we can use dcat or aggregate
new_data<-aggregate(data_global2,by = list(data_global2$label,data_global2$subject_id),mean)
new_data<-rename(new_data,activity_type=Group.1,subject_id=Group.2)
new_data<-new_data[,-c(89,90)]
#tidying data
names(new_data) <- gsub(pattern="[-]", replacement="_", names(new_data))
names(new_data) <- gsub(pattern="[()]", replacement="", names(new_data))

write.table(new_data,file = "dataset.txt",row.names = FALSE)