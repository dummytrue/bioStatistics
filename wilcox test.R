data=read.csv("continous type_data.csv",header=T,sep=",")
attach(data)
result=list()
r1=list()
for (i in 2:length(data)){
r1[[1]]=names(data[i])
r1[[2]]=wilcox.test(data[,i]~dengue_degree,alternative="two.sided",exact=NULL)
result[[i-1]]=r1
}