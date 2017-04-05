library(data.table)
library(gridExtra)
library(moments)

# a)
casa = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==1]
ap = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==2]
comodo = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==3]


boxplot(casa, ap, comodo, las = 2 ,names = c('casa', 'apartamento', 'comodo'),
        col=c('red', 'blue', 'green'))

# b)
# criando listas que serão as colunas da tabela
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

# d)
com_energia = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['REDEGERALDEENERGIAELETRICA']==1]
sem_energia = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['REDEGERALDEENERGIAELETRICA']==2]

boxplot(com_energia, sem_energia, las = 2 ,names = c('sim', 'não'),
        col=c('blue', 'red'))

# e)
#assimetria
assimetria = c(skewness(com_energia), skewness(sem_energia))
# curtose
curtose = c(kurtosis(com_energia), skewness(sem_energia))

df2 = data.frame(assimetria, curtose)
(setattr(df2, "row.names", c("com_energia", "sem_energia")))
gridExtra::grid.table(df2)

# f)
renda_per_capita = dados_domiciliosCEA15P02$RENDA_PER_CAPITA_MENSAL
hist(renda_per_capita, 
     main="Renda Per Capita", 
     xlab="R$",
     ylab = 'Frequencia',
     border="blue", 
     col="green",
     xlim=c(100,5000),
     las=3, 
     breaks=1000)

# g)
# dividindo as rendas em salários mínimos conforme pede exercício
ate_um= dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'][dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] < 937]

um_dois = dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'][dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] >= 937 
                                                              & dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] < 937*2]

dois_quatro = dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'][dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] >= 2*937 
                                                                  & dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] < 4*937]

mais_que_quatro =  dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'][dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] >= 4*937] 

# numero de itens de cada vetor acima
freq = c(length(ate_um), length(um_dois), length(dois_quatro), 
         length(mais_que_quatro))
salarios <- c("< 1s.m", "1-2s.m", "2-4s.m", ">= 4 s.m")

# gráfico pizza
pie(freq, salarios, main = 'Renda', 
    col = c('red', 'blue', 'yellow', 'green'))

# h)

gas1= dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] < 937]

gas2 = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] >= 937 
                                                              & dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] < 937*2]

gas3 = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] >= 2*937 
                                                                  & dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] < 4*937]

gas4 =  dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['RENDA_PER_CAPITA_MENSAL'] >= 4*937] 


boxplot(gas1, gas2, gas3, gas4,
        main = 'Consumo de gás per capita segundo faixa salarial',
        las = 1 ,names = c("< 1s.m", "1-2s.m", "2-4s.m", ">= 4 s.m"),
        col=c('red', 'blue', 'yellow', 'green'))

# i)
qqnorm(renda_per_capita, 
       main = 'Gráfico Quantil-Quantil para Renda Per Capita',
       col = 'green')
