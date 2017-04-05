

# pegar os dados que se referem somente a USP
df = BRCAPES_COLSUCUP_DOCENTE2015[
  BRCAPES_COLSUCUP_DOCENTE2015[,'SG_ENTIDADE_ENSINO'] == 'USP',]

# separar df em dados de mulheres e homens docentes epor 
# área de atuação:
# Ciência da Computação, Matemática Pura,
# Matemática Aplicada e Estatı́stica


BCC_M = df[df[,'NM_AREA_CONHECIMENTO'] == 'CIÊNCIA DA COMPUTAÇÃO' & 
           df[,'TP_SEXO_DOCENTE'] == 'FEMININO',]

BCC_H = df[df[,'NM_AREA_CONHECIMENTO'] == 'CIÊNCIA DA COMPUTAÇÃO' & 
             df[,'TP_SEXO_DOCENTE'] == 'MASCULINO',]

MAP_M = df[df[,'NM_AREA_CONHECIMENTO'] == 'MATEMÁTICA' & 
             df[,'TP_SEXO_DOCENTE'] == 'FEMININO',]

MAP_H = df[df[,'NM_AREA_CONHECIMENTO'] == 'MATEMÁTICA' & 
             df[,'TP_SEXO_DOCENTE'] == 'MASCULINO',]

ESTAT_M = df[df[,'NM_AREA_CONHECIMENTO'] == 'PROBABILIDADE E ESTATÍSTICA' & 
                  df[,'TP_SEXO_DOCENTE'] == 'FEMININO',]

ESTAT_H = df[df[,'NM_AREA_CONHECIMENTO'] == 'PROBABILIDADE E ESTATÍSTICA' & 
               df[,'TP_SEXO_DOCENTE'] == 'MASCULINO',]

# Não achei Matemática Aplicada

# Achar frequência de cada um
BCC_M_freq = length(BCC_M$ID_DOCENTE)
BCC_H_freq = length(BCC_H$ID_DOCENTE)
MAP_M_freq = length(MAP_M$ID_DOCENTE)
MAP_H_freq = length(MAP_H$ID_DOCENTE)
ESTAT_M_freq = length(ESTAT_M$ID_DOCENTE)
ESTAT_H_freq = length(ESTAT_H$ID_DOCENTE)

# Fazer o mesmo para os discentes

barplot(main = '')












-------------------------------------------------------------------
# pegar os dados que se referem somente a USP
discentes <- read.csv('/home/cloves/Documentos/Estatística/Descritiva/BRCAPES_COLSUCUP_DISCENTE2015.csv', 
                        sep=";", encoding = "UTF-8")

  
df2 = discentes[discentes[,'SG_ENTIDADE_ENSINO'] == 'USP',]

# separar df em dados de mulheres e homens docentes epor 
# área de atuação:
# Ciência da Computação, Matemática Pura,
# Matemática Aplicada e Estatı́stica


BCC_M_dis = df2[df2[,'NM_AREA_CONHECIMENTO'] == 'CI<ca>NCIA DA COMPUTA<c7><c3>O' & 
             df2[,'TP_SEXO_DISCENTE'] == 'FEMININO',]

BCC_H_dis = df2[df2[,'NM_AREA_CONHECIMENTO'] == 'CI<ca>NCIA DA COMPUTA<c7><c3>O' & 
             df2[,'TP_SEXO_DISCENTE'] == 'MASCULINO',]

MAP_M_dis = df2[df2[,'NM_AREA_CONHECIMENTO'] == 'MATEM<c1>TICA' & 
             df2[,'TP_SEXO_DISCENTE'] == 'FEMININO',]

MAP_H_dis = df2[df2[,'NM_AREA_CONHECIMENTO'] == 'MATEM<c1>TICA' & 
             df2[,'TP_SEXO_DISCENTE'] == 'MASCULINO',]

ESTAT_M_dis = df2[df2[,'NM_AREA_CONHECIMENTO'] == 'PROBABILIDADE E ESTAT<cd>STICA' & 
               df2[,'TP_SEXO_DISCENTE'] == 'FEMININO',]

ESTAT_H_dis = df2[df2[,'NM_AREA_CONHECIMENTO'] == 'PROBABILIDADE E ESTAT<cd>STICA' & 
               df2[,'TP_SEXO_DISCENTE'] == 'MASCULINO',]

# Achar frequência de cada um
BCC_M_freq_dis = length(BCC_M_dis)
BCC_H_freq_dis = length(BCC_H_dis$AN_BASE)
MAP_M_freq_dis = length(MAP_M_dis$AN_BASE)
MAP_H_freq_dis = length(MAP_H_dis$AN_BASE)
ESTAT_M_freq_dis = length(ESTAT_M_dis$AN_BASE)
ESTAT_H_freq_dis = length(ESTAT_H_dis$AN_BASE)
