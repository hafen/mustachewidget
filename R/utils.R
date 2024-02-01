#' Save a ggplot2 plot as a base64 encoded string
#' @param plot A ggplot2 plot object.
#' @param format The format to save the plot in. One of \code{"png"},
#'  \code{"jpeg"}, or \code{"svg"}.
#' @param width The width of the plot in pixels.
#' @param height The height of the plot in pixels.
#' @param ... Additional arguments to pass to \code{\link[ggplot2]{ggsave}}.
#' @export
#' @importFrom ggplot2 ggsave last_plot
#' @importFrom base64enc base64encode
ggsave_base64 <- function(
  plot = ggplot2::last_plot,
  format = c("png", "jpeg", "svg"),
  width = 500,
  height = 500,
  ...
) {
  device <- match.arg(format)
  f <- tempfile(fileext = sprintf(".%s", device))
  args <- list(...)
  args$filename <- f
  args$plot <- plot
  args$device <- device
  args$width <- width / 96
  args$height <- height / 96
  args$units <- "in"

  do.call(ggplot2::ggsave, args)

  enc <- base64enc::base64encode(f)
  sprintf("data:image/%s;base64,%s", device, enc)
}
