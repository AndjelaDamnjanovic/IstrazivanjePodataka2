library(arules)
library(arulesViz)

data<-read.csv("R/transactionsIndirectWithTaxonomy.csv")
head(data)

res <- apriori(data=data, parameter=list (support=0.1,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"), minlen=3)
inspect(sort(res), by="supp")
#ovaj nivo podrske ni u ovom slucaju ne daje nam rezultate, pa je spustamo

res <- apriori(data=data, parameter=list (support=0.01,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"), minlen=3)
inspect(res)
#i dalje nema pozeljnih rezultata, pa nastavljamo da spustamo nivo podrske

res <- apriori(data=data, parameter=list (support=0.001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"), minlen=3)
inspect(res)
#i dalje nema rezultata, pa nastavljamo kao i do sad sa spustanjem vrednosti podrske

res <- apriori(data=data, parameter=list (support=0.0001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"), minlen=3)
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesWithTaxonomyIndirect1.txt")
sink(file=f)
print("Min support: 0.0001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#kako vec ovde dobijamo rezultate, upisujemo ih u fajl
#sada, kada imamo rezultate, pokusacemo da dodatno smanjimo podrsku da vidimo koliko pravila
#cemo tada moci da generisemo. Takodje, mozemo pokusati i da smanjimo vrednost pouzdanosti

res <- apriori(data=data, parameter=list (support=0.00001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"), minlen=3)
plot(res)
plot(res, method="graph", limit=10)
f<-file("rulesWithTaxonomyIndirect2.txt")
sink(file=f)
print("Min support: 0.00001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)

# Vrednosti lift mere su, i ovde, iznad 10 za svako pravilo, sto nam ukazuje na njihovu 
# zanimljivost

res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"), minlen=3)
plot(res)
plot(res, method="graph", limit=10)
f<-file("rulesWithTaxonomyIndirect3.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#i u ovom slucaju vidimo da je lift mera svakog pravila veca od 10, sto nam govori da su sva
#pravila koja smo dobili veoma dobra

res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.5, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"), minlen=3)
plot(res)
plot(res, method="graph", limit=10)
f<-file("rulesWithTaxonomyIndirect4.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.5")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#ovde vidimo da imamo i pravila cija je lift mera manja od 10, ali i dalje je dobvoljno
#velika da bismo pravila smatrali zanimljivim. Stavise, pravila sa malo manjom lift merom
#su vise zastupljena, pa nam ona mogu biti cak i zanimljivija od onih sa vecom lift merom
