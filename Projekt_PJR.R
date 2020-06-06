#Sara Rupacz - projekt PJR

getwd()
setwd("C:/Users/Sosna/Desktop/PJR Sara/Sara_PJR/")

library(fivethirtyeight)
#do tally()
library(dplyr)

characters <- read.csv("https://github.com/fivethirtyeight/data/raw/master/comic-characters/dc-wikia-data.csv")
# characters
# write.csv(characters, file = "./NotProcessedData.csv")

head(characters)
 
#Ilosc osob o roznych kolorach oczu
eyeColorAmount <- characters %>% group_by(EYE) %>% tally()
eyeColorAmount <- rename(eyeColorAmount, Ilosc=n)
eyeColorAmount <- eyeColorAmount %>% arrange(desc(Ilosc))

#Pierwsza wartosc nie jest okreslona - rozwiazanie na pale :/
# eyeColorAmount[1,1] = "Not specified"

#Usuwa wartosci, przy ktorych ludzie nie okreslili koloru oczu
eyeColorAmount <- eyeColorAmount[eyeColorAmount$EYE != "", ]
eyeColorAmount


eyeColorAmount %>% ggplot(aes(x=EYE, y=Ilosc)) + geom_bar(stat = 'identity') + 
  ggtitle("Ilosc osob o danym kolorze oczu") + 
  xlab("Kolor oczu")+
  ylab("Calkowita ilosc osob")+
  theme(plot.title = element_text(size = 15, hjust=0.5, face= 'bold', margin = ))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 1)) +
  theme(axis.title.x = element_text( face="bold"))+
  theme(axis.title.y= element_text( face="bold"))




#Ilosc osob o roznych kolorach wlosow
hairColorAmount <- characters %>% group_by(HAIR) %>% tally()
hairColorAmount <- rename(hairColorAmount, Ilosc=n)
hairColorAmount <- hairColorAmount %>% arrange(desc(Ilosc))
hairColorAmount <- hairColorAmount[hairColorAmount$HAIR != "", ]
hairColorAmount


#Identyczny wykres jak dla oczu - tylko podmien ggtitle i eye na haircolor


#Ilosc osob o roznych plciach
sexAmount_ToNieToCoMysliszSara_chodziOPlec <- characters %>% group_by(SEX) %>% tally()
sexAmount_ToNieToCoMysliszSara_chodziOPlec <- rename(sexAmount_ToNieToCoMysliszSara_chodziOPlec, Ilosc=n)
sexAmount_ToNieToCoMysliszSara_chodziOPlec <- sexAmount_ToNieToCoMysliszSara_chodziOPlec %>% arrange(desc(Ilosc))
sexAmount_ToNieToCoMysliszSara_chodziOPlec <- sexAmount_ToNieToCoMysliszSara_chodziOPlec[sexAmount_ToNieToCoMysliszSara_chodziOPlec$SEX != "", ]
sexAmount_ToNieToCoMysliszSara_chodziOPlec
#Wnioski - w zbiorze danych wystepuja wiecej, niz 2 plcie

#Identyczny wykres jak dla oczu - tylko podmien ggtitle i eye na haircolor



idAmount <- characters %>% group_by(ID) %>% tally()
idAmount <- rename(idAmount, Ilosc=n)
idAmount <- idAmount %>% arrange(desc(Ilosc))
# Tutaj nalezaloby zsumowac wiersz 3 i 4 i nadac im wspolna nazwe
idAmount

#Identyczny wykres jak dla oczu - tylko podmien ggtitle i eye na haircolor