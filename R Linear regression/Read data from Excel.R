#library(xlsx)
library(UsingR)
#write.xlsx(father.son, file, sheetName="/Users/paali/Documents/Work/MS Projects/Own/R Linear regression/Sheet1")
write.csv(father.son, file = "/Users/paali/Documents/Work/MS Projects/Own/R Linear regression/FSData.csv")
dat_read<-read.csv("/Users/paali/Documents/Work/MS Projects/Own/R Linear regression/FSData.csv")
dat_read