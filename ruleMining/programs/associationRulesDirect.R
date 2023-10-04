install.packages("arules")
install.packages("arulesViz")

library(arules)
library(arulesViz)

data<-read.csv("R/transactions.csv")
head(data)

res <- apriori(data=data, parameter=list (support=0.1,confidence = 0.7, target="rules"),appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
inspect(sort(res), by="supp")
#vidimo da nema rezultata, pa spustamo nivo podrske

res <- apriori(data=data, parameter=list (support=0.01,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
inspect(res)
#ako opet pogledamo rezultate, videcemo da ne postoji nijedno pravilo koje zadovoljava date kriterijume,
#te zato opet smanjujemo podrsku

res <- apriori(data=data, parameter=list (support=0.001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
inspect(res)
#kako i dalje nema rezultata, nastavljamo da smanjujemo vrednost podrske

res <- apriori(data=data, parameter=list (support=0.0001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
inspect(res)
#i dalje nema odgovarajucih pravila, te i dalje smanjujemo podrsku

res <- apriori(data=data, parameter=list (support=0.00001,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 20)
f<-file("rules1.txt")
sink(file=f)
print("Min support: 0.00001 Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)
  
close(f)
#konacno dobijemo rezultate, pa smo ih upisali u fajl. Ako pogledamo vrednost njihove lift mere, 
#vidimo da su to veoma velike vrednosti, sto nam govori o kvalitetu pravila, iako je 
#pokrivenost mala sto se takodje moze videti iz rezultujuce tabele

#sada, kada imamo rezultate, pokusacemo da dodatno smanjimo podrsku da vidimo koliko pravila
#cemo tada moci da generisemo.
res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.7, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rules2.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.7")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#i u ovom slucaju vidimo da je lift mera svakog pravila veca od 10, sto nam govori da su sva
#pravila koja smo dobili veoma dobra

# spustimo sada i pouydanost da vidimo sta se desava
res <- apriori(data=data, parameter=list (support=0.000005,confidence = 0.5, target="rules"), appearance = list(default="lhs", rhs="intersect_ind=IND_1"))
plot(res)
plot(res, method = "graph", limit = 15)
f<-file("rules3.txt")
sink(file=f)
print("Min support: 0.000005,  Min confidence: 0.5")
inspect(sort(res, by="lift"))
sink(file=NULL)

close(f)
#ovde vidimo da imamo i pravila cija je lift mera manja od 10, ali i dalje je dobvoljno
#velika da bismo pravila smatrali zanimljivim. Stavise, pravila sa malo manjom lift merom
#su vise zastupljena, pa nam ona mogu biti cak i zanimljivija od onih sa vecom lift merom
