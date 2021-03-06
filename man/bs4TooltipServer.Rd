% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/feedbacks.R
\name{bs4TooltipServer}
\alias{bs4TooltipServer}
\title{Create a Bootstrap 4 Tooltip from the server side}
\usage{
bs4TooltipServer(
  target,
  title,
  placement = c("top", "bottom", "left", "right"),
  session
)
}
\arguments{
\item{target}{Tooltip target.}

\item{title}{Tooltip title.}

\item{placement}{Tooltipe placement: "top", "bottom", "left" or "right".}

\item{session}{Shiny session object.}
}
\description{
This replaces the shinyBS tooltip feature that is not compatible
with Bootstrap 4
}
\examples{
if (interactive()) {
 library(shiny)
 library(bs4Dash)
 
 shiny::shinyApp(
  ui = bs4DashPage(
    enable_preloader = TRUE,
    navbar = bs4DashNavbar(),
    sidebar = bs4DashSidebar(),
    controlbar = bs4DashControlbar(),
    footer = bs4DashFooter(),
    title = "test",
    body = bs4DashBody(
     actionButton("goButton", "Click on me to add tooltip"),
     actionButton("goButton2", "You can't see me first!")
    )
  ),
  server = function(input, output, session) {
   observeEvent(input$goButton, {
     bs4TooltipServer(
      session = session, 
      target = "goButton2", 
      title = "Server tooltip", 
      placement = "bottom"
     )
   })
  }
 )
}
}
