setwd("~/repos/test")

rm(list=ls(all = TRUE))

school1 <- read.csv("school1.csv", header = T, sep = ",")

require(dplyr)
require(tidyr)
require(data.table)

DT <- data.table(school1)
temp <- DT[, .(distinct_ids_by_ethnicty = uniqueN(StudentNumber)), by = Ethnicity]
temp <- DT[, .(distinct_ids_by_grade = uniqueN(StudentNumber)), by = Grade]
temp <- DT[, .(distinct_ids_by_gender = uniqueN(StudentNumber)), by = Gender]
temp <- DT[, .(distinct_ids_by_lunch = uniqueN(StudentNumber)), by = Lunch]
temp <- DT[, .(distinct_ids_by_specialed = uniqueN(StudentNumber)), by = Special.Education]
temp <- DT[, .(incidents_by_infraction = .N(StudentNumber)), by = Infraction]
temp <- DT[ , `:=`( COUNT = .N , StudentNumber = 1:.N ) , by = Infraction ]
temp <- DT[ , `:=`( COUNT = .N , StudentNumber = 1:.N ) , by = Adminstrative.Action ]
temp
write.csv(temp, file="actions.csv")

?data.table
"data.table"