plot_A<-ggplot(ta,aes(x=c("group A/B","group C"),y=sm))


+geom_bar(stat="identity",width=0.5)
+ylab("")+xlab("Breath")
+theme(axis.text.x=element_text(size=12,face="bold"),
	axis.text.y=element_text(size=12,face="bold"))

+scale_x_continuous(breaks=seq(0,1))
+theme(panel.background=element_rect(size=0.01))

#全畫在同一張
plot_dengue<-ggplot(ta,aes(x=type,y=total_mean,fill=degree))
+geom_bar(stat="identity",width=0.5,position="dodge")

#分開畫
plot_dengue<-ggplot(subset(ta,type == "Breath"))+
geom_bar(aes(degree,total_mean),stat="identity",width=0.5)+
geom_errorbar(aes(x= degree,ymax=total_mean+total_sd, ymin=total_mean),width=0.3)+
theme(axis.text.x=element_text(size=12,face="bold"),
	axis.text.y=element_text(size=12,face="bold"),
	axis.title.x=element_text(face="bold",size=25))+
ylab("")+xlab("Breath")

#mean+sd
for (i in 1:76){
plot_dengue<-ggplot(subset(ta,type==type[i]))+
		 geom_bar(aes(degree,total_mean),stat="identity",width=0.5)+
		 geom_errorbar(aes(x= degree,ymax=total_mean+total_sd, ymin=total_mean),width=0.3)+
		 theme(axis.text.x=element_text(size=12,face="bold"),
			 axis.text.y=element_text(size=12,face="bold"),
			 axis.title.x=element_text(face="bold",size=25))+
		 ylab("")+xlab(ta$type[i])
jpeg(paste(i,paste(ta$type[i],"jpg",sep="."),sep="-"))
plots<-multiplot(plot_dengue,cols=1)
dev.off()
}

#mean_normalization
for (i in 1:76){
plot_dengue<-ggplot(subset(ta,type==type[i]))+
		 geom_bar(aes(degree,n_tmean),stat="identity",width=0.5)+
		 theme(axis.text.x=element_text(size=12,face="bold"),
			 axis.text.y=element_text(size=12,face="bold"),
			 axis.title.x=element_text(face="bold",size=25))+
		 ylab("")+xlab(ta$type[i])
jpeg(paste(i,paste(ta$type[i],"jpg",sep="."),sep="-"))
plots<-multiplot(plot_dengue,cols=1)
dev.off()
}




