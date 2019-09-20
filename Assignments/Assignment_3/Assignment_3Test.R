# Assignment Week 3

# make a new operator for "not in"
'%ni%' = Negate('%in%')


# topics:   type conversions, factors, plot(), making a data frame from "scratch",
#           reordering, 


# vector operations!

vector1 = c(1,2,3,4,5,6,7,8,9,10)
vector2 = c(5,6,7,8,4,3,2,1,3,10)

#multiplies element by element
vector1*vector2

list.files()

dat = read.csv("./Data/thatch_ant.csv")
#shows column names for the data file
names(dat)

#why are these plots different??? ##categorical data = boxplot, so can't give scatterplot
#looking at headwidth in milimeters 
plot(x=dat$Headwidth..mm., y=dat$Mass)
plot(x=dat$Size.class, y=dat$Mass)


#check the classes of these vectors
#tells you what is wrong - what type of class is this Headwidth column
class(dat$Headwidth..mm.)
#what type of class is the size column
class(dat$Size.class)

# plot() function behaves differently depending on classes of objects given to it!

# Check all classes (for each column in dat)
#prints the structure
str(dat)

# Two of them are "Factor" ....why is the column "Headwidth" a factor? It looks numeric!####
dat$Headwidth
levels(dat$Headwidth)
#find an entry in headwidth with 41mm entry####
#name the row####
row <- which(dat$Headwidth =="41mm")
#name the column
col<- "Headwidth"
#show the row and column for 41mm in Headwidth
dat[row,col] <- "41.000"


levels(dat$Headwidth)
#shows each entry as numeric with assignation of its level(category), not its number
as.numeric(dat$Headwidth)
#or take headwidth then change to character then to numeric
class(dat$Headwidth)
as.character(dat$Headwidth)
as.numeric(as.character(dat$Headwidth))
#previous shows you what it would look like if it were numeric or change to character then
#change to numberic

yourmom <- as.numeric(as.character(dat$Headwidth))
dat$Headwidth<-yourmom

dat$Headwidth <- as.numeric(as.character(dat$Headwidth))

#change from factor to character
as.character(dat$Headwidth)

#assigning it to yourmom
dat$yourmom<- yourmom

dat$Mass*dat$Headwidth
#dat$newcolumn<-dat$Mass*dat$Distance

# we can try to coerce one format into another with a family of functions
# as.factor, as.matrix, as.data.frame, as.numeric, as.character, as.POSIXct, etc....

#make a numeric vector to play with:
nums = c(1,1,2,2,2,2,3,3,3,4,4,4,4,4,4,4,5,6,7,8,9)
class(nums) # make sure it's numeric

# convert to a factor
as.factor(nums) # show in console
nums_factor = as.factor(nums) #assign it to a new object as a factor
class(nums_factor) # check it

#check it out
plot(nums) 
plot(nums_factor)
# take note of how numeric vectors and factors behave differently in plot()

# Let's modify and save these plots. Why not!?
?plot()
plot(nums, main = "My Title", xlab = "My axis label", ylab = "My other axis label")

#create jpeg for graph that updates and send it to its file
?jpeg()
##opens connection to a file using defaults jpeg####
jpeg("./testimage.jpg")
plot(nums, main = "My Title", xlab = "My axis label", ylab = "My other axis label")
dev.off()



# back to our ant data...
dat$Headwidth
levels(dat$Headwidth) # levels gives all the "options" of a factor you feed it

# I notice a couple weird ones in there: "" and "41mm"
# The "" means a missing value, basically. The "41mm" sure looks like a data entry error.
                                            # It should probably be "41.000"

# FIND WHICH ONES HAVE "41mm"

which(dat$Headwidth =="41mm")
#fixed earlier, so returns "integer(0)"


# CONVERT THOSE TO "41.000"
row <- which(dat$Headwidth =="41mm")
#name the column
col<- "Headwidth"
#show the row and column for 41mm in Headwidth
dat[row,col] <- "41.000"


# DO THE SAME FOR "", BUT CONVERT THOSE TO "NA"
which(dat$Headwidth == "")

row <- which(dat$Headwidth=="")
col <- "Headwidth"
dat[row,col] <- "NA"


# NOW, REMOVE ALL THE ROWS OF "dat" THAT HAVE AN "NA" VALUE
na.omit(dat$Headwidth=="NA")


# NOW, CONVERT THAT PESKY "Headwidth" COLUMN INTO A NUMERIC VECTOR WITHIN "dat"

as.numeric(dat$Headwidth)

# LET'S LEARN HOW TO MAKE A DATA FRAME FROM SCRATCH... WE JUST FEED IT VECTORS WITH NAMES!

# make some vectors *of equal length* (or you can pull these from existing vectors)
col1 = c("hat", "tie", "shoes", "bandana")
col2 = c(1,2,3,4)
col3 = factor(c(1,2,3,4)) # see how we can designate something as a factor             

# here's the data frame command:
data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # colname = vector, colname = vector....
df1 = data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # assign to df1
df1 # look at it...note column names are what we gave it.



# Make a data frame from the first 20 rows of the ant data that only has "Colony" and "Mass"
# save it into an object called "dat3"
##directions to a location - in a data.frame called dat, find colony and give me the first
#20 rows
#created a SUBSET (part but not all of the data.frame and wrote it to new file)
dat3<-data.frame(Colony=dat$Colony[1:20], Mass=dat$Mass[1:20])



###### WRITING OUT FILES FROM R #######
?write.csv()
row.names(dat3)

# Write your new object "dat3" to a file named "LASTNAME_first_file.csv" in your PERSONAL git repository
write.csv(dat3, "../Data_Course_Money/Assignments/Assignment_3/Money_first_file.csv", row.names = FALSE)



### for loops in R ###

#simplest example:
for(i in 1:10){
  print(i)
}

#another easy one
for(i in levels(dat$Size.class)){
  print(i)
}

# can calculate something for each value of i ...can use to subset to groups of interest
for(i in levels(dat$Size.class)){
  print(mean(dat[dat$Size.class == i,"Mass"]))
}

# more complex:
# define a new vector or data frame outside the for loop first
new_vector = c() # it's empty
# also define a counter
x = 1

for(i in levels(dat$Size.class)){
  new_vector[x] = mean(dat[dat$Size.class == i,"Mass"])
  x = x+1 # add 1 to the counter (this will change the element of new_vector we access each loop)
}
  
#check it
new_vector



# PUT THIS TOGETHER WITH THE LEVELS OF OUR FACTOR SO WE HAVE A NEW DATA FRAME:
# FIRST COLUMN WILL BE THE FACTOR LEVELS....
# SECOND COLUMN WILL BE NAMED "MEAN" AND WILL BE VALUES FROM  new_vector

#fill it in
#create new data.frame ( show results of the for loop, and the column describing the results 
#of the for loop -- shows results and by row descripton of results)
size_class_mean_mass = data.frame(MassMean=new_vector,SizeClass = levels(dat$Size.class))




############ YOUR HOMEWORK ASSIGNMENT ##############

# 1.  Make a scatterplot of headwidth vs mass. See if you can get the points to be colored by "Colony"
plot(x=dat$Headwidth,y=dat$Mass, main = "Headwidth v. Mass", xlab = "Headwidth", ylab = "Mass", col = dat$Colony)
?plot

# 2.  Write the code to save it (with meaningful labels) as a jpeg file
#jpeg("./testimage.jpg")
#plot(nums, main = "My Title", xlab = "My axis label", ylab = "My other axis label")
#dev.off()
jpeg("../Data_Course_Money/Assignments/Assignment_3/HeadwidthvMass_Scatterplot.jpg")
plot(x=dat$Headwidth,y=dat$Mass, main = "Headwidth v. Mass", xlab = "Headwidth", ylab = "Mass", col = dat$Colony)
dev.off()



# 3.  Subset the thatch ant data set to only include ants from colony 1 and colony 2
#dat3<-data.frame(Colony=dat$Colony[1:20], Mass=dat$Mass[1:20])

#dat4<-data.frame(colony1 =dat$Colony )
#1%in%dat$Colony
class(dat)
#include specific columns and specific rows for return
dat4 <- dat[dat$Colony %in% 1:2,]


dat5 <- dat[dat$Mass > 100,]



# size class "35-39" or ">43"
dat[dat$Size.class %in% c("35-39", ">43"), ]
dat[dat$Size.class %in% c("<30","30-34"),]
dat[dat$Size.class != "<30",]
dat[dat$Size.class %ni% levels(dat$Size.class)[6],]

levels(dat$Size.class)[6]


#between 100-130
dat6 <- dat[dat$Mass %in% c(100:130),]
plot(dat6$Mass)

#1 and 5 and first 4 columns
dat8<-dat[dat$Colony %in% c(1,5),1:4]

plot(dat8$Colony)


unique(dat4$Colony)
plot(as.factor(dat$Colony))


#dat[dat$Colony %in% 1,2]

# 4.  Write code to save this new subset as a .csv file
write.csv(dat4,"../Data_Course_Money/Assignments/Assignment_3/DFColony_1_2.csv",row.names = FALSE)

# 5.  Upload this R script (with all answers filled in and tasks completed) to canvas
      # I should be able to run your R script and get all the plots created and saved, etc.





data("mtcars")
?mtcars

data("Utah_Religions_by_County")
levels(Utah_Religions_by_County)

data("mtcars")
levels("mtcars")
data("thatch_ant")
levels("thatch_ant")
levels(thatch_ant$Colony)
