library(tidyverse)
library(ggplot2)

data("iris")

##1.  Load the "iris" data set ####
##2.  Duplicate the following 3 figures (on next 3 pages) and save them in your Assignment_5 directory as "iris_fig1.png", "iris_fig2.png", "iris_fig3.png", respectively.

##1 = scatter
##2 = density plot
##3 = boxplot
##4 = diverging bars


ggplot(iris, aes(x=iris$Sepal.Length, y=iris$Petal.Length)) + geom_point() +
 geom_smooth(method = "lm")

 ##ggplot(iris, aes(x=iris$Sepal.Length, y=iris$Petal.Length + 
  ##geom_point(aes(color=iris$Species),size=3) + 
  ##geom_smooth(method="lm",color="firebrick") + 
   
   
  ##labs(title="Area Vs Population", subtitle="From midwest dataset", color = "State",
    ##   y="log10 Population", x="Area (proportion of max)", caption="Midwest Demographics") +
  ##theme_minimal() +
    
    
  #1. 
  a <-  ggplot(iris, aes(iris$Sepal.Length, iris$Petal.Length)) 
  
  a + geom_jitter(aes(col=iris$Species)) + 
    geom_smooth(aes(col=iris$Species), method="lm", se=F)  +
    labs(title="Sepal Length v Petal Length", subtitle="for the iris species", color = "Species",
         y="Petal Length", x="Sepal Length")
    
   
  #2.
  b <- ggplot(iris, aes(iris$Petal.Width))
  
  b + geom_density(aes(fill=factor(iris$Species))) + 
    labs(title="Distribution of Petal Width", 
         subtitle="for the iris species",
         x="Petal Width",
         fill="Species")
  
  
  #3.
 
  
  
  ggplot(iris, aes(y=iris$Sepal.Length/iris$Sepal.Width, x=iris$Species, fill = iris$Species)) + geom_boxplot() +
    theme_bw() +
   labs(title = "Sepal to Petal Width Ratio",
              subtitle = "for three iris species",
                x = "Species",
                y= "Ratio of Sepal Width to Petal Width",
                fill = "Species")
               
  #4 Diverging Bars
  
  ggplot(iris, aes(x='Distance from the mean', y=Species, label=Species)) + 
    geom_bar(stat='identity', aes(fill = Species), width=.5)  + coord
    scale_fill_manual(name="Species", 
                      labels = c("Above Average", "Below Average"), 
                     values = c("above"="#00ba38", "below"="#f8766d")) + 
    labs(subtitle="Mean", 
         title= "Diverging Bars") + 
    coord_flip()
  
    devianceSep <- iris$Sepal.Length - mean(iris$Sepal.Length)
  
    
    ggplot(data = iris,
           aes(x = iris$Species, y = devianceSep,
               fill = iris$Species))+
      geom_bar(stat = "identity") +
      coord_flip() +
   
    
      labs(x = "Distance from the Mean",
           title = "Sepal length deviation from the mean of observations",
           subtitles = "")+
      theme_minimal()+
      guides(fill = FALSE)
    
    
    # find decreasing order of deviancesep
    devorder = as.character(order(devianceSep,decreasing = TRUE))
    
    iris$Species
    ggplot(iris, aes(y=devianceSep, x=1:nrow(iris), label=Species)) + 
      geom_bar(stat='identity', width=.5,position = "dodge")  +
      # scale_fill_manual(name="Species", 
      #                   labels = iris@Species, 
      #                   values = c("above"="#00ba38", "below"="#f8766d", "#FF9900")) + 
      labs(subtitle="whatever", 
           title= "Diverging Bars")+
      scale_y_discrete(breaks = as.numeric(devorder)) +
      coord_flip()
    
    
    ggplot(iris, aes(x= 'deviationSep', y=iris$Species, label=iris$Species)) + 
      geom_bar(stat='identity', aes(fill=iris$Species), width=.5)  +
     # scale_fill_manual(name="Species", 
      #                  labels = c("Above Average", "Below Average"), 
       #                 values = c("above"="#00ba38", "below"="#f8766d", "#FF9900")) + 
      labs(subtitle="whatever", 
           title= "Diverging Bars") + 
      coord_flip()
    
   
  ##scale_color_manual(values=pal)







##3.  Keep in mind that by default, I make most of my figures with theme_minimal() 
##4.  Read through the different plot types on this website 

##<http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html> 
  
##  and use the info to reproduce the fourth figure below. Save it as "iris_fig4.png"
##This last task requires you to use the internet to solve a tricky R task.  This is the most important skill you can learn in this course!
##  You'll probably have to figure out some functions you've not seen before and reconfigure them to the iris data.
