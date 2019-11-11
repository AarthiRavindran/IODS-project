# Aarthi Ravindran - 11.11.2019
# Exercise 2 for the IODS course - Regression and model validation
# The data wrangling exercise is worth a maximum of 5 points and the analysis exercise is worth a maximum of 15 points.

# Data Wrangling
# Here, we preprocess a data set for further analysis.
# You only need to produce an R script, no output in your course diary is needed.

# 1. Create a folder named 'data' in your IODS-project folder. Then create a new R script with RStudio. 
# Write your name, date and a one sentence file description as a comment on the top of the script file. 
# Save the script for example as 'create_learning2014.R' in the 'data' folder. Complete the rest of the steps in that script.
    # And: This is the current file which i am usign for further analysis

# 2. Read the full learning2014 data from http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt into R (the separator is a tab ("\t") and the file includes a header) and explore the structure and dimensions of the data. 
#Write short code comments describing the output of these explorations. (1 point)

# Loading the data ino R
data <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep = "\t", header = TRUE)
dim(data)
#[1] 183  60
head(data)
#  Aa Ab Ac Ad Ae Af ST01 SU02 D03 ST04 SU05 D06 D07 SU08 ST09 SU10 D11 ST12 SU13 D14 D15 SU16 ST17 SU18 D19 ST20 SU21 D22 D23
#1  3  1  2  1  1  1    4    2   4    4    2   4   4    3    3    2   3    3    3   4   3    2    3    2   4    2    3   3   2
#2  2  2  2  2  1  1    4    2   4    4    4   2   3    4    4    1   4    1    3   2   3    4    4    2   3    1    2   2   3
#3  4  1  1  1  1  1    3    1   4    4    2   3   4    1    3    1   4    4    2   4   2    3    3    1   4    3    2   4   3
#4  4  2  3  2  1  1    3    3   4    4    3   4   4    2    3    1   3    3    2   4   3    2    3    1   3    3    3   3   3
#5  3  2  2  1  2  1    4    2   5    3    4   4   4    3    4    2   4    2    3   4   3    3    4    1   4    3    2   3   3
#6  4  2  1  1  1  1    4    3   5    4    3   5   5    4    4    1   5    3    1   5   4    2    3    2   4    3    4   5   4
#SU24 ST25 SU26 D27 ST28 SU29 D30 D31 SU32 Ca Cb Cc Cd Ce Cf Cg Ch Da Db Dc Dd De Df Dg Dh Di Dj Age Attitude Points gender
#1    2    4    4   4    4    3   4   4    3  2  4  3  4  3  2  3  4  3  4  4  5  4  2  4  3  4  4  53       37     25      F
#2    4    2    4   2    2    3   3   4    5  4  4  4  5  5  3  2  4  4  3  3  4  3  2  3  3  2  4  55       31     12      M
#3    3    4    4   3    5    2   4   3    5  3  5  4  4  3  4  4  2  1  4  4  1  4  1  3  1  1  5  49       25     24      F
#4    2    3    2   3    3    3   4   4    3  3  4  4  4  3  4  4  3  2  4  5  2  5  1  5  4  2  5  53       35     10      M
#5    4    4    3   3    5    3   3   4    4  2  4  4  3  3  3  4  4  3  4  4  4  4  2  5  5  3  3  49       37     22      M
#6    2    4    2   5    4    2   5   5    3  3  5  4  4  3  4  5  4  3  5  4  4  4  3  4  3  3  5  38       38     21      F

summary(data)
#Example only few lines of summary is given below
#     Age           Attitude         Points      gender 
#Min.   :17.00   Min.   :14.00   Min.   : 0.00   F:122  
#1st Qu.:21.00   1st Qu.:26.00   1st Qu.:18.00   M: 61  
#Median :22.00   Median :32.00   Median :22.00          
#Mean   :25.58   Mean   :31.21   Mean   :20.61          
#3rd Qu.:27.00   3rd Qu.:37.00   3rd Qu.:26.00          
#Max.   :55.00   Max.   :50.00   Max.   :33.00  
str(data)
#Example of structure command and its few lines
#'data.frame':	183 obs. of  60 variables:
# $ Aa      : int  3 2 4 4 3 4 4 3 2 3 ...
# $ Ab      : int  1 2 1 2 2 2 1 1 1 2 ...
# $ Ac      : int  2 2 1 3 2 1 2 2 2 1 ...
#Result summary:
#command: as per the description, the header is true and each column is seperated by tab are mentioned while reading the file at given location. 
#the file is having 183 rows and 60 columns from dim command. 
#The summary command gives minimum, 1st quadrant, median, mean, 3rd qua and max values.
# str command gives structure of the data


#3.Create an analysis dataset with the variables gender, age, attitude, deep, stra, surf and points by combining questions in the learning2014 data, as defined in the datacamp exercises and also on the bottom part of the following page (only the top part of the page is in Finnish). http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS2-meta.txt. Scale all combination variables to the original scales (by taking the mean). Exclude observations where the exam points variable is zero. (The data should then have 166 observations and 7 variables) (1 point)

#dataset with gender, age, attitude, deep, stra, surf and points

install.packages("dplyr")
library(dplyr)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning, surface learning and strategic learning
deep_columns <- data %>% select(one_of(deep_questions))
surface_columns <- data %>% select(one_of(surface_questions))
strategic_columns <- data %>% select(one_of(strategic_questions))

learning2014 <- data %>% mutate(
  attitude=Attitude/10,
  deep=rowMeans(deep_columns,na.rm=TRUE),
  surf=rowMeans(surface_columns,na.rm=TRUE),
  stra=rowMeans(strategic_columns,na.rm=TRUE)
) %>%
  filter(Points!=0) %>%
  select(gender, age=Age, attitude, deep, stra, surf, points=Points)

# comment of what done in question 3 of data wrangle:
# The rowmean(mean) of each row for the columns which start with DO are stored in column named as deep_questions
# The rowmean(mean) of each row for the columns which start with SU are stored in column named as surface_questions
# The rowmean(mean) of each row for the columns which start with ST are stored in column named as strategic_questions
# the attitue column created by scaling the Attitude(attitude = Attitude/10)
# The column Gender, age and points is included
# all these rows are kept only when points are more than zero
dim(learning2014)
#[1] 166   7
head(learning2014)
#gender age attitude     deep  stra     surf points
#1      F  53      3.7 3.583333 3.375 2.583333     25
#2      M  55      3.1 2.916667 2.750 3.166667     12
#3      F  49      2.5 3.500000 3.625 2.250000     24
#4      M  53      3.5 3.500000 3.125 2.250000     10
#5      M  49      3.7 3.666667 3.625 2.833333     22
#6      F  38      3.8 4.750000 3.625 2.416667     21
str(learning2014)
#'data.frame':	166 obs. of  7 variables:
# $ gender  : Factor w/ 2 levels "F","M": 1 2 1 2 2 1 2 1 2 1 ...
# $ age     : int  53 55 49 53 49 38 50 37 37 42 ...
# $ attitude: num  3.7 3.1 2.5 3.5 3.7 3.8 3.5 2.9 3.8 2.1 ...
# $ deep    : num  3.58 2.92 3.5 3.5 3.67 ...
# $ stra    : num  3.38 2.75 3.62 3.12 3.62 ...
# $ surf    : num  2.58 3.17 2.25 2.25 2.83 ...
# $ points  : int  25 12 24 10 22 21 21 31 24 26 ...

#Question 4: data wrangling
# Set the working directory of you R session the iods project folder. 
# Save the analysis dataset to the ‘data’ folder, using for example write.csv() or write.table() functions. 
# Demonstrate that you can also read the data again by using read.table() or read.csv().  (3 points)



# Change working directory to IODS-folder
setwd("~/IODS-project/")

# Save created data to folder 'data' as an Excel worksheet
install.packages("openxlsx")
library(openxlsx)
write.xlsx(learning2014,file="~/IODS-project/data/learning2014.xlsx")
write.table(learning2014, file = "~/IODS-project/data/learning2014.txt")

# Read the data back to R and check that structure and a few first observations look the same
# install.packages("readxl")
library(readxl)

test_XL <- read.xlsx("~/IODS-project/data/learning2014.xlsx")
test_tab <- read.table("~/IODS-project/data/learning2014.txt")

head(learning2014) #see above line 94
head(test_XL)
#gender age attitude     deep  stra     surf points
#1      F  53      3.7 3.583333 3.375 2.583333     25
#2      M  55      3.1 2.916667 2.750 3.166667     12
#3      F  49      2.5 3.500000 3.625 2.250000     24
#4      M  53      3.5 3.500000 3.125 2.250000     10
#5      M  49      3.7 3.666667 3.625 2.833333     22
#6      F  38      3.8 4.750000 3.625 2.416667     21
head(test_tab)
#  gender age attitude     deep  stra     surf points
#1      F  53      3.7 3.583333 3.375 2.583333     25
#2      M  55      3.1 2.916667 2.750 3.166667     12
#3      F  49      2.5 3.500000 3.625 2.250000     24
#4      M  53      3.5 3.500000 3.125 2.250000     10
#5      M  49      3.7 3.666667 3.625 2.833333     22
#6      F  38      3.8 4.750000 3.625 2.416667     21

str(learning2014) # see above line 102
str(test_XL)
#'data.frame':	166 obs. of  7 variables:
#$ gender  : chr  "F" "M" "F" "M" ...
#$ age     : num  53 55 49 53 49 38 50 37 37 42 ...
#$ attitude: num  3.7 3.1 2.5 3.5 3.7 3.8 3.5 2.9 3.8 2.1 ...
#$ deep    : num  3.58 2.92 3.5 3.5 3.67 ...
#$ stra    : num  3.38 2.75 3.62 3.12 3.62 ...
#$ surf    : num  2.58 3.17 2.25 2.25 2.83 ...
#$ points  : num  25 12 24 10 22 21 21 31 24 26 ...
str(test_tab)
#'data.frame':	166 obs. of  7 variables:
#$ gender  : Factor w/ 2 levels "F","M": 1 2 1 2 2 1 2 1 2 1 ...
#$ age     : int  53 55 49 53 49 38 50 37 37 42 ...
#$ attitude: num  3.7 3.1 2.5 3.5 3.7 3.8 3.5 2.9 3.8 2.1 ...
#$ deep    : num  3.58 2.92 3.5 3.5 3.67 ...
#$ stra    : num  3.38 2.75 3.62 3.12 3.62 ...
#$ surf    : num  2.58 3.17 2.25 2.25 2.83 ...
#$ points  : int  25 12 24 10 22 21 21 31 24 26 ...

#Result:
# exercise: 4 data wrangling
# set the working directory to IODS project
# write the file to data folder in IODS and read them back into Rstudio
# now the files are same as we can see from read file head and str command compared to writing files
