#' Run Shiny App
#'
#' This function launches the RShiny app.  It requires a connection to the RaMP database as input, which requires running the function connectoToRaMP() and providing the MySQL password.
#'
#' @param conpass password for database access (string)
#' @param host host name for database access (default is "localhost")
#' @param username username for database access
#' @param dbname database name for database access
#' @examples
#' \dontrun{
#' con <- connectToRaMP(dbname="ramp",username="root",password="mypassword")
#' runRaMPapp(con=con)
#' }
#' @export
runRaMPapp <- function(conpass = NULL,host = 'localhost',
                       username = 'root',dbname = 'ramp') {
  .conpass <- .host <-.username <- .dbname <- con <- c()
  if(is.null(conpass)) {
        stop("Please define the password for the mysql connection")
  }
  appDir <- system.file("shinyApp",package = "RaMP")
  if (appDir == ""){
    DBI::dbDisconnect(con)
    stop("Could not find example directory. Try re-installing 'ramp'.")
  }
  # Make conpass a global variable so that it can be accessed by the shinyApp:
  .GlobalEnv$.conpass <- conpass
  .GlobalEnv$.host <- host
  .GlobalEnv$.username <- username
  .GlobalEnv$.dbname <- dbname
   on.exit(rm(.conpass, envir=.GlobalEnv))
   on.exit(rm(.host,envir = .GlobalEnv))
   on.exit(rm(.username,envir = .GlobalEnv))
   on.exit(rm(.dbname,envir = .GlobalEnv))
  shiny::runApp(appDir,display.mode = "normal")

}

