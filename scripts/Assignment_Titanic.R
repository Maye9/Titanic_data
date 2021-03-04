##### Load packages ######

library(tidyverse)
library(readxl)
library(janitor)
library(stringr)


##### Load data #####

T_data <- read.csv("data/titanic_messy.csv")
T_data_prof <- read.csv("data/titanic_clean.csv")

#Review

View (T_data)
View (T_data_prof)

str(T_data)
summary(T_data)
glimpse(T_data_prof)

#Lower capitals
names (T_data) <- T_data %>%
  names () %>%
  str_to_lower()


glimpse(T_data)

#Rename variables

T_data <- rename(T_data, passenger_class = pclass)
T_data <- rename(T_data, passenger_name = name)
T_data <- rename (T_data, siblings_spouses_aboard = siblings.spouses.aboard)
T_data <- rename (T_data, parent_children_aboard = parents.children.aboard)

glimpse(T_data)
View(T_data)

#Trim whitespace      

T_data$name <- str_trim(T_data$name) 

View(T_data)

#Remove yrs. and $

T_data$age <- strsplit(T_data$age, 'yrs.')

T_data$fare <- str_replace(T_data$fare, pattern = '\\$', replacement = '')

head(fare)

#Change y/n to numbers


T_data$survived [T_data$survived == 1] <- 'Yes'
T_data$survived [T_data$survived == 0] <- 'No'

T_data$passenger_class [T_data$passenger_class == 3] <- 'Third'
T_data$passenger_class [T_data$passenger_class == 2] <- 'Second'
T_data$passenger_class [T_data$passenger_class == 1] <- 'First'

View(T_data)

#Export to csv
save(T_data, file= 'T_data')

write.table (T_data, file = 'T_data.csv')
