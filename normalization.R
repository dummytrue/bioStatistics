
for (i in 2:77){
jpeg(paste(i,paste(names(data[i]),"jpg",sep="."),sep="-"))
hist(data[,i],prob=TRUE,
	main=paste("normalization test of",names(data[i])),
	xlab=names(data[i]),
	ylab="probability")
curve(dnorm(x,mean(data[,i],na.rm=T),sd(data[,i],na.rm=T)),add=TRUE, col="red")
dev.off()
}


for(i in 2:77){
histplot<-ggplot(data=data,mapping=aes(data[,i]))+
	    geom_histogram(mapping=aes(y=..density..),binwidth=2,na.rm=T)+
	    stat_function(fun=dnorm,args=list(mean(data[,i],na.rm=T),sd(data[,i],na.rm=T)),color="red")
jpeg(paste(i,paste(names(data[i]),"jpg",sep="."),sep="-"))
plots<-multiplot(histplot,cols=1)
dev.off()
}
