library(arules)
library(arulesViz)

data<-read.csv("R/transactionsIndirectContains.csv")
head(data)

res <- apriori(data=data, parameter=list (support=0.1,confidence = 0.7, target="rules"),appearance = list(default="lhs", rhs="contains_ind=IND_1"))
inspect(sort(res), by="supp")
# opet nema izdvojenih pravila

res <- apriori(data=data, parameter=list (support=0.01,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
inspect(res)
#nema pravila koja zadovoljavaju sve uslove, pa smanjujemo podrsku i dalje

res <- apriori(data=data, parameter=list (support=0.001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesIndirectContains1.txt")
sink(file=f)
print("Min support: 0.001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#nasli smo jedno pravilo, ali nastavljamo da spustamo podrsku

res <- apriori(data=data, parameter=list (support=0.0001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesIndirectContains2.txt")
sink(file=f)
print("Min support: 0.0001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#kao sto mozemo videti iz datoteke, pravila imaju veoma dobru vrednost lift mere, ali i dalje
# ne toliko dobru kao pravila dobijena sa indeksom preseka

options(max.print=5000)
res <- apriori(data=data, parameter=list (support=0.00001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesIndirectContains3.txt")
sink(file=f)
print("Min support: 0.00001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#sada smo vec dobili znacajan broj pravila, a lift mera je i dalje veoma dobra, sto je dobar znak 

#nastavljamo da spustamo vrednost podrske
res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesIndirectContains4.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#i u ovom slucaju vidimo da je lift mera dovoljno dobra

res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.5, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"))
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesIndirectContains5.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.5")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#sada vidimo da vrednost lift mere otpada, ali je i dalje dovoljno velika da bi se
# sva pravila smatrala zanimljivim