#' Create a mustache htmlwidget
#' 
#' @param template A string that contains a mustache template.
#' @param data A named list that contains the data that will populate the template.
#' @param width Width of the htmlwidget.
#' @param height Height of the htmlwidget.
#' @param elementId Optional id of the element the htmlwidget will be rendered into.
#' @param deps Optional list of dependencies required for the htmlwidget.
#' @import htmlwidgets
#' @examples
#' mustache("Hi, {{name}}", data = list(name = "Bob"))
#' @export
mustache <- function(template, data,
  width = NULL, height = NULL, elementId = NULL, deps = NULL
) {
  x = list(
    template = template,
    data = data
  )

  htmlwidgets::createWidget(
    name = 'mustachewidget',
    x,
    width = width,
    height = height,
    package = 'mustachewidget',
    elementId = elementId,
    dependencies = deps
  )
}

#' Shiny bindings for mustachewidget
#'
#' Output and render functions for using mustachewidget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a mustachewidget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name mustachewidget-shiny
#'
#' @export
mustachewidgetOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "mustachewidget", width, height, package = "mustachewidget")
}

#' @rdname mustachewidget-shiny
#' @export
renderMustachewidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  htmlwidgets::shinyRenderWidget(expr, mustachewidgetOutput, env, quoted = TRUE)
}
