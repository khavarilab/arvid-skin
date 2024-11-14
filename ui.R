# This file defines the dashboard UI for the app

dash <-  dashboardPage(
    dashboardHeader(title = 'ARVID-Skin'),
    
    # Sidebar content
    dashboardSidebar(
      sidebarMenu(
        menuItem('Skin Disease SNPs', tabName = 'data', icon = icon('database')),
        menuItem('Metadata', tabName = 'metadata', icon = icon('book-open')),
        menuItem('Additional Info', tabName = 'about', icon = icon('circle-info'))
    )),
    
    # Body content
    dashboardBody(
      tabItems(
        
        tabItem(
          tabName = 'data',
          h3('Skin Disease CRE SNPs'),
          tags$br(),
          fluidRow(
            column(4,
                   selectInput('disease',
                               'Skin Disease:',
                               c('All',
                                 unique(as.character(df_studydata$`Skin Disease`))))
            ),
            column(4,
                   selectInput('dasnv',
                               'Differentially Active:',
                               c('-',
                                 unique(as.character(df_studydata$`Differentially Active`))))
            )
          ),
          # Create a new row for the table.
          dataTableOutput('studydata')
        ),
        tabItem(
          tabName = 'metadata',
          tags$div(
            tags$h3('Skin Disease MPRA Study'),
            tags$p('This study performed massively parallel reporter assays (MPRA) on 3,457 noncoding variants in genomic regions linked to risk for 15 of the most common human skin diseases in primary human keratinocytes.'), 
            tags$p('Tested variants were in linkage disequilibrium (r2 > 0.8) with 852 GWAS lead SNPs implicated in skin diseases and filtered through epigenetics.'),
            tags$p('A single-nucleotide resolution compendium of 355 differentially-active SNVs (daSNVs) in regulatory DNA associated with skin disease risk across epidermal differentiation were produced.'),
            tags$br(),
            tags$h4('Data description'),
            tableOutput('columnmeta')
          )
        ),
        
        tabItem(
          tabName = 'about',
          tags$div(
            tags$h3('Additional Information'),
            tags$br(),
            tags$h4('Suggested Citation'),
            tags$p('Porter, Meyers, Miao, Reynolds,  et. al. Disease-linked regulatory DNA variants and homeostatic transcription factors in epidermis.'),
            tags$br(),
            tags$br(),
            tags$h4('Data Download'),
            tags$a(href = 'study_data_download.csv', 'Download complete MPRA data', download = NA, target = '_blank'),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$h4('CUT&RUN Data'),
            tags$p('Population sampling CUT&RUN of skin homeostatic TFs across differentiation.'),
            tags$a(href = 'https://genome.ucsc.edu/s/Max/cnr', 'Genome Browser Tracks', target = '_blank'),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$a(href = 'https://arvid-data.shinyapps.io/home/', 'Back to ARVID Home'),
            tags$br()
          )
        )
        
      )
    )
  )
