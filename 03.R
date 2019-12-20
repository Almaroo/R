kontynenty <- gapminder %>% filter(year =="2007") %>% count(continent)
kontynenty

ludnosc_kontynenty_1952 <- gapminder %>% filter(year == "1952") %>% count(continent, wt = pop, sort = TRUE)
ludnosc_kontynenty_1952

zycie_kontynenty <- gapminder %>% filter(year == "2007") %>% group_by(continent) %>% summarize(dl_zycia = mean(lifeExp))
zycie_kontynenty

bogactwo_rok <- gapminder %>% group_by(year) %>% summarise(PKB = sum(gdpPercap)) %>% arrange(desc(PKB))
bogactwo_rok

dlugosc_zycia <- gapminder %>% filter(year == "1972") %>% group_by(continent) %>% top_n(3, lifeExp)
dlugosc_zycia

rank_PKB <- gapminder %>% filter(year == "1967") %>% group_by(continent) %>% top_n(2, gdpPercap) %>% arrange(continent, desc(gdpPercap))
rank_PKB


head(mtcars)

auta_biegi <- mtcars %>% filter((gear == "4" | gear =="5") & am == "0") %>% arrange(desc(mpg))
auta_biegi

przysp <- mtcars %>% group_by(cyl) %>% summarise(acc = mean(qsec))
przysp

mtcars %>% mutate("l/100km" = 235.2/mpg)

mistrz <- data.frame(rok = c(2006, 2010, 2014, 2018), zwyciezca = c("ITA", "ESP", "GER", "FRA"))
mistrz

rywal <- data.frame(rok = c(2002, 2006, 2010, 2018), przegrany = c("GER", "FRA", "NED", "CRO"))
rywal

#Z£¥CZENIA

left_join(mistrz, rywal, by = 'rok') %>% select(rok, zwyciezca, przegrany)
right_join(mistrz, rywal, by = 'rok') %>% select(rok, zwyciezca, przegrany)
inner_join(mistrz, rywal, by = 'rok') %>% select(rok, zwyciezca, przegrany)
full_join(mistrz, rywal, by = 'rok') %>% select(rok, zwyciezca, przegrany) %>% arrange(rok)

#FILTRY

semi_join(mistrz, rywal, by = 'rok')
anti_join(mistrz, rywal, by = 'rok')

#APPLY

lista <- list(wektor = 1:5, literki = c("a", "b", "c", "d"), logiczne = c(TRUE, FALSE))
lapply(lista, typeof)

lista2 <- list(dane1 = c(NA, 1:10), dane2 = c(-5:5, NA))

lapply(lista2, sum, na.rm = T)


lista3 <- list(dane1 = iris, dane2 = Orange)
lapply(lista3, function(x){list(names(x), nrow(x))})


lista4 <- list(dane1 = 20:1, dane2 = 1:10, dane3 = 1:5)
sapply(lista4, max)

macierz <- matrix(round(rnorm(20), 1), 5)
apply(macierz, 1, median)
apply(macierz, 2, median)


macierz2 <- matrix(round(rnorm(100), 2), 4)
apply(macierz2, 2, summary)

head(mtcars)


head(iris)
tapply(iris$Sepal.Length, as.factor(iris$Species), mean)

mtcars
tapply(mtcars$mpg, mtcars$cyl, mean)
tapply(mtcars$mpg, mtcars$cyl, summary)
tapply(mtcars$mpg, mtcars$cyl, function(x){sd(x)/mean(x)})
