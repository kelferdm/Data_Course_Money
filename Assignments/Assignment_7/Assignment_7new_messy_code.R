# Assignment 6 messy code
# Change this to "tidy" format using dplyr verbs

# There's an intuitive dplyr version for everything you see here.

# Note: Do not erase the original code, just comment it out and put your own equivalent code below each section
library(tidyr)
library(dplyr)

##########################
#        Part 1          #
##########################

# load data (wide format)
utah = read.csv("Data/Utah_Religions_by_County.csv")

utah <- read.csv("Data/Utah_Religions_by_County.csv")
names(utah)
utah_long = gather(utah,key = Religion, value = Proportion, -c(1:3) )



# subset to only counties with buddhists observed
#buddhist = utah[utah$Buddhism.Mahayana > 0,]

utah_long

BuddMah <- utah_long %>%
  filter(Religion == "Buddhism.Mahayana")

BuddMah



# order rows by population (descending)
#buddhist = buddhist[order(buddhist$Pop_2010, decreasing = TRUE),]

buddhist <- 
  arrange(BuddMah, desc(Pop_2010))

# write this new dataframe to a file
write.csv(buddhist, file = "./../Data_Course_Money/Assignments/Assignment_7/buddhist_counties.csv", row.names = FALSE, quote = FALSE)


## get group summaries of religiousity based on population ##

something=utah_long %>%
group_by(Pop_2010, Religion)%>%
summarize(mean_size = mean(Proportion))
utah_long


# utah_long %>%
#   group_by(Pop_2010, Religion) %>%
#   summarize(Proportion)
# 
# 
# 
# utah_long %>%
#   filter(Pop_2010)%>%
#   summarise(Religious)
# 
# 
# utah_long %>%
# filter(Religion) %>%
#   group_by(Pop_2010) %>%
#   summarise(MEAN_RELIGIOUS = mean(Religious))
# 
# summarise(MEAN_GPA = mean(gpa))
# 
# metadata %>%
#   group_by(cit, clade) %>%
#   summarize(mean_size = mean(genome_size, na.rm = TRUE))
# utah_long

###%>% summarize()

# divide each county into one of six groups based on populations

# note: keep these two lines the same in your updated code!
groups = kmeans(utah_long$Pop_2010,6) # clusters data into 6 groups based on proximity to mean of potential groups
utah_long$Pop.Group = groups$cluster # assigns a new variable to utah giving group for each county

# subset to each group and find summary stats on Religiosity for each
group1 = mean(utah[utah$Pop.Group == 1,]$Religious)
group2 = mean(utah[utah$Pop.Group == 2,]$Religious)
group3 = mean(utah[utah$Pop.Group == 3,]$Religious)
group4 = mean(utah[utah$Pop.Group == 4,]$Religious)
group5 = mean(utah[utah$Pop.Group == 5,]$Religious)
group6 = mean(utah[utah$Pop.Group == 6,]$Religious)

# utah$Religious
# utah%>%
# select(Pop.Group = 1)%>%
#   summarise(meanProp = mean(Proportion))


utah %>% group_by(Pop.Group) %>%
  summarize(meanreligious = mean(Religious)) %>%
  
  
  
  utah_long %>% group_by(Pop.Group) %>%
  summarize(meanreligious = mean(Religious)) %>%
  summarise(mean.pop = mean(Pop_2010))
utah_long

# group1 
# 
# utah_long%>%
# select( Pop.Group, Religion, Religious) %>%
# filter(Pop.Group == "1") %>%
#   summarise(propmean = mean(Religious))



# same, but mean population
group1.pop = mean(utah[utah$Pop.Group == 1,]$Pop_2010)
group2.pop = mean(utah[utah$Pop.Group == 2,]$Pop_2010)
group3.pop = mean(utah[utah$Pop.Group == 3,]$Pop_2010)
group4.pop = mean(utah[utah$Pop.Group == 4,]$Pop_2010)
group5.pop = mean(utah[utah$Pop.Group == 5,]$Pop_2010)
group6.pop = mean(utah[utah$Pop.Group == 6,]$Pop_2010)

utah%>%
  group_by(Pop.Group) %>%
  summarise(Mean.Pop = mean(Pop_2010))


# make data frame of each group and mean religiosity
religiosity = data.frame(Pop.Group = c("group1","group2","group3","group4","group5","group6"),
           Mean.Religiosity = c(group1,group2,group3,group4,group5,group6),
           Mean.Pop = c(group1.pop,group2.pop,group3.pop,group4.pop,group5.pop,group6.pop))

religiosity # take quick look at resulting table

religiosity2 <- utah %>%
  group_by(Pop.Group, Religious, Pop_2010)%>%
   summarize(mean.relig = mean(Religious))

religiosity2


# order by decreasing population
#religiosity = religiosity[order(religiosity$Mean.Pop, decreasing = TRUE),]

#religiosity # take quick look at resulting table

religiosity2

  religiosity2 %>%
    group_by(Pop.Group) %>%
    arrange(Pop.Group, desc(Pop_2010)) %>%
    summarize(Mean.Pop = mean(Pop_2010))
  
  
  
  
  
  
  
  
  
  
  # %>%
  # summarize(mean.relig = mean(Religious)) %>%
  #   summarise(mean.pop = mean(Pop_2010))
  #   arrange(mean.pop, desc(mean.pop))
  # 
  # religiosity2 %>%
  #   arrange(desc(Mean.Pop))
  #  
  # 
  # 
  # arrange(order, desc(sleep_total)) %>% 


#####################################
#              Part 2               #
# Beginning to look at correlations #
#####################################

# Look for correlations between certain religious groups and non-religious people
religions = names(utah)[-c(1:4)]

for(i in religions){
  rsq = signif(summary(lm(utah[,i] ~ utah$Non.Religious))$r.squared, 4)
  plot(utah[,i] ~ utah$Non.Religious, main = paste(i,"RSq.Val=",rsq), xlab = "Non_Religious",ylab=i)
  abline(lm(utah[,i] ~ utah$Non.Religious), col="Red")
}

# Browse through those plots and answer the following questions:
# 1.  Which religious group correlates most strongly in a given area with the proportion of non-religious people?
   # LDS
# 2.  What is the direction of that correlation?
    #negative - for every decrease in LDS there is an increase in non_religious - The points are most tightly packed
   # around the trend line.
  
# 3.  Which religious group has the second stronglest correlation, as above?
    #Episcopal church
    
    ##scatter around line is due to error or things that were not included in model
# 4.  What is the direction of THAT correlation?
    ##positive correlation
# 5.  What can you say about these relationships?

# UPLOAD YOUR ANSWERS TO CANVAS
# DON'T FORGET TO PUSH YOUR TIDY CODE TO GITHUB AS WELL!