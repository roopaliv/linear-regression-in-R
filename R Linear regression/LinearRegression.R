
library(UsingR)

#plot actual points
#first col has father'sheight in inches and last one has son's height in inches
father.son
#plot data
ggplot() + geom_point(data=father.son,aes(x=fheight,y=sheight))


#try to guess a line and plot our guessed line
x<-c(60,75)
y<-c(63,78)
line<-data.frame(x,y)
ggplot() + geom_point(data=father.son,aes(x=fheight,y=sheight))+geom_line(data=line,aes(x=x,y=y))



#plot points as per our guessed line
#by our guess slope (78-63)/(75-60) = 1 hence (y-63)/(x-60)=1 therfore line is y-63 = x-60 => y = x+3
x<-father.son$fheight
y<-father.son$sheight
group<-1:1078 # 1078 father son pairs
frame<-data.frame(x,y,group)
y<-x+3 #our guessed equation
fitted<-data.frame(x,y,group)
head(frame)
head(fitted)
ggplot()+ geom_point(data=frame, aes(x=x,y=y))+geom_point(data=fitted,aes(x=x,y=y),color="red")
x<-c(50,80) #see range of x values
y<-x+3
line<-data.frame(x,y)
ggplot()+ geom_point(data=frame, aes(x=x,y=y))+geom_point(data=fitted,aes(x=x,y=y),color="red")+geom_line(data=line,aes(x=x,y=y),color="blue")


#plot the differences or residuals for guessed line
#now we have our guessed line, we take a straight line error from each data point to the line on both ends
differences<-rbind(frame,fitted) #remember variables shall have same names in dataframes to bind those togethre i.e.x,y and group in this case
ggplot()+ geom_point(data=frame, aes(x=x,y=y))+geom_point(data=fitted,aes(x=x,y=y),color="red")+geom_line(data=line,aes(x=x,y=y),color="blue")+geom_line(data=differences,aes(x=x,y=y,group=group),color="darkorchid2")


#to see how well the line fits lets square all differences/residuals, we need a line with minimum square errors
sum((fitted$y-frame$y)^2)
#to find the best fitting line R has built in function for linear model
fit <- lm(y~x,frame)
intercept<-fit$coefficients[1]
slope<-fit$coefficients[2]
x<-c(57,78)
y<-x*slope+intercept
best_fitting_line<-data.frame(x,y)
ggplot()+ geom_point(data=frame, aes(x=x,y=y))+geom_point(data=fitted,aes(x=x,y=y),color="red")+geom_line(data=line,aes(x=x,y=y),color="blue")+geom_line(data=differences,aes(x=x,y=y,group=group),color="darkorchid2")+geom_line(data=best_fitting_line,aes(x=x,y=y),color="dodgerblue1")

#plot points as pr this best line
x<-father.son$fheight
y<-x*slope+intercept #our best fitting equation
best_fitted<-data.frame(x,y,group)
ggplot()+ geom_point(data=frame, aes(x=x,y=y))+geom_point(data=fitted,aes(x=x,y=y),color="red")+geom_line(data=line,aes(x=x,y=y),color="blue")+geom_line(data=differences,aes(x=x,y=y,group=group),color="darkorchid2")+geom_line(data=best_fitting_line,aes(x=x,y=y),color="dodgerblue1")+geom_point(data=best_fitted,aes(x=x,y=y),color="goldenrod1")

#plot differences for ths best line
least_differences<-rbind(frame,best_fitted)
ggplot()+ geom_point(data=frame, aes(x=x,y=y))+geom_point(data=fitted,aes(x=x,y=y),color="red")+geom_line(data=line,aes(x=x,y=y),color="blue")+geom_line(data=differences,aes(x=x,y=y,group=group),color="darkorchid2")+geom_line(data=best_fitting_line,aes(x=x,y=y),color="dodgerblue1")+geom_point(data=best_fitted,aes(x=x,y=y),color="goldenrod1")+geom_line(data=least_differences,aes(x=x,y=y,group=group),color="firebrick4")


#plot finally without guess
ggplot()+ geom_point(data=frame, aes(x=x,y=y))+geom_line(data=best_fitting_line,aes(x=x,y=y),color="dodgerblue1")+geom_point(data=best_fitted,aes(x=x,y=y),color="goldenrod1")+geom_line(data=least_differences,aes(x=x,y=y,group=group),color="firebrick4")

