# Tab 4
#
#
tabItem4<-  shinydashboard::tabItem(
  tabName = "geneCataComp",
  shinydashboard::tabBox(width = 12,id = "tabset4",height = "100%",
         shiny::tabPanel(strong("Input metabolite or gene one by one"),
                  "",
                  shinydashboard::box(width=6,
                      title = strong("Input metabolite or gene"),
                      solidHeader = T,
                      height = "100%",
                      status = "primary",
                      fluidRow(
                        column(12,
                               helpText("If a compound is input,
		all genes that catalyze reactions involving the compound are returned."),
			       helpText("Conversely, if a gene is input, all compounds in reactions that are catalyzed by that gene are returned"),
			       h5(strong("IMPORTANT NOTE about inputting source IDs:")),
			       h5("When inputting source IDs, it is important to add a prefix to denote the id type.  This is important because it is possible for two different metabolites to have the same IDs, although each ID may be from a different database source."),
			       h5("Metabolites can be searched with the following ID types: CAS, chebi, chemspider, hmdb, kegg, LIPIDMAPS, and pubchem.  To search for a metabolite, the ID type must be added as a prefix.  For example, the compound 'HMDB0000562' must be searched by 'hmdb:HMDB0000562', the compound '16737' must be searched by 'chebi:16737'."),
                               textInput("CataInput","", placeholder = "Input compound name or id"),
                               radioButtons('CataInput_choices',label = 'Search by name or source id',
                                            choices = c('Names' = 'names','Source ID' = 'ids')),
                               selectInput("KW_cata", "Select from list", choices = NULL),
                               actionButton("subText_cata","Submit"),
			                         br(),
			                         br(),
			                         textOutput("summary_cata"),
			                         br(),
			                         shinydashboard::infoBoxOutput("statusbox_tab4_subtab1", width = NULL)
                        ) # end column
                      ) # end fluidRow
                    ),# end box
                  shinydashboard::box(width = 6,title = strong("Search Result:"),solidHeader = T,
                      status = "primary",
                      fluidRow(
                        div(style = "margin:25px;",
                            downloadButton("report_cata","Download Results"),
                            hr(),
                            DT::dataTableOutput("result_cata")
                        )
                      ) #end fluidRow
                  ), # end box
                  hr(),
#                   fluidRow(
#                     shinydashboard::box(
#                       width = 12,
#                       solidHeader = T,
#                       status = "info",
#                       collapsible = T,
#                       collapsed = F,
#                       title = strong("Summary"),
# 		      DT::dataTableOutput("result_cata")
#                       #uiOutput("preview_tab4")
#                     ) # end box
# 		  ), # end fluid row
		  hr(),
		  fluidRow(
                    shinydashboard::box(
                      width = 12,
		      height= "1000px",
                      solidHeader = T,
                      status = "primary",
                      collapsible = T,
                      collapsed = F,
                      title = strong("Visuazlize gene-metabolite interaction network"),
                      visNetwork::visNetworkOutput("network",height = '1000px')
                    ) # end box
		   ) # end fluidRow
         ),
         shiny::tabPanel(
           title = strong("Input a list of genes or metabolites"),
           fluidRow(
             shinydashboard::box(width = 6,
                 solidHeader = T,
                 status = "primary",
                 title = strong("Input a list of genes or metabolites"),
h5(strong("IMPORTANT NOTE about inputting source IDs:")),
                 h5("When inputting source IDs, it is important to add a prefix to denote the id type.  This is important because it is possible for two different metabolites to have the same IDs, although each ID may be from a different database source."),
                 h5("Metabolites can be searched with the following ID types: CAS, chebi, chemspider, hmdb, kegg, LIPIDMAPS, and pubchem.  To search for a metabolite, the ID type must be added as a prefix.  For example, the compound 'HMDB0000562' must be searched by 'hmdb:HMDB0000562', the compound '16737' must be searched by 'chebi:16737'."),
                 h5("Genes can be searched with the following ID types:  enzymeNomenclature, ensembl, entrez, hmdb, kegg, uniprot. Similar to metabolites, prefix ID types must be added to the ID for searching."),
                 h5(strong("Only one type of ID can be input: either source ID or name, not both")),
                 br(),
                 textAreaInput("input_mul_tab4",label = "",
                               placeholder = "Input list of genes or metabolites, one per line"),
                 radioButtons('input_mul_tab4_choices',label = 'Search by source id or name?',
                              choices = c('Name' = 'names','Source ID' = 'ids')),
                 actionButton("sub_mul_tab4",label = "Submit"),
                 br(),
                 br(),
                 textOutput("summary_cata_tab2"),
                 br(),
                 shinydashboard::infoBoxOutput("statusbox_tab4_subtab2", width = NULL)
             ), # end box
             shinydashboard::box(width = 6,
                 solidHeader = T,
                 status = "primary",
                 title = strong("Search Result"),
		 DT::dataTableOutput("preview_multi_names_tab4"),
		fluidRow(
			div(style = "margin:25px;",
 	 			downloadButton("tab4_mul_report",label = "Download Results"),
				hr()
			) # end div
		) # end fluidRow
	     ) # end box

#             shinydashboard::box(
#               width = 6,
#               title = strong("Upload File"),
#               solidHeader = T,
#               status = "primary",
#               fileInput("inp_file_tab4",label = "",
#                         multiple = FALSE,
#                         accept = c("text/csv","text/comma-separated-values,/text/plain",".csv",".txt"),
#                         buttonLabel = "Browse..."),
#               actionButton("sub_file_tab4",label = "Upload File and Run Query")
#             )
           ), # end fluidRow (with two boxes)
           hr(),
           fluidRow(
             #HTML("<div id='database-group-output'>"),
             #shinydashboard::box(width = 12,
             #    title = strong("Summary"),
             #    solidHeader = T,
             #    status = "primary",
             #    #downloadButton("tab4_mul_report",label = "Download Results"),
             #    #hr(),
             #    DT::dataTableOutput("preview_multi_names_tab4")
                 #highcharter::highchartOutput("tab4_hc_output")
             #), # end box
             #hr(),
             shinydashboard::box(
             width = 12,height="1000px",
            	solidHeader = T,
            	status = "primary",
            	collapsible = T,
            	collapsed = F,
            	title = strong("Visuazlize gene-metabolite interaction network"),
            	visNetwork::visNetworkOutput("networkmulti",height = '1000px')
             )
           ) # end 2nd fluidRow
         ) # end tab
     )# end tabBox
  )# end tabItem





