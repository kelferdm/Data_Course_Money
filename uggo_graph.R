library(RCurl)
library(treemapify)

library(ggplotify)

 getURL("http://github.com/fivethirtyeight/data/blob/master/candy-power-ranking/candy-data.csv")
y<- read.csv(text=x)


x<-getURL("https://raw.githubusercontent.com/fivethirtyeight/data/master/candy-power-ranking/candy-data.csv")
y<- read.csv(text=x)

summary(y)

plot(x=y$competitorname, y=y$sugarpercent)

ggplot(y, aes(x=y$competitorname,y=y$sugarpercent)) + geom_point() + geom_smooth(method="lm")


tree <- treemapify(y,
                                 area = "competitorname",
                                 fill = "pluribus",
                                 label = "sugarpercent",
                                 group = "winpercent")

treeMapPlot <- ggplot(tree) + 
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_brewer(palette = "Dark2")

print(treeMapPlot)
??ggplotify
