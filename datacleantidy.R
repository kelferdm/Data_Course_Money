

##find new messy data files ####
fns<- list.files(".", pattern = "Messy", full.names = TRUE,recursive = TRUE)
fns

#Load them
read.csv(fns[1])

#since is not csv, then sep by space
#look at head of file to see what format it is in
?read.csv
messy <- read.delim(fns[1], sep = " ")



#convert all "-999.999" to NAs

library(dplyr)

##df %>%
##mutate_all(messy(ifelse(. == -999.99, NA, .)))

## find particular values and replace them with specific value

messy <- messy %>% replace(.== -99.99, NA)
messy <- messy %>% replace(.== -999.99, NA)

#remove a full row of data based on particular entry
messy.subset <- messy[messy$qcflag != "*..",]

##dplyr way to remove a full row of data based on a particular entry 
messy <- messy %>% filter(qcflag != "*..")


##first method with subset is better for large data sets bc finds the column named value and replace it with new column name
names(messy)[names(messy) == "value"] <- "CO2_ppm"

#easier way to change name but is not useful if too many columns to count or you aren't sure of what # of column is
names(messy)[8]<-"CO2_ppm"

##### make date column
paste(messy$year, messy$month, messy$day, sep = "-")

# tidy way to make a date
messy <- messy %>% mutate(Date = as.POSIXct(paste(year,month,day,sep = "-")))


#run library to use ggplot
library(tidyr)
library(ggplot2)

#plot data
ggplot(messy,aes(x=Date,y=CO2_ppm))+
  geom_point()

#date formatting 
#if found in strange formatting 
#ex "2019/03-12"
#as.POSIXct(date1,format='%Y/%m-%d')




library(skimr)

##climate data map files
fnb <- list.files("./Data/Climap_Data", full.names = TRUE, pattern = "edited")
fnb
dat <- read.delim(fnb[5], sep = ",", header = FALSE)
fnb[5:24]

for(i in fnb[5:24]) {
  assign(paste0("fn", basename(i)), value= read.delim(i,sep = ",",header = False),envir = .GlobalEnv) }

rbind(fnf002.edited,fnf003.edited, fnf004.edited, fnf005.edited, fnf006.edited, fnf007.edited,fnf008.edited,fnf009.edited,
      fnf010.edited,fnf011.edited,fnf012.edited)


