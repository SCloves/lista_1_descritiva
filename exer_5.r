

# docentes apenas da usp
df_usp_dos = BRCAPES_COLSUCUP_DOCENTE2015[
  BRCAPES_COLSUCUP_DOCENTE2015[,'SG_ENTIDADE_ENSINO'] == 'USP',]

# quero apenas duas colunas:
# NM_AREA_CONHECIMENTO e TP_SEXO_DOCENTE
df_usp_dos = subset(df_usp_dos, select=c("NM_AREA_CONHECIMENTO", "TP_SEXO_DOCENTE"))

# selecionar os docentes de nossa área de interesse, a saber:
# Ciência da Computação, Matemática Pura,
# Matemática Aplicada e Estatística.
# Obs: não encontrei NM_AREA_CONHECIMENTO == Matemática Aplicada ou Matemática Pura
# portanto resumi apenas em Matemática
df_ime_dos = df_usp_dos[
              df_usp_dos[,'NM_AREA_CONHECIMENTO'] == 'CIÊNCIA DA COMPUTAÇÃO' | 
              df_usp_dos[,'NM_AREA_CONHECIMENTO'] == 'MATEMÁTICA' |
              df_usp_dos[,'NM_AREA_CONHECIMENTO'] == 'PROBABILIDADE E ESTATÍSTICA',]

# gerando gráfico de barras estilo Stacked 
ime_dos <- table(df_ime_dos$TP_SEXO_DOCENTE, df_ime_dos$NM_AREA_CONHECIMENTO)
barplot(ime_dos, main="Docentes do IME",
        col=c("pink","blue"),
        legend = rownames(ime_dos))
# -------------------------------------------
# fazendo o mesmo para os discentes

# discentes apenas da usp
df_usp_dis = discentes[discentes[,'SG_ENTIDADE_ENSINO'] == 'USP',]

# quero apenas duas colunas:
# NM_AREA_CONHECIMENTO e TP_SEXO_DOCENTE
df_usp_dis = subset(df_usp_dis, select=c("NM_AREA_CONHECIMENTO", "TP_SEXO_DISCENTE"))

# selecionar os discentes de nossa área de interesse, a saber:
# Ciência da Computação, Matemática Pura,
# Matemática Aplicada e Estatística.
# Obs: não encontrei NM_AREA_CONHECIMENTO == Matemática Aplicada ou Matemática Pura
# portanto resumi apenas em Matemática
df_ime_dis = df_usp_dis[
  df_usp_dis[,'NM_AREA_CONHECIMENTO'] == 'CIÊNCIA DA COMPUTAÇÃO' | 
    df_usp_dis[,'NM_AREA_CONHECIMENTO'] == 'MATEMÁTICA' |
    df_usp_dis[,'NM_AREA_CONHECIMENTO'] == 'PROBABILIDADE E ESTATÍSTICA',]

# gerando gráfico de barras estilo Stacked 
ime_dis <- table(df_ime_dis$TP_SEXO_DISCENTE, df_ime_dis$NM_AREA_CONHECIMENTO)
barplot(ime_dis, main="Discentes do IME",
        col=c("pink","blue"),
        legend = rownames(ime_dis))
