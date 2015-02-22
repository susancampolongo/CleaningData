run_analysis<- {
    features<-read.table("./CleaningData/UCI_HAR_Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
    subject_test<-read.table("./CleaningData/UCI_HAR_Dataset/test/subject_test.txt", header=FALSE, col.names="Subject")
    x_test<-read.table("./CleaningData/UCI_HAR_Dataset/test/X_test.txt", header=FALSE, col.names=features[,2])
    y_test<-read.table("./CleaningData/UCI_HAR_Dataset/test/Y_test.txt", header=FALSE, col.names="Activity")
    subject_train<-read.table("./CleaningData/UCI_HAR_Dataset/train/subject_train.txt", header=FALSE, col.names="Subject")
    x_train<-read.table("./CleaningData/UCI_HAR_Dataset/train/X_train.txt", header=FALSE, col.names=features[,2])
    y_train<-read.table("./CleaningData/UCI_HAR_Dataset/train/Y_train.txt", header=FALSE, col.names="Activity")
    data_test<-cbind(subject_test, y_test, x_test)
    data_train<-cbind(subject_train, y_train, x_train)
    data_full<-rbind(data_test, data_train)
    library(dplyr)
    data_ordered<-arrange(data_full, Subject, Activity)
    df<-data_ordered[,grep("Subject|Activity|mean|std", names(data_ordered))]
    df<-df[,-grep("meanFreq", names(df))]
    df$Activity[df$Activity==1]<-"WALKING"
    df$Activity[df$Activity==2]<-"WALKING_UPSTAIRS"
    df$Activity[df$Activity==3]<-"WALKING_DOWNSTAIRS"
    df$Activity[df$Activity==4]<-"SITTING"
    df$Activity[df$Activity==5]<-"STANDING"
    df$Activity[df$Activity==6]<-"LAYING"
    data<-tbl_df(df)
    by_sub_act<-group_by(data, Subject, Activity)
    tidydata<-summarise_each(by_sub_act, funs(mean))
    print(tidydata)
}
