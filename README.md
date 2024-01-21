
# mustachewidget

<!-- badges: start -->
<!-- badges: end -->

R package for creating htmlwidgets that are html mustache templates populated with data.

## Installation

You can install the development version of mustachewidget like so:

``` r
remotes::install_github("hafen/mustachewidget")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(mustachewidget)

mustache("Hi, {{name}}", data = list(name = "Bob"))
```

