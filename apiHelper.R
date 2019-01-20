library(jsonlite)
library(httr)
token<-'U1iVZr2bMf'
urlbase<-'http://api.cne.cl/v3/'
endpoint<-'combustibles/vehicular/estaciones'

getBencineras<-function(){
  r<-GET(paste0(urlbase,endpoint),query=list(token=token))
  #print(r)
  return(fromJSON(content(r,encoding = 'UTF-8',type='text')))
}

