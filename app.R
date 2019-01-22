#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source('apiHelper.R')
library(shiny)
library(leaflet)
library(leaflet.extras)

data<-getBencineras()
names(data[[3]]$ubicacion)=c('latitude','longitude')

ui <- fluidPage(
   
   # Application title
   titlePanel("Precio bencina"),
   leafletOutput('map')
 

)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$map <- renderLeaflet({
     leaflet()%>%
       addProviderTiles(providers$OpenStreetMap,
                        #,providerTileOptions(noWrap = TRUE)
                        ) %>%
       addMarkers(data=data[[3]]$ubicacion)%>%
       setView(lat =-33.437492 ,lng  =-70.651062 ,zoom=15)%>%
       addControlGPS(options=gpsOptions(position = "topleft", activate = TRUE, 
                                        autoCenter = TRUE, maxZoom = 15, 
                                        setView = TRUE))%>%
       activateGPS()
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

