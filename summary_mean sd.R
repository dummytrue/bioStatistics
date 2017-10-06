f=c(0,1)
factor(f)

s1<-subset(data,dengue_degree==0)
s2<-subset(data,dengue_degree==1)

#有dengue degree欄位
total_mean<-total_sd<-c<-n_tmean<-c()
for (i in 2:length(data)){
total_mean[i-1]<-mean(s1[[i]],na.rm=T)
total_mean[i+75]<-mean(s2[[i]],na.rm=T)
n_tmean[i-1]<-total_mean[i-1]/(abs(total_mean[i-1])+abs(total_mean[i+75]))
n_tmean[i+75]<-total_mean[i+75]/(abs(total_mean[i-1])+abs(total_mean[i+75]))
total_sd[i-1]<-sd(s1[[i]],na.rm=T)
total_sd[i+75]<-sd(s2[[i]],na.rm=T)
}
ta<-data.frame(degree=rep(c("group A/B","group C"),each=76),
type=rep(names(data[2:77]),times=2),total_mean,total_sd,n_tmean)

#無dengue degree欄位
s1_mean<-s2_mean<-s1_sd<-s2_sd<-c()
for (i in 2:length(data)){
s1_mean[i-1]<-mean(s1[[i]],na.rm=T)
s2_mean[i-1]<-mean(s2[[i]],na.rm=T)
s1_sd[i-1]<-sd(s1[[i]],na.rm=T)
s2_sd[i-1]<-sd(s2[[i]],na.rm=T)
}
ta<-data.frame(type=names(data[2:77]),s1_mean,s2_mean,s1_sd,s2_sd)