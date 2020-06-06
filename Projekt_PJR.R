#Sara Rupacz - projekt PJR

library(fivethirtyeight)
#do tally()
library(dplyr)

characters <- read.csv("https://github.com/fivethirtyeight/data/raw/master/comic-characters/dc-wikia-data.csv")

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


hairColorAmount %>% ggplot(aes(x=HAIR, y=Ilosc)) + geom_bar(stat = 'identity') + 
  ggtitle("Ilosc osob o danym kolorze wlosów") + 
  xlab("Kolor wlosów")+
  ylab("Calkowita ilosc osob")+
  theme(plot.title = element_text(size = 15, hjust=0.5, face= 'bold', margin = ))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 1)) +
  theme(axis.title.x = element_text( face="bold"))+
  theme(axis.title.y= element_text( face="bold"))


#Ilosc osob o roznych plciach
sexAmount_ToNieToCoMysliszSara_chodziOPlec <- characters %>% group_by(SEX) %>% tally()
sexAmount_ToNieToCoMysliszSara_chodziOPlec <- rename(sexAmount_ToNieToCoMysliszSara_chodziOPlec, Ilosc=n)
sexAmount_ToNieToCoMysliszSara_chodziOPlec <- sexAmount_ToNieToCoMysliszSara_chodziOPlec %>% arrange(desc(Ilosc))
sexAmount_ToNieToCoMysliszSara_chodziOPlec <- sexAmount_ToNieToCoMysliszSara_chodziOPlec[sexAmount_ToNieToCoMysliszSara_chodziOPlec$SEX != "", ]
sexAmount_ToNieToCoMysliszSara_chodziOPlec
#Wnioski - w zbiorze danych wystepuja wiecej, niz 2 plcie

sex_ToNieToCoMysliszSara_chodziOPlec %>% ggplot(aes(x=SEX, y=Ilosc)) + geom_bar(stat = 'identity') + 
  ggtitle("Ilosc dobrych i zlych charakterow") + 
  xlab("Tozszamosc")+
  ylab("Calkowita ilosc osob")+
  theme(plot.title = element_text(size = 15, hjust=0.5, face= 'bold', margin = ))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 1)) +
  theme(axis.title.x = element_text( face="bold"))+
  theme(axis.title.y= element_text( face="bold"))



idAmount <- characters %>% group_by(ID) %>% tally()
idAmount <- rename(idAmount, Ilosc=n)
idAmount <- idAmount %>% arrange(desc(Ilosc))
# Tutaj nalezaloby zsumowac wiersz 3 i 4 i nadac im wspolna nazwe
idAmount

idAmount %>% ggplot(aes(x=ID, y=Ilosc)) + geom_bar(stat = 'identity') + 
  ggtitle("Ilosc dobrych i zlych charakterow") + 
  xlab("Tozszamosc")+
  ylab("Calkowita ilosc osob")+
  theme(plot.title = element_text(size = 15, hjust=0.5, face= 'bold', margin = ))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 1)) +
  theme(axis.title.x = element_text( face="bold"))+
  theme(axis.title.y= element_text( face="bold"))


#Ilosc dobrych i zlych charakterow
alignColorAmount <- characters %>% group_by(ALIGN) %>% tally()
alignColorAmount <- rename(alignColorAmount, Ilosc=n)
alignColorAmount <- alignColorAmount %>% arrange(desc(Ilosc))
alignColorAmount <- alignColorAmount[alignColorAmountt$ALIGN != "", ]
alignColorAmount


alignColorAmount %>% ggplot(aes(x=ALIGN, y=Ilosc)) + geom_bar(stat = 'identity') + 
  ggtitle("Ilosc dobrych i zlych charakterow") + 
  xlab("Charakter")+
  ylab("Calkowita ilosc osob")+
  theme(plot.title = element_text(size = 15, hjust=0.5, face= 'bold', margin = ))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 1)) +
  theme(axis.title.x = element_text( face="bold"))+
  theme(axis.title.y= element_text( face="bold"))



head(characters)

eachYearFrequency <- characters %>% group_by(YEAR) %>% tally()
eachYearFrequency

eachYearFrequency %>% ggplot(aes(x=YEAR, y=n)) + geom_point() + geom_area() + 
  ggtitle("Ilosc postaci w danym roku") + 
  xlab("Rok")+
  ylab("Ilosc osób")+
  theme(plot.title = element_text(size = 15, hjust=0.5, face= 'bold', margin = ))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 1)) +
  theme(axis.title.x = element_text( face="bold"))+
  theme(axis.title.y= element_text( face="bold"))


#Wniosek - w kolejnych latach ilosc bohaterow raczej sie zwiekszala



#TODO
#ostatni wykrs polprzezroczysty
#Kolory w wykresach
#zmien czcionke z 15 na jakas inna wszedzie, bo to jest identycznie jak u nas => theme(plot.title = element_text(size = 15, hjust=0.5, face= 'bold', margin = ))
#Mozesz, a nawet powinnas zrobic wykres pokazujacy calkowita liczbe osob w dannych latach 
#    - przykladowo jesli w 1950 byly 2 osoby, to na wykresie powinno byc dwa, jesli w 1951 doszlo 10 osob, to na wykresie powinno byc 12
#Nie usuwaj tych pustych danych alignColorAmount <- alignColorAmount[alignColorAmountt$ALIGN != "", ] tylko lepiej jesli bedziesz tam zmieniala nazwe na "Not specified" lub cos w tym stylu
#Pobierz i zainstaluj sobie pakiet RMarkdown
