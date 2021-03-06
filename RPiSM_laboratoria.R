library(dplyr)

#####
data <- daneRPiSM5


boxplot(Y~X7, data = data, col = c("#FF4A87", "#E843CD", "#9D43E8"), xlab = "Grupa", ylab = "Y")

#####
#ANOVA

#1: ANOVA
#2: KRUSKAL

#H0: u0 = u1 = u2 = u3 = ...= un
#H1: ui =/= uj

#outlayer: bardziej odleg�y od �redniej ni� 3 * odchylenie standardowe

aggregate(data[,1], list(data$X7), sd) #odchylenie
aggregate(data[,1], list(data$X7), var) #wariancja
aggregate(data[,1], list(data$X7), mean) #srednia
aggregate(data[,1], list(data$X7), max) #max
aggregate(data[,1], list(data$X7), min) #min

anova <- aov(Y~X7, data = data) #parametry co od czego, z jakiego zbioru

summary(anova)

#Test Tukeya

TukeyHSD(anova)
#p-value = 0 wi�c:
#r�nica mi�dzy ka�d� z grup jest statystycznie istotna


#test pierwszego za�o�enia na pochodzenie zmiennych z rozk�adu normalnego
reszty <- residuals(object = anova)

shapiro.test(reszty)

#test na r�wno�� wariancji

(bartlet <- bartlett.test(Y~X7, data = data))

#p-value < 0.05 => nie s� r�wne


#TEST KRUSKALA nieparametryczny odpowiednik ANOVA'y
kruskal.test(Y~X7, data = data)
# p-value <0 => odrzucamy H0


#manova - ANOVA dla wielu p�aszczyzn
#cbind() -> ��czy r�ne kolumny data.frame
manova1 <- manova(cbind(data$X4, data$X5)~data$X7)
summary(manova1)

#####
#####
#Test na bycie statystycznie r�nym
#H0: u1 = u2, H1: u1 =/= u2
#spodziewamy si� p-value < 5% -> r�ne
wilcox.test(data$X2~data$X3)

#s� statystycznie takie same

#u-man-whitney nieparametryczny odpowiednik

