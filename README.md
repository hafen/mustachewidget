
# mustachewidget

<!-- badges: start -->
<!-- badges: end -->

This is an R package for creating htmlwidgets that are html mustache templates populated with data.

## When would I use this?

If you are making a one-off web page, it is better to just build the page than to use this tool. But if you making several versions of a static web page with each having the same layout but being populated with different data, then this can be a good tool to use. This package was developed particularly for use with [Trelliscope](https://trelliscope.org), where often we want to design panels that are composed of custom html content.

You can learn more about mustache templates [here](https://mustache.github.io/mustache.5.html).

## Installation

You can install the development version of mustachewidget with the following:

```r
remotes::install_github("hafen/mustachewidget")
```

## Examples

Here are a few examples of how to use the package.

### Simple

```r
library(mustachewidget)

mustache("Hi, {{name}}", data = list(name = "Bob"))
```

This will output an htmlwidget web page that says "Hi, Bob".

### Nested Values

```r
mustache("
  Hello, {{name.first}} <b>{{name.last}}</b>!
  ",
  data = list(name = list(first = "Bob", last = "Smith"))
)
```

### Lists

```r
mustache("
  <h1>Alphabet</h1>
  <ul>
    {{#values}}
    <li>{{.}}</li>
    {{/values}}
  </ul>
  ",
  data = list(values = letters)
)
```

### Conditional Content

```r
mustache("
  <h1>{{title}}</h1>
  {{#show}}
    <p>{{content}}</p>
  {{/show}}
  {{^show}}
    (no content)
  {{/show}}
  ",
  data = list(title = "My Title", show = TRUE, content = "My Content")
)
```

### Including Plots

If you want to include a locally-created plot in an mustachewidget output, this package has a utility function particularly for ggplot2, `ggsave_base64()`, that will save a plot as a base64 encoded string.

```r
library(ggplot2)
p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
p64 <- ggsave_base64(p)

mustache("
  <h1>My plot</h1>
  <img width='500' src='{{plot}}' />
  ",
  data = list(plot = p64)
)
```

### Specifying a Template File + Dependencies

Instead of specifying the template as a string, you can also specify a file path to a template html file.

Also, you may have CSS or JavaScript dependencies that you want to include in the output. You can specify these as well.

```r
asset_dir <- system.file("example", package = "mustachewidget")

mustache(
  file.path(asset_dir, "template.html"),
  list(name = "Bob"),
  dependencies = htmltools::htmlDependency(
    name = "template",
    version = "1",
    src = c(file = asset_dir),
    script = "template.js",
    stylesheet = "template.css"
  )
)
```
