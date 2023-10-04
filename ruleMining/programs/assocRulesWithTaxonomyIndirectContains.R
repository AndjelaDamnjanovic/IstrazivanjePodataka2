library(arules)
library(arulesViz)

data<-read.csv("R/transactionsIndirectWithTaxonomyContains.csv")
head(data)

res <- apriori(data=data, parameter=list (support=0.1,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
inspect(sort(res), by="supp")
#ovaj nivo podrske ni u ovom slucaju ne daje nam rezultate, pa je spustamo

res <- apriori(data=data, parameter=list (support=0.01,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
inspect(res)
#i dalje nema pozeljnih rezultata, pa nastavljamo da spustamo nivo podrske

res <- apriori(data=data, parameter=list (support=0.001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesWithTaxonomyIndirectContains1.txt")
sink(file=f)
print("Min support: 0.001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#dobijen je 1 rezultat, pa spustamo podrsku i dalje

res <- apriori(data=data, parameter=list (support=0.0001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesWithTaxonomyIndirectContains2.txt")
sink(file=f)
print("Min support: 0.0001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
# sada vec dobijamo vise rezultata, a lift mera je kao i do sad veoma dobra
options(max.print = 5000)
res <- apriori(data=data, parameter=list (support=0.00001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesWithTaxonomyIndirectContains3.txt")
sink(file=f)
print("Min support: 0.00001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
# broj pravila opet naglo raste, a lift mera je i dalje veoma dobra, sto je pozitivno



############## PREKO 1300 REZULTATA ISPOD #######################3

res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method="graph", limit=15)
f<-file("rulesWithTaxonomyIndirectContains4.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#opet smo dosli do velikog broja pravila cija je lift mera veoma dobra, pa prestajemo 