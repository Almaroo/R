#####
#podstawowe wykresy plot(), boxplot()

#points() - lines()

#xlim, ylim -> zakres wyœwietlanych wartoœci

indeksy <- as.data.frame(EuStockMarkets[seq(1,1000,20),])
head(indeksy)
summary(indeksy)


#par dzieli plots view
#type <- l, p, d
#xlab, ylab <- opisy osi X i Y
#main <- nazwa wykresu

par(mfcol = c(1,1))
plot(101:150,indeksy$DAX, type = 'b', col = 'red', ylim = c(1400,3500), main = "Wartoœci indeksów", xlab = 'miesiac', ylab= 'wartosc')
lines(101:150,indeksy$SMI, col = 'green', type = 'b')
lines(101:150,indeksy$CAC, col = 'blue', type = 'b')
lines(101:150,indeksy$FTSE, col = 'magenta', type = 'b')

#abline() <- nak³ada prost¹ na wykres

abline(h = 2500, col="darkblue", lty = 'dotted')
abline(v = 120, col = 'darkgreen', lty = 'dotted')

#polygon() <- rysuje wielok¹t

polygon(c(105, 105, 115, 115), c(1000, 5000, 5000, 1000), density = 10, col = 'yellow')

#text() <- rysuje tekst dla ostatniego rysyunku
text(c(120, 3300), "lata 19/20", pos = 4)

#####
plot(mtcars$mpg, mtcars$qsec, lwd = 1, xlim = c(10,40), ylim = c(14,24), main = "Przyspieszenie a spalanie", xlab = "spalanie [mile/galon]", ylab = "przyspieszenie [sec/mila/4]")
text(mtcars$mpg, mtcars$qsec, row.names(mtcars), col = 'purple', pos = 3, cex = 0.7)



#####
#hist() <- rysuje histogram
#breaks() <- ustala liczbê podzia³óW dla histogramu

par(mfrow = c(1,2))
hist(mtcars$mpg, breaks = 3, col = 'darkgreen')
hist(mtcars$mpg, breaks = 4, col = 'green')
hist(mtcars$mpg, breaks = 5, col = 'lightgreen')

#####
#boxplot() <- wykres pude³kowy

par(mfrow = c(1,2))
boxplot(mtcars$mpg, col = "darkgreen")
boxplot(mtcars$mpg, col = "lightgreen", horizontal = TRUE)

par(mfrow = c(1,2))
boxplot(mtcars$mpg~mtcars$cyl, col = "yellow")

#####
#pie <- wykres ko³owy
par(mfrow = c(1,2))
boxplot(mtcars$qsec~mtcars$cyl, col = 'purple')

boxplot(mtcars$hp~mtcars$gear, col = 'darkblue')

str(mtcars)

pie(c(length(mtcars$cyl[mtcars$cyl == 4]),length(mtcars$cyl[mtcars$cyl == 6]),length(mtcars$cyl[mtcars$cyl == 8])), labels = c("cztery", "szeœæ", "osiem"), main = "Liczba iloœæ aut wzglêdem liczby cylindrów", col = c("darkblue", "blue", "lightblue"))

#####
#funkcje arytmetyczne
#quantile(), sum(), mean(), sd()

#round(), ceiling(), floor(), trunc()

str(airquality)
airquality %>% summarise(sd_ozone = round(sd(Ozone, na.rm = T),2))

(qua_ozone <- round(quantile(airquality$Ozone, seq(0.1, 0.9, 0.1), na.rm = T),2))
