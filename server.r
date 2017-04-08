shinyServer(function(input, output){
  
  
  data.model <- reactive({
    
    data.model <- df[df$times >= input$durationx[1] & df$times <= input$durationx[2], ]
    data.model
  })
  
  
  
  output$plotx <- renderPlotly({
    
    
    datax <- data.model()
    
    if(input$variable == "gyroscope"){
      
      plot_ly(datax, x= ~timer, y= ~gyro_x ,type = "scatter", 
              mode = "lines+markers", color=I("green"), alpha = 0.3)%>%
        layout(xaxis = list(title="Time"), yaxis=list(title ="Gyroscope X"))
    }else{
      plot_ly(datax, x= ~timer, y= ~car_frame_x ,type = "scatter",
              mode = "lines+markers", color=I("green"), alpha = 0.3)%>%
        layout(xaxis = list(title="Time"), yaxis=list(title ="Car frame X"))
      
    }
    
  })
  
  output$ploty <- renderPlotly({
    
    datay <- data.model()
    
    if(input$variable == "gyroscope"){
      
      plot_ly(datay, x= ~timer, y= ~gyro_y ,type = "scatter",
              mode = "lines+markers", color=I("purple"), alpha = 0.3)%>%
        layout(xaxis = list(title="Time"), yaxis=list(title ="Gyroscope Y"))
    }else{
      plot_ly(datay, x= ~timer, y= ~car_frame_y ,type = "scatter", 
              mode = "lines+markers", color=I("purple"), alpha = 0.3)%>%
        layout(xaxis = list(title="Time"), yaxis=list(title ="Car frame Y"))
      
    }
    
  })
  
  output$plotz <- renderPlotly({
    
    
    dataz <- data.model()
    
    if(input$variable == "gyroscope"){
      
      plot_ly(dataz, x= ~timer, y= ~gyro_z ,type = "scatter", 
              mode = "lines+markers", color=I("red"), alpha = 0.3)%>%
        layout(xaxis = list(title="Time"), yaxis=list(title ="Gyroscope Z"))
    }else{
      plot_ly(dataz, x= ~timer, y= ~car_frame_z ,type = "scatter", 
              mode = "lines+markers", color=I("red"), alpha = 0.3)%>%
        layout(xaxis = list(title="Time"), yaxis=list(title ="Car frame Z"))
      
    }
    
  })
  
  output$plotMap <- renderPlot({
    
    
    datamap <- data.model()
    
    map_view <- get_googlemap(center = c(lon = mean(datamap$longitude), lat = mean(datamap$latitude)),
                              zoom = 13, size = c(640,300),
                              maptype = "roadmap", scale = 2)
    
    ggmap(map_view) +
      geom_point(data = print(datamap), aes_string(x = datamap$longitude, y = datamap$latitude,
                                                   alpha = 0.5), size = 0.4, shape = "-") +
      guides(fill=FALSE, alpha=FALSE, size=FALSE)
    
    
  })
  
  
  
  
})
