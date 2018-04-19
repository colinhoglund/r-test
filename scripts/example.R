
rm(list=ls())
options(scipen=999)
sink("console_output.txt")
require(dplyr)
require(matrixStats)
require(googlesheets)
require(tictoc)
require(sqldf)
require(GetoptLong)
require(tidyr)
require(stringr)
require(data.table)
library(RcppRoll)
library(zoo)
library(GetoptLong)

cat("\014")

memory.limit(size=90000)

tic()

firstWeekOf <- as.Date("2016-05-15")
lastWeekOf <- as.Date("2018-04-16", format = "%Y-%m-%d") - 8

u_weekofs<-seq(firstWeekOf,lastWeekOf,7)
firstIdx <- 1
lastIdx <- as.numeric(lastWeekOf-firstWeekOf)/7 + 1

tr12wk_idx <- lastIdx-11:lastIdx

u_weekofs_idx_pairs <- cbind(as.character(u_weekofs), 1:length(u_weekofs))
u_weekofs_idx_pairs <- as.data.frame(u_weekofs_idx_pairs)
colnames(u_weekofs_idx_pairs) <- c("Week Of", "Week Idx")
u_weekofs_idx_pairs$`Week Of` <- as.Date(u_weekofs_idx_pairs$`Week Of`)

data("mtcars")

summarise(group_by(mtcars,cyl), 
          average_hp = mean(hp, na.rm = TRUE),
          average_mpg = mean(mpg, na.rm = TRUE)
          )


data("iris")


mtcars <- data.table(mtcars)
iris <- data.table(iris)
iris_summary <- summarise(group_by(iris, Species), 
                          wtavg_petal.length = weightedMean(Petal.Length, w = Petal.Width) 
                          ) 


toc()

iris_summary <- data.table(iris_summary)
print(class(iris_summary))
str_length(iris_summary$Species)

sessionInfo()

sink()
