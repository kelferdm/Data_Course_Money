# Tuesday #

# Git pull all student repos to grade

# Go over assignment 3 (keep it brief)

# practice *exploring* data using ./Data/landdata-states

  # summaries
  # histograms
  # boxplots
  # scatterplots
  # coloring by category
  # subsetting

#has to be a factor to be colored "col=df$region"
df = read.csv("./Data/landdata-states.csv",stringsAsFactors = TRUE)
str(df)

summary(df)
df$State[7803]

plot(x=df$Year,y=df$Home.Value,col=df$region)

# summary
summary(df$Home.Value)

# histogram of home value
hist(df$Home.Value,breaks = 5)

# histogram of state
hist(df$State)

# histogram of land value
hist(df$Land.Value,breaks=50)
#plot home value and land value together
plot(df$Home.Value, df$Land.Value)

# boxplot
plot(x=df$region,df$Home.Value,col="Red")

# boxplot ("quarter" needs to be a factor to get a boxplot)
plot(as.factor(df$Qrtr),df$Home.Value)

#

library(ggplot2)

ggplot(landdata_states, aes(x=area, y=poptotal))+
geom_point() + geom_smooth(method = "lm")


ggplot(landdata_states, aes(x=Year, y=Home.Value, color=Year)) +
geom_point(size=1) +geom_smooth(method = "lm")+
geom_smooth(method="lm",color="red")+
labs(title="Year and Home Value", subtitle="From landdata")+
  facet_wrap(~region)




ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(color="steelblue",size=3) + 
  geom_smooth(method="lm",color="firebrick") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
# what else did we change, and how?




df$ID <- row.names(df)





# just look at homes in the "West" ... these should be the same, but give different results. Why?
west <- subset(df,region=="West")
west2 <- df[df$region == "West",]


plot(west$Year,west$Home.Value,col=west$State)


# Which state is that up at the top!