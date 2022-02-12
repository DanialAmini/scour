graphics.off()
#
#
#
#

rm(list=ls())

setwd("C:/Users/Computer Emergency/Desktop/scourpaper/pg paper/earth")  #set working folder



rmsee <- function(error)
{
  sqrt(mean(error^2))
}



MyData = read.csv("day3.txt",header=TRUE)
names_vec=c('x1','x2','x3','x4') #case5


a <- as.formula(paste('z ~ ' ,paste(names_vec,collapse='+')))
a
model <- lm(z~x1+x2+x3+x4+x1^2+x2^2+x3^2+x4^2,data=MyData)
model <- lm(z~x1+x2+x3+x4+x1^2+x2^2+x3^2+x4^2+x1*x2+x1*x3+x1*x4+x2*x3+x2*x4+x3*x4,data=MyData)
model <- lm(z~x1+x2+x3+x4,data=MyData)

predictedY <- (predict(model, MyData))
rmse1=rmsee(MyData$z-predictedY)
plot(MyData$z,predictedY)

model <- lm(log(z)~log(x1)+log(x2)+log(x3)+log(x4),data=MyData)
predictedY <- exp(predict(model, MyData))
rmse1=rmsee(MyData$z-predictedY)
#model
plot(MyData$z,predictedY)


library("earth")



model=earth(z~x1+x2+x3+x4, data = MyData, degree = 1, nprune = NULL)
model=earth(z~x1+x2+x3+x4, data = MyData, degree = 1, nprune = 7)

model=earth(z~x1+x2+x3+x4, data = MyData, degree = 1, nprune = NULL,nk=7)
model=earth(z~x1+x2+x3+x4, data = MyData, degree = 2, nprune = NULL,nk=7)
model=earth(z~log(x1)+log(x2)+log(x3)+log(x4), data = MyData, degree = 2, nprune = 7)
model=earth(z~log(x1)+log(x2)+log(x3)+log(x4), data = MyData, degree = 1)
model=earth(z~x1+x2+x3+x4, data = MyData, degree = 1,nprune=7)
model=earth(z~x1+x2+x3+x4, data = MyData, degree = 2,nprune=7)
model=earth(z~x1+x2+x3+x4, data = MyData, degree = 3,nprune=7)
model=earth(z~log(x2)+log(x4), data = MyData, degree = 3,nprune=5)
model=earth(z~x1+x2+x3+x4, data = MyData, degree = 3,nprune=7)
model=earth(z~x1+x2+x3+x4, data = MyData, degree = 4,nprune=17)
model=earth(z~(x1)+tan(x2)+exp(-x3)+exp(-x4), data = MyData, degree = 2,nprune=7)

model=earth(z~tanh(x1/20+0.5)+tanh(x2/20+0.5)+tanh(x3/20+0.5)+tanh(x4/20+0.5), data = MyData, degree = 4,nprune=10)
model=earth(z~tanh(x1)+tanh(x2)+tanh(x3)+tanh(x4), data = MyData, degree = 1,nprune=6)

predictedY =(predict(model, MyData))
rmse1=rmsee(MyData$z-predictedY)
rmse1
plot(MyData$z,predictedY)

summary(model,style="C")

model=earth(log(z)~log(x1)+log(x2)+log(x3)+log(x4), data = MyData, degree = 3,nprune=10)
model=earth(log(z)~log(x1)+log(x2)+log(x3)+log(x4), data = MyData, degree = 3,nprune=5)
model=earth(log(z)~x1+x2+x3+x4, data = MyData, degree = 3,nprune=8)
model=earth(log(z)~x1+x2+x3+x4, data = MyData, degree = 1,nprune=8)
model=earth(log(z)~log(x1)+log(x2)+log(x3)+log(x4), data = MyData, degree = 1,nprune=5)
model=earth(log(z)~log(x1)+log(x2)+log(x3)+log(x4), data = MyData, degree = 2,nk=10)



predictedY <- exp(predict(model, MyData))
rmse1=rmsee(MyData$z-predictedY)
rmse1
plot(MyData$z,predictedY)
summary(model,style="C")


#logistic = 1/(1+exp(-x)), tanh(x)

#model    linear extended linear   NN1     NN2     NN3     NN4
#rmse    

###
kkk=1

#for sensitivity analysis
#uncomment the following 3 lines in case of sensitivity analysis


length(names_vec)


#a

plotter_ <- function(){

	graphics.off()
	dev.new(xpos=600,width=4.5,height=4.5)

	axislimit_u= max( max(MyData$z),max(pr.nn[[2]]))
	axislimit_l= min( min(MyData$z),min(pr.nn[[2]]),0)
	xlim_=c(axislimit_l,axislimit_u)
	plot(MyData$z,pr.nn[[2]],xlim=xlim_,ylim=xlim_)
	lines(c(0,axislimit_u),c(0,axislimit_u),col="red")
	lines(c(0,axislimit_u),c(0,axislimit_u*1.2),lty=2,col="red")
	lines(c(0,axislimit_u),c(0,axislimit_u*.8),lty=2,col="red")
	title(paste("train-rmse",round(rmse1,2)))

	dev.new(xpos=50,width=4.5,height=4.5)

	axislimit_u= max( max(MyData2$z),max(pr.nn2[[2]]))
	axislimit_l= min( min(MyData2$z),min(pr.nn2[[2]]),0)
	xlim_=c(axislimit_l,axislimit_u)
	plot(MyData2$z,pr.nn2[[2]],xlim=xlim_,ylim=xlim_)
	lines(c(0,axislimit_u),c(0,axislimit_u),col="red")
	lines(c(0,axislimit_u),c(0,axislimit_u*1.2),lty=2,col="red")
	lines(c(0,axislimit_u),c(0,axislimit_u*.8),lty=2,col="red")
	title(paste("test-rmse=",round(rmse2,2)))

}

library("NeuralNetTools")

#############################################

while(0<1){
i=0
while(i+0*25000<250){
	i=i+1
	net.sum <- neuralnet(a,data=MyData,hidden=3,act.fct="logistic");
	pr.nn <- compute(net.sum,MyData[,1:length(names_vec)]);
	if(rmsee(MyData$z-pr.nn[[2]])<kkk){
		#print(rmsee(MyData$z-pr.nn[[2]]))
		print(Sys.time())
		kkk=rmsee(MyData$z-pr.nn[[2]])
		rmse1=kkk

		pr.nn2 <- compute(net.sum,MyData2[,1:length(names_vec)]);
		rmse2=rmsee(MyData2$z-pr.nn2[[2]])
	
		#print(net.sum$weights)
		printNN(net.sum)
		plotter_()

		if ( i > 40 && rmse2>0.165) {
			break
		}
		if (rmse2<0.165 && rmse1<0.11){
			plotter_()

			dev.new(xpos=1050,width=5,height=6)
			plotnet(net.sum)


			dev.new(ypos=500,xpos=1320,width=2, height=2)
			garson(net.sum)

			printNN(net.sum)

			break
		}
	}
}
if (rmse2<0.165){
break
}
}

#pr.nn
#as.numeric(pr.nn)
#############################################



