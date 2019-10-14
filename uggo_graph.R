library(RCurl)
library(treemapify)

library(ggplotify)
library(treemap)
 getURL("http://github.com/fivethirtyeight/data/blob/master/candy-power-ranking/candy-data.csv")
y<- read.csv(text=x)


x<-getURL("https://raw.githubusercontent.com/fivethirtyeight/data/master/candy-power-ranking/candy-data.csv")
y<- read.csv(text=x)

summary(y)
library(extrafont)
font_import()
yloadfonts(device = "win")

plot(x=y$competitorname, y=y$sugarpercent)

uggo <-ggplot(y, aes(x=y$competitorname,y=y$sugarpercent, group = y$sugarpercent)) + 
  geom_point(aes(shape=y$sugarpercent, color=y$sugarpercent, size=y$sugarpercent)) +
 geom_smooth(method="lm") + scale_shape_identity()
   
 
 uggo + theme(panel.background = element_rect(fill = "white",
                                              colour = "yellow",
                                              size = 0.5, linetype = "solid"),
              panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                              colour = "yellow"), 
              panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                              colour = "yellow")
 ) + labs(title="Favorite Candy", subtitle="candy", color = "CompetNam",
          y="SP", x="CP") +
    theme(plot.background = element_rect(fill = "yellow") ) +
   theme(text=element_text(size=24, 
          family= "Comic Sans MS", colour = "lawngreen")) +
   theme(axis.text.x = element_text(face="bold", color="salmon2", 
                                    size=14, angle=45),
         axis.text.y = element_text(face="bold", color="maroon1", 
                                    size=20, angle=45))
   
 warnings()
 #comic sans
 p + theme(
   plot.title = element_text(color="red", size=14, face="bold.italic"),
   axis.title.x = element_text(color="blue", size=14, face="bold"),
   axis.title.y = element_text(color="#993333", size=14, face="bold")
 )
 
 library(extrafont)
 font_import()
 loadfonts(device = "win")
 
 
 
 


tree <- treemapify(y,
                                 area = "competitorname",
                                 fill = "pluribus",
                                 label = "sugarpercent",
                                 group = "winpercent")

ggplot(tree)

treeMapPlot <- ggplot(tree) + 
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_brewer(palette = "Dark2")

treeMapPlot

print(treeMapPlot)
??ggplotify

?treemapify
treemapify(y, area = "sugarpercent")
tree <- treemapify(y,area = "sugarpercent")
ggplot(tree)
