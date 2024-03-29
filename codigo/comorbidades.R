if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)
covid_19_bauru_mortes <- read_excel("dados/covid_19_bauru_mortes.xlsx")
comorbidades <- table(covid_19_bauru_mortes$comorbidade)
par(mar=c(5,30,4,1)+.1)
barplot(sort(comorbidades, decreasing=TRUE),
        horiz = TRUE,
        las = 1)
mtext(side = 1, text = "Mortes", line = 2)
box(bty = "L")

par(mfrow = c(1,1))
