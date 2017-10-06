r1=list()
result=list()

for (i in 3:length(data)){
r1[[1]]<-names(data[i])
t<-table(unlist(data[i]),unlist(data[2]))
r1[[2]]<-t
s<-summary(t)
r1[[3]]<-s
or<-(t[4])/(t[2])/(t[3]/t[1])
r1[[4]]<-or
result[[i-2]]<-r1

for (i in 3:length(data)){
r1[[1]]<-names(data[i])
t<-table(unlist(data[i]),unlist(data[2]))
r1[[2]]<-t
s<-summary(t)
r1[[3]]<-s
or<-(t[2]*t[3])/(t[1]*t[4])
r1[[4]]<-or
result[[i-2]]<-r1

