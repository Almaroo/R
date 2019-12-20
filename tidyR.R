#zad 1
bmi <- read.csv(file = "https://raw.githubusercontent.com/amachno/R_course_UJ_ed1/master/bmi_clean.csv")
head(bmi)
bmi_long <- gather(bmi, year, value, -Country)
str(bmi)
bmi_long

#zad 2

bmi_short <- spread(bmi_long, year, value)
bmi_short

#zad 3
