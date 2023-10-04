library(arules)
library(arulesViz)

data<-read.csv("R/transactionsIndirect.csv")
head(data)

res <- apriori(data=data, parameter=list (support=0.1,confidence = 0.7, target="rules"),appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
inspect(sort(res), by="supp")
# nije generisano nijedno pravilo, pa smanjujemo podrsku

res <- apriori(data=data, parameter=list (support=0.01,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
inspect(res)
#nema pravila koja zadovoljavaju sve uslove, pa smanjujemo podrsku i dalje

res <- apriori(data=data, parameter=list (support=0.001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
inspect(res)
#i dalje nema rezultata, pa i dalje smanjujemo podrsku

res <- apriori(data=data, parameter=list (support=0.0001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesIndirect1.txt")
sink(file=f)
print("Min support: 0.00001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#dobijamo 1 rezultat, pa ga upisujemo u datoteku


res <- apriori(data=data, parameter=list (support=0.00001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesIndirect2.txt")
sink(file=f)
print("Min support: 0.00001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#opet dobijamo rezultate i upisujemo u fajl. Ako pogledamo vrednost njihove lift mere, 
#vidimo da su to veoma velike vrednosti, sto nam govori o kvalitetu pravila, iako je pokrivenost 
#mala sto se takodje moze videti iz rezultujuce tabele

#sada, kada imamo obimnije rezultate, pokusacemo da dodatno smanjimo podrsku da vidimo koliko pravila
#cemo tada moci da generisemo. Takodje, mozemo pokusati i da smanjimo vrednost pouzdanosti
res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesIndirect3.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#i u ovom slucaju vidimo da je lift mera svakog pravila veca od 10, sto nam govori da su sva
#pravila koja smo dobili veoma dobra

res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.5, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesIndirect4.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.5")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#ovde vidimo da imamo i pravila cija je lift mera manja od 10, ali i dalje je dobvoljno
#velika da bismo pravila smatrali zanimljivim. Stavise, pravila sa malo manjom lift merom
#su vise zastupljena, pa nam ona mogu biti cak i zanimljivija od onih sa vecom lift merom