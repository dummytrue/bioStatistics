result=list()
r1=list()
for (i in 2:length(data)){
r1[[1]]<-names(data[i])
umodel<-glm(formula=dengue_degree~data[,i],
		data=data,
		family=binomial(link="logit"),
		na.action=na.exclude)
r1[[2]]<-summary(umodel)
result[[i-1]]<-r1
}