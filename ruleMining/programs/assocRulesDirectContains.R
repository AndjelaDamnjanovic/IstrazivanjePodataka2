library(arules)
library(arulesViz)

data<-read.csv("R/transactionsContains.csv")
head(data)

res <- apriori(data=data, parameter=list (support=0.1,confidence = 0.7, target="rules"),appearance = list(default="lhs", rhs="contains_ind=IND_1"))
inspect(sort(res), by="supp")
#ni u ovom slucaju nema generisanih pravila


res <- apriori(data=data, parameter=list (support=0.01,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
inspect(res)
#i dalje nema pravila, pa spustamo podrsku

res <- apriori(data=data, parameter=list (support=0.001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
inspect(res)
#kako i dalje nema rezultata, nastavljamo da smanjujemo vrednost podrske

res <- apriori(data=data, parameter=list (support=0.0001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesContains1.txt")
sink(file=f)
print("Min support: 0.0001 Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#i dalje nema odgovarajucih pravila, te i dalje smanjujemo podrsku
options("max.print"=10000)
res <- apriori(data=data, parameter=list (support=0.00001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesContains2.txt")
sink(file=f)
print("Min support: 0.00001 Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#konacno dobijemo rezultate, pa smo ih upisali u fajl. Ako pogledamo vrednost njihove lift mere,
#vidimo da su to dobre vrednosti, ali ne toliko dobre kao u slucaju indeksa preseka

#sada, kada imamo rezultate, pokusacemo da dodatno smanjimo podrsku da vidimo koliko pravila
#cemo tada moci da generisemo. Takodje, mozemo pokusati i da smanjimo vrednost pouzdanosti
res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesContains3.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#i u ovom slucaju vidimo da je vrednost lift mere slicna 

res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.5, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesContains4.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.5")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#vrednost lift mere se ocekivano smanjila jer je broj generisanih pravila velik
