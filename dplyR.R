#zad 1
install.packages("hflights")
library("hflights")
library("dplyr")
hflights
str(hflights)
opoznioneLoty <- hflights %>% filter(ArrDelay > 0 | DepDelay > 0) %>% select(DayofMonth, Month, Year, ArrDelay, DepDelay) %>% unite(col = date, c(Year, Month, DayofMonth), sep = "-")
opoznioneLoty

# zad 2

opoznioneLotyPonadGodzina <- hflights %>% filter(ArrDelay > 60 | DepDelay > 60)
opoznioneLotyPonadGodzina

# zad 3

czasyTaryfa <- mutate(taxiIn = summarise(hflights, TaxiIn), taxiOut = summarise(hflights, TaxiOut))

