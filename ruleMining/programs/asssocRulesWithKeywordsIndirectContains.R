library(arules)
library(arulesViz)

data<-read.csv("R/transactionsIndirectWithKeywordsContains.csv")
head(data)

res <- apriori(data=data, parameter=list (support=0.1,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
inspect(sort(res), by="supp")
#ovaj nivo podrske ni u ovom slucaju ne daje nam rezultate, pa je spustamo

res <- apriori(data=data, parameter=list (support=0.01,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
inspect(res)
#i dalje nema pozeljnih rezultata, pa nastavljamo da spustamo nivo podrske

res <- apriori(data=data, parameter=list (support=0.001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesWithKeywordsIndirectContains1.txt")
sink(file=f)
print("Min support: 0.001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#vec dobijamo 1 rezultat, pa nastavljamo da spustamo podrsku
options(max.print = 5000)
res <- apriori(data=data, parameter=list (support=0.0001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesWithKeywordsIndirectContains2.txt")
sink(file=f)
print("Min support: 0.0001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#broj pravila se povecava, vrednost njihove lift mere je veoma dobra, pa spustamo podrsku i dalje

res <- apriori(data=data, parameter=list (support=0.00001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesWithKeywordsIndirectContains3.txt")
sink(file=f)
print("Min support: 0.00001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
# broj pravila se i ovde naglo povecava, a kako je lift mera i dalje veoma dobra, smanjimo
# podrsku jos malo da vidimo sta ce se desiti



####ODAVDE CAK I NEMA POTREBE DA SE RADI JER SE DOBIJA PREKO 2000 PRAVILA ########



# Vrednosti lift mere su, i ovde, iznad 10 za svako pravilo, sto nam ukazuje na njihovu zanimljivost

res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesWithKeywordsIndirectContains4.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
# kako smo opet dobili preko 2000 pravila sa visokim vrednostima lift mere, mozemo prekinuti