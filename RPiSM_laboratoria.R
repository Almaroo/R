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

#outlayer: bardziej odleg³y od œredniej ni¿ 3 * odchylenie standardowe

aggregate(data[,1], list(data$X7), sd) #odchylenie
aggregate(data[,1], list(data$X7), var) #wariancja
aggregate(data[,1], list(data$X7), mean) #srednia
aggregate(data[,1], list(data$X7), max) #max
aggregate(data[,1], list(data$X7), min) #min

anova <- aov(Y~X7, data = data) #parametry co od czego, z jakiego zbioru

summary(anova)

#Test Tukeya

TukeyHSD(anova)
#p-value = 0 wiêc:
#ró¿nica miêdzy ka¿d¹ z grup jest statystycznie istotna


#test pierwszego za³o¿enia na pochodzenie zmiennych z rozk³adu normalnego
reszty <- residuals(object = anova)

shapiro.test(reszty)

#test na równoœæ wariancji

(bartlet <- bartlett.test(Y~X7, data = data))

#p-value < 0.05 => nie s¹ równe


#TEST KRUSKALA nieparametryczny odpowiednik ANOVA'y
kruskal.test(Y~X7, data = data)
# p-value <0 => odrzucamy H0


#manova - ANOVA dla wielu p³aszczyzn
#cbind() -> ³¹czy ró¿ne kolumny data.frame
manova1 <- manova(cbind(data$X4, data$X5)~data$X7)
summary(manova1)

#####
#####
#Test na bycie statystycznie ró¿nym
#H0: u1 = u2, H1: u1 =/= u2
#spodziewamy siê p-value < 5% -> ró¿ne
wilcox.test(data$X2~data$X3)

#s¹ statystycznie takie same

#u-man-whitney nieparametryczny odpowiednik

