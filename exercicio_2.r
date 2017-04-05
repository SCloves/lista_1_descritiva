library(data.table)
library(gridExtra)

casa = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==1]
ap = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==2]
comodo = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==3]

boxplot(casa, ap, comodo, las = 2 ,names = c('casa', 'apartamento', 'comodo'),
        col=c('red', 'blue', 'green'))

# criando listas 
media = c(mean(casa), mean(ap), mean(comodo))
mediana = c(median(casa), median(ap), median(comodo))
minimo = c(min(casa), min(ap), min(comodo))
maximo = c(max(casa), max(ap), max(comodo))
q1 = c(quantile(casa, .25), quantile(ap, .25), quantile(comodo, .25))
q3 = c(quantile(casa, .75), quantile(ap, .75), quantile(comodo, .75))
dp = c(sd(casa), sd(ap), sd(comodo))

# criar tabela
df = data.frame(media, mediana, minimo, maximo, q1, q3, dp)
# renomear linhas
(setattr(df, "row.names", c("casa", "ap", "comodo")))
# imprimir imagem de tabela com grades
gridExtra::grid.table(df)

