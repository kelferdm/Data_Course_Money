data("iris")

mod = aov(data = iris, Sepal.Length ~ Petal.Length + Species)

summary(mod)

(TukeyHSD(mod))

plot(TukeyHSD(mod))

library(modelr)

df = add_predictions(iris,mod)

library(ggplot2)

ggplot(df, aes(x=Petal.Length,color=Species)) +
  geom_point(aes(y=Sepal.Length)) +
  geom_point(aes(y=pred),color="Black",size=3)

