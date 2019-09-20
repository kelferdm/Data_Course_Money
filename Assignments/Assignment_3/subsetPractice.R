
####Load a csv file, read it into a new file and play arond with subsets####
# make a new operator for "not in"
'%ni%' = Negate('%in%')

pract<- read.csv("Utah_Religions_by_County.csv")

data("Utah_Religions_by_County")
pract<-read.csv("./Data/Utah_Religions_by_County.csv")

#see all column titles
names(pract)

class(pract$County)

dat[dat$Size.class %ni% levels(dat$Size.class)[6],]
pract[pract$LDS < .5,1,9]
pract[pract$County %in% c(1,9),]
##Select "LDS"
##from County
##where LDS < .75

dat[dat$Size.class %ni% levels(dat$Size.class)[6],]


pract[,c("County","LDS")]
pract[pract$LDS < "0.5",c("LDS","County")]
ggplot2::annotation_map(graphpract)
plot(x=pract$County, y=pract$LDS, main = "Non-Majority LDS Counties in Utah",xlab= "County", ylab = "LDS", col = pract$County)
plot(x=dat$Headwidth,y=dat$Mass, main = "Headwidth v. Mass", xlab = "Headwidth", ylab = "Mass", col = dat$Colony)


