#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "bootstrap1.css", 
                  
                  navbarPage("Fais ton mercato MPG!",
                             tabPanel("Revue des effectifs",
                                      fluidRow(
                                        column(width=3,
                                               wellPanel(
                                                 selectInput(inputId = "team",
                                                             label = "Equipe : ",
                                                             choices = c("PSG" = "Paris", 
                                                                         "OM" = "Marseille",
                                                                         "OL" = "Lyon",
                                                                         "AS Monaco" = "Monaco",
                                                                         "ASSE" = "Saint-Ã‰tienne", 
                                                                         "Stade Rennais FC" = "Rennes",
                                                                         "Lille" = "Lille",
                                                                         "RC Strasbourg" = "Strasbourg",
                                                                         "FC Nantes" = "Nantes",
                                                                         "OGC Nice" = "Nice",
                                                                         "Montpellier HSC" = "Montpellier",
                                                                         "Brest" = "Brest",
                                                                         "SCO Angers" = "Angers",
                                                                         "Dijon FC" = "Dijon",
                                                                         "Stade Brestois 29" = "Brest",
                                                                         "FC Girondins de Bordeaux" = "Bordeaux",
                                                                         "Lens" ="Lens",
                                                                         "Stade de Reims" = "Reims",
                                                                         "Nimes Olympiques" = "NÃ®mes",
                                                                         "FC Metz" = "Metz")), 
                                                 
                                                 selectInput(inputId="tri",
                                                             label="Classer par :", 
                                                             choices = c("Poste"="Poste",
                                                                         "Cote"="Cote")),
                                                 
                                                 actionButton("update_team", "GO !", style="color:blue ; background-color:white ; border-color: black")
                                               )
                                               
                                        ),
                                        
                                        column(width = 5,
                                               tableOutput("effectif")
                                        ),
                                        
                                        column(width = 4,
                                               uiOutput("img_team")) 
                                      )
                             ),
                             navbarMenu("Nos Top",
                                        tabPanel(h3("Les meilleurs par postes"),
                                                 fluidRow(
                                                   column(width = 6,
                                                          h3("Top attaquants"),
                                                          tableOutput("top_att"),
                                                          h1("_"),
                                                          h3("Top millieux"),
                                                          tableOutput("top_mil")
                                                   ),
                                                   
                                                   column(width = 6,
                                                          h3("Top defenseurs"),
                                                          tableOutput("top_def"),
                                                          h1("_"),
                                                          h3("Top gardiens"),
                                                          tableOutput("top_G"))
                                                 )
                                        ),
                                        
                                        tabPanel(h3("Les joueurs sur lesquels investir"),
                                                 fluidRow(
                                                   column(width = 6,
                                                          h3("Top performances"),
                                                          p(em("Les joueurs aux performances les plus abouties et les plus régulières.")),
                                                          tableOutput("top_perf"),
                                                          h1("_"),
                                                          h3("Top buteurs"),
                                                          p(em("Les joueurs ayant marqué le plus de buts dans la saison en cours.")),
                                                          tableOutput("top_buteur")
                                                   ),
                                                   column(width = 6,
                                                          h3("Les plus chers"),
                                                          p(em("Les joueurs les plus chers sur le marché.")),
                                                          tableOutput("top_cote"),
                                                          h1("_"),
                                                          h3("Les perles rares"),
                                                          p(em("Des joueurs alliant bonnes performances, régularité et, le tout, pour un prix d'achat faible.")),
                                                          tableOutput("top_perle")
                                                   )
                                                 )
                                        )
                             ),
                             
                             tabPanel("Mercato",
                                      sidebarLayout(
                                        sidebarPanel(
                                          selectInput(inputId = "gardiens",
                                                      label = "Combien de gardiens veux tu pour proteger tes buts ? ",
                                                      choices = c("2" = "2",
                                                                  "3" = "3",
                                                                  "4" = "4",
                                                                  "5 - Mais penses aux autres postes" = "5"),
                                                      selected = "2"),
                                          
                                          selectInput(inputId = "def",
                                                      label = "Combien de défenseurs veux tu pour ton caténacchio ? ",
                                                      choices = c("6" = "6",
                                                                  "7" = "7",
                                                                  "8 - Avec ça si ils marquent ... ! " = "8"),
                                                      selected = "6"),
                                          
                                          selectInput(inputId = "mil",
                                                      label = "Combien de milieux pour maitriser l'entrejeu ? ",
                                                      choices = c("6" = "6",
                                                                  "7" = "7",
                                                                  "8" = "8"),
                                                      selected = "6"),
                                          
                                          selectInput(inputId = "att",
                                                      label = "Combien d'attaquants veux tu dans ta team ? ",
                                                      choices = c("4" = "4",
                                                                  "5" = "5", 
                                                                  "6" = "6",
                                                                  "7" = "7",
                                                                  "8 - Mais la t'abuses...! " = "8"), 
                                                      selected = "4"),
                                          
                                          sliderInput(inputId = "maxG",
                                                      label = "Combien de millions veux tu dépenser au maximum pour tes gardiens ? ",
                                                      min = 0, 
                                                      max = 500,
                                                      value = 500, 
                                                      step = 1),
                                          
                                          sliderInput(inputId = "maxdef",
                                                      label = "Combien de millions veux tu dépenser au maximum pour tes défenseurs ? ",
                                                      min = 0, 
                                                      max = 500,
                                                      value = 500, 
                                                      step = 1),
                                          
                                          sliderInput(inputId = "maxmil",
                                                      label = "Combien de millions veux tu dépenser au maximum pour tes milieux ? ",
                                                      min = 0, 
                                                      max = 500,
                                                      value = 500, 
                                                      step = 1),
                                          
                                          sliderInput(inputId = "maxatt",
                                                      label = "Combien de millions veux tu dépenser au maximum pour tes attaquants ? ",
                                                      min = 0, 
                                                      max = 500,
                                                      value = 500, 
                                                      step = 1),
                                          
                                          selectInput(inputId = "jpref",
                                                      label = "Y a t-il un joueur que tu veux absolument dans ton équipe ? ",
                                                      choices = c(note_mpg$Joueur),
                                                      multiple = TRUE),
                                          
                                          selectInput(inputId = "jdet",
                                                      label = "Y a t-il un joueur que tu ne veux pas dans ton équipe ? ? ",
                                                      choices = c(note_mpg$Joueur),
                                                      multiple = TRUE),
                                          
                                        ),
                                        
                                        mainPanel(
                                          actionButton("update_mercato", 
                                                       h2(strong("Go mercato, montrez moi cette team de rêve !")), 
                                                       icon("futbol", 
                                                            class="far fa-futbol"), 
                                                       style="color: white; background-color: darkgreen; border-color: black"),
                                          h2("Voici ton mercato idéal"),
                                          p("La variable cote_alpha est la somme que nous te conseillons de miser"),
                                          tableOutput("mercato_table")
                                        )
                                      )
                             ),
                             
                             tabPanel("Methodologie",
                                      sidebarLayout(
                                        sidebarPanel(width = 0),
                                        mainPanel(
                                          h2("Presentation des données : "),
                                          DT::dataTableOutput("note_mpg"),
                                          h2("Multiplicateur de performance "),
                                          plotOutput("beta"),
                                          p("On applique ce multiplicateur de performance au score obtenu par un joueur a la journée de ligue 1 correspondante.
                               Exemple : A la journée 15 on multiplie le score des joueurs par 2.6."),
                                          helpText("Ensuite on somme l'ensemble des notes pondéré par beta pour obtenir une nouvelle variable : ", code("performance_beta"),),
                                          verbatimTextOutput("perf_beta_summary"),
                                          h2("Multiplicateur de cote"),
                                          p("Il est nécessaire dans MPG de miser plus d'argent que la cote des joueurs, 
                               et ceci d'autant plus si le joueur est très coté sur le marché des transfert."),
                                          p("Ainsi nous avons mis en place un multiplicateur de cote alpha qui afin d'obtenir la cote_alpha, 
                               qui est la somme que nous conseillons de miser"),
                                          plotOutput("alpha"),
                                          p("Exemple : Pour un joueur coté a 20M sur le marché des transfert,
                               nous lui attribuons une cote de 32 (20 * 1.58) "), 
                                          h5("Nous rajoutons un peu bruit sur la cote alpha pour avoir de la variabilité des joueurs choisis et sur la mise conseillé."),
                                          p(""),
                                          h2("Algorithme d'optimisation : OMPR"),
                                          p("Afin d'optimiser la performance et le nombre de buts des joueurs selectionné,
                               nous avons appliqué un algorithme d'optimisation linéaire."),
                                          p("Dans cet algorithme, nous pouvons fixer un objectif (maximiser buts + performance_beta) et 
                               des contraintes ( 500M max, nombre de joueurs, selectionné un joueurs en particulier etc). "),
                                          p("Voici le code mis en place pour l'algorithme (avec les parametres par default) : "),
                                          verbatimTextOutput("text"),
                                          h3("Sortie de l'algorithme : "),
                                          tableOutput("mercato_ex"),
                                          width = 12
                                        )
                                        
                                      )
                             )
                             
                  )
)
)
