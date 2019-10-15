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
                                   size=15, angle=45),
        axis.text.y = element_text(face="bold", color="maroon1", 
                                   size=20, angle=45)) +
  background_image(img)


# NOT RUN {
install.packages("png")
install.packages("jpg")

# Import the image
img.file <- system.file(file.path("images", "../../../GHOST.png"),
                        package = "ggpubr")
img <- png::readPNG(img.file)

# Plot with background image
ggplot(iris, aes(Species, Sepal.Length))+
  background_image(img)+
  geom_boxplot(aes(fill = Species), color = "white")+
  fill_palette("jco")

# }
