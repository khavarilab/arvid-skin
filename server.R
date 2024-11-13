# Contains server logic 

serv <- function(input, output) {
  
  output$studydata <- renderDataTable({
    data = df_studydata
    if (input$disease != 'All') {
      data = data[data$`Skin Disease` %in% input$disease, ]
    }
    if (input$dasnv != '-') {
      data = data[data$`Differentially Active` %in% input$dasnv, ]
    }
    datatable(data, options = list(scrollX = TRUE))
  })
  
  # output$studymeta <- renderTable({
  #   df_studymeta
  # }, striped = T)
  
  output$columnmeta <- renderTable({
    df_columnmeta
  }, striped = T)
}

