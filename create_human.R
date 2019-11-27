# Data wrangling for Exercise 5
# Aarthi Ravindran
#27.11.19

#1. Create a new R script called create_human.R
#2. Read the "Human development" and "Gender inequality" datas into R. Here are the links to the datasets: (1 point)
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
# and
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
#3. Explore the datasets: see the structure and dimensions of the data. Create summaries of the variables. (1 point)
head(hd)
# HDI.Rank     Country   Human.Development.Index..HDI. Life.Expectancy.at.Birth Expected.Years.of.Education Mean.Years.of.Education Gross.National.Income..GNI..per.Capita GNI.per.Capita.Rank.Minus.HDI.Rank
#1        1      Norway                         0.944                     81.6                        17.5                     12.6                                 64,992                                  5
#2        2   Australia                         0.935                     82.4                        20.2                     13.0                                 42,261                                 17
#3        3 Switzerland                         0.930                     83.0                        15.8                     12.8                                 56,431                                  6
#4        4     Denmark                         0.923                     80.2                        18.7                     12.7                                 44,025                                 11
#5        5 Netherlands                         0.922                     81.6                        17.9                     11.9                                 45,435                                  9
#6        6     Germany                         0.916                     80.9                        16.5                     13.1                                 43,919                                 11
str(hd)
#'data.frame':	195 obs. of  8 variables:
#$ HDI.Rank                              : int  1 2 3 4 5 6 6 8 9 9 ...
#$ Country                               : chr  "Norway" "Australia" "Switzerland" "Denmark" ...
#$ Human.Development.Index..HDI.         : num  0.944 0.935 0.93 0.923 0.922 0.916 0.916 0.915 0.913 0.913 ...
#$ Life.Expectancy.at.Birth              : num  81.6 82.4 83 80.2 81.6 80.9 80.9 79.1 82 81.8 ...
#$ Expected.Years.of.Education           : num  17.5 20.2 15.8 18.7 17.9 16.5 18.6 16.5 15.9 19.2 ...
#$ Mean.Years.of.Education               : num  12.6 13 12.8 12.7 11.9 13.1 12.2 12.9 13 12.5 ...
#$ Gross.National.Income..GNI..per.Capita: chr  "64,992" "42,261" "56,431" "44,025" ...
#$ GNI.per.Capita.Rank.Minus.HDI.Rank    : int  5 17 6 11 9 11 16 3 11 23 ...
dim(hd)
#[1] 195   8
summary(hd)
#HDI.Rank        Country          Human.Development.Index..HDI. Life.Expectancy.at.Birth Expected.Years.of.Education
#Min.   :  1.00   Length:195         Min.   :0.3480                Min.   :49.00            Min.   : 4.10              
#1st Qu.: 47.75   Class :character   1st Qu.:0.5770                1st Qu.:65.75            1st Qu.:11.10              
#Median : 94.00   Mode  :character   Median :0.7210                Median :73.10            Median :13.10              
#Mean   : 94.31                      Mean   :0.6918                Mean   :71.07            Mean   :12.86              
#3rd Qu.:141.25                      3rd Qu.:0.8000                3rd Qu.:76.80            3rd Qu.:14.90              
#Max.   :188.00                      Max.   :0.9440                Max.   :84.00            Max.   :20.20              
#NA's   :7                                                                                                             
#Mean.Years.of.Education Gross.National.Income..GNI..per.Capita GNI.per.Capita.Rank.Minus.HDI.Rank
#Min.   : 1.400          Length:195                             Min.   :-84.0000                  
#1st Qu.: 5.550          Class :character                       1st Qu.: -9.0000                  
#Median : 8.400          Mode  :character                       Median :  1.5000                  
#Mean   : 8.079                                                 Mean   :  0.1862                  
#3rd Qu.:10.600                                                 3rd Qu.: 11.0000                  
#Max.   :13.100                                                 Max.   : 47.0000                  
#                                                                NA's   :7       

head(gii)
#  GII.Rank     Country Gender.Inequality.Index..GII. Maternal.Mortality.Ratio Adolescent.Birth.Rate Percent.Representation.in.Parliament Population.with.Secondary.Education..Female. Population.with.Secondary.Education..Male.
#1        1      Norway                         0.067                        4                   7.8                              39.6                                         97.4                                       96.7
#2        2   Australia                         0.110                        6                  12.1                              30.5                                         94.3                                       94.6
#3        3 Switzerland                         0.028                        6                   1.9                              28.5                                         95.0                                       96.6
#4        4     Denmark                         0.048                        5                   5.1                              38.0                                         95.5                                       96.6
#5        5 Netherlands                         0.062                        6                   6.2                              36.9                                         87.7                                       90.5
#6        6     Germany                         0.041                        7                   3.8                              36.9                                         96.3                                       97.0
#Labour.Force.Participation.Rate..Female. Labour.Force.Participation.Rate..Male.
#1                                     61.2                                   68.7
#2                                     58.8                                   71.8
#3                                     61.8                                   74.9
#4                                     58.7                                   66.4
#5                                     58.5                                   70.6
#6                                     53.6                                   66.4
str(gii)
#'data.frame':	195 obs. of  10 variables:
#$ GII.Rank                                    : int  1 2 3 4 5 6 6 8 9 9 ...
#$ Country                                     : chr  "Norway" "Australia" "Switzerland" "Denmark" ...
#$ Gender.Inequality.Index..GII.               : num  0.067 0.11 0.028 0.048 0.062 0.041 0.113 0.28 0.129 0.157 ...
#$ Maternal.Mortality.Ratio                    : int  4 6 6 5 6 7 9 28 11 8 ...
#$ Adolescent.Birth.Rate                       : num  7.8 12.1 1.9 5.1 6.2 3.8 8.2 31 14.5 25.3 ...
#$ Percent.Representation.in.Parliament        : num  39.6 30.5 28.5 38 36.9 36.9 19.9 19.4 28.2 31.4 ...
#$ Population.with.Secondary.Education..Female.: num  97.4 94.3 95 95.5 87.7 96.3 80.5 95.1 100 95 ...
#$ Population.with.Secondary.Education..Male.  : num  96.7 94.6 96.6 96.6 90.5 97 78.6 94.8 100 95.3 ...
#$ Labour.Force.Participation.Rate..Female.    : num  61.2 58.8 61.8 58.7 58.5 53.6 53.1 56.3 61.6 62 ...
#$ Labour.Force.Participation.Rate..Male.      : num  68.7 71.8 74.9 66.4 70.6 66.4 68.1 68.9 71 73.8 ...
dim(gii)
#[1] 195  10
summary(gii)
#GII.Rank        Country          Gender.Inequality.Index..GII. Maternal.Mortality.Ratio Adolescent.Birth.Rate
#Min.   :  1.00   Length:195         Min.   :0.0160                Min.   :   1.0           Min.   :  0.60       
#1st Qu.: 47.75   Class :character   1st Qu.:0.2030                1st Qu.:  16.0           1st Qu.: 15.45       
#Median : 94.00   Mode  :character   Median :0.3935                Median :  69.0           Median : 40.95       
#Mean   : 94.31                      Mean   :0.3695                Mean   : 163.2           Mean   : 49.55       
#3rd Qu.:141.25                      3rd Qu.:0.5272                3rd Qu.: 230.0           3rd Qu.: 71.78       
#Max.   :188.00                      Max.   :0.7440                Max.   :1100.0           Max.   :204.80       
#NA's   :7                           NA's   :33                    NA's   :10               NA's   :5            
#Percent.Representation.in.Parliament Population.with.Secondary.Education..Female. Population.with.Secondary.Education..Male.
#Min.   : 0.00                        Min.   :  0.9                                Min.   :  3.20                            
#1st Qu.:12.47                        1st Qu.: 27.8                                1st Qu.: 38.30                            
#Median :19.50                        Median : 55.7                                Median : 60.00                            
#Mean   :20.60                        Mean   : 54.8                                Mean   : 60.29                            
#3rd Qu.:27.02                        3rd Qu.: 81.8                                3rd Qu.: 85.80                            
#Max.   :57.50                        Max.   :100.0                                Max.   :100.00                            
#NA's   :3                            NA's   :26                                   NA's   :26                                
#Labour.Force.Participation.Rate..Female. Labour.Force.Participation.Rate..Male.
#Min.   :13.50                            Min.   :44.20                         
#1st Qu.:44.50                            1st Qu.:68.88                         
#Median :53.30                            Median :75.55                         
#Mean   :52.61                            Mean   :74.74                         
#3rd Qu.:62.62                            3rd Qu.:80.15                         
#Max.   :88.10                            Max.   :95.50                         
#NA's   :11                               NA's   :11 

# 4.Look at the meta files and rename the variables with (shorter) descriptive names. (1 point)


colnames(hd) <- c('HDI.Rank', 'Country', 'HDI', 'LifeExp', 'ExpEdu', 'MeanEdu', 'GNIpercap', 'GNIrank_minus_HDIrank')
# HDI.Rank
# Country
# HDI =  Human.Development.Index.
# LifeExp = Life.Expectancy.at.Birth
# ExpEdu =  Expected.Years.of.Education
# MeanEdu = Mean.Years.of.Education
# GNIpercap = Gross.National.Income..GNI..per.Capita
# GNIrank_minus_HDIrank = GNI.per.Capita.Rank.Minus.HDI.Rank
head(hd)
#  HDI.Rank     Country   HDI LifeExp ExpEdu MeanEdu GNIpercap GNIrank_minus_HDIrank
#1        1      Norway 0.944    81.6   17.5    12.6    64,992                     5
#2        2   Australia 0.935    82.4   20.2    13.0    42,261                    17
colnames(gii) <- c('GII.Rank', 'Country', 'GII', 'MMR', 'ABR', 'PP', 'S.Edu.F', 'S.Edu.M','LFF', 'LFM')
# GII.Rank
# Country
# GII = Gender.Inequality.Index.
# MMR = Maternal.Mortality.Ratio
# ABR = Adolescent.Birth.Rate
# PP = Percent.Representation.in.Parliament
# S.Edu.F = Population.with.Secondary.Education..Female.
# S.Edu.M = Population.with.Secondary.Education..Male
# LFF = Labour.Force.Participation.Rate..Female.
# LFM = Labour.Force.Participation.Rate..Male.
head(gii)
#  GII.Rank     Country   GII MMR  ABR   PP S.Edu.F S.Edu.M  LFF  LFM
#1        1      Norway 0.067   4  7.8 39.6    97.4    96.7 61.2 68.7
#2        2   Australia 0.110   6 12.1 30.5    94.3    94.6 58.8 71.8

# 5. Mutate the "Gender inequality" data and create two new variables.
#The first one should be the ratio of Female and Male populations with secondary education in each country. (i.e. edu2F / edu2M).
#The second new variable should be the ratio of labour force participation of females and males in each country (i.e. labF / labM). (1 point)

hd <- as.data.frame(hd)
F.M.Edu.ratio <- gii$S.Edu.F/gii$S.Edu.M 
F.M.LF <- gii$LFF/gii$LFM
gii <- as.data.frame(gii)
gii <- cbind(gii, F.M.Edu.ratio, F.M.LF)

# 6. Join together the two datasets using the variable Country as the identifier.
#Keep only the countries in both data sets (Hint: inner join). The joined data should have 195 observations and 19 variables. 
#Call the new joined data "human" and save it in your data folder. (1 point)
library(dplyr)
human <- inner_join(hd, gii, by = c("Country"))
write.csv(human, file = 'human.csv')
