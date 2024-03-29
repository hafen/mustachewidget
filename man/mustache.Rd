% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mustachewidget.R
\name{mustache}
\alias{mustache}
\title{Create a mustache htmlwidget}
\usage{
mustache(
  template,
  data,
  width = NULL,
  height = NULL,
  sizingPolicy = htmlwidgets::sizingPolicy(),
  dependencies = NULL,
  elementId = NULL,
  preRenderHook = NULL
)
}
\arguments{
\item{template}{A string that contains a mustache template.}

\item{data}{A named list that contains the data that will populate the
template.}

\item{width}{Width of the htmlwidget.}

\item{height}{Height of the htmlwidget.}

\item{sizingPolicy}{See \code{\link[htmlwidgets]{sizingPolicy}}.}

\item{dependencies}{Optional list of dependencies required for the
htmlwidget.}

\item{elementId}{Optional id of the element the htmlwidget will be rendered
into.}

\item{preRenderHook}{See \code{\link[htmlwidgets]{createWidget}}.}
}
\description{
Create a mustache htmlwidget
}
\examples{
mustache("Hi, {{name}}", data = list(name = "Bob"))
}
