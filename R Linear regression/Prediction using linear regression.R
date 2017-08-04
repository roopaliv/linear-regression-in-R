library(UsingR)

x<-father.son$fheight
y<-father.son$sheight
group<-1:1078 # 1078 father son pairs
frame<-data.frame(x,y,group)
fit <- lm(y~x,frame)
intercept<-fit$coefficients[1]
slope<-fit$coefficients[2]

given_father_height = 69
predicted_son_height = slope * given_father_height + intercept
predicted_son_height