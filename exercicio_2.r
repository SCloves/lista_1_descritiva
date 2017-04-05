casa = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==1]
ap = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==2]
comodo = dados_domiciliosCEA15P02['consumo_per_capita'][dados_domiciliosCEA15P02['TIPODEDOMICILIO']==3]

boxplot(casa, ap, comodo)
