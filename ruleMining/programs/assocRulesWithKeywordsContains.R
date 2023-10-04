library(arules)
library(arulesViz)

data<-read.csv("R/transactionsWithKeywordsContains.csv")
head(data)

res <- apriori(data=data, parameter=list (support=0.1,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
inspect(sort(res), by="supp")
#ovaj nivo podrske ni u ovom slucaju ne daje nam rezultate, pa je spustamo

res <- apriori(data=data, parameter=list (support=0.01,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
inspect(res)
#i dalje nema pozeljnih rezultata, pa nastavljamo da spustamo nivo podrske

res <- apriori(data=data, parameter=list (support=0.001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
inspect(res)
#i dalje nema rezultata, pa nastavljamo kao i do sad sa spustanjem vrednosti podrske

options(max.print = 5000)
res <- apriori(data=data, parameter=list (support=0.0001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesWithKeywordsContains1.txt")
sink(file=f)
print("Min support: 0.0001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#ponovo dobijamo rezultate na istom mestu, vidimo da je vrednost lift mere veoma dobra

res <- apriori(data=data, parameter=list (support=0.00001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesWithKeywordsContains2.txt")
sink(file=f)
print("Min support: 0.00001, Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#vec sada dobijamo ogroman broj rezultata, a vrednost lift mere samo malo opala, sto je 
# veoma dobro



############ OVDE IMA PREKO 2000 REZULTATA ##########################

res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="contains_ind=IND_1"), minlen=3)
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rulesWithKeywordsContains3.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

# kako smo vec na ovom mestu naisli na preko 2000 rezultata, nema potrebe vise smanjivati 
# pouzdanost. Takodje, lift mera je i dalje veoma dobra, tako da su sva pravila zanimljiva
