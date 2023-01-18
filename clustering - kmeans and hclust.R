#clustering
#hclust
library(dplyr)
library(ggplot2)
head(mtcars)
colnames(mtcars)
dim(mtcars)
#step1: distmatrix
dist_matrix<-dist(mtcars,method='euclidean')
dist_matrix
#step2:model
#help(hclust) for params list
hclust_model<-hclust(dist_matrix,method='average')
summary(hclust_model)
plot(hclust_model)
#now to group into clusters
#let k be no of clusters
rect.hclust(hclust_model,k=3)
fit<-cutree(hclust_model,k=3)
print(fit)


#kmeans
library(cluster)
library(ClusterR)#capital C

head(iris)#inbuilt dataset

colnames(iris)
dim(iris)

attributes<-iris[,1:4]
target<-iris[,5]
kmeans_model<-kmeans(attributes,centers=3,nstart=20)
summary(kmeans_model)
print(kmeans_model$cluster)
cm<-table(target,kmeans_model$cluster)
cm
#plot
clusplot(iris,kmeans_model$cluster)


