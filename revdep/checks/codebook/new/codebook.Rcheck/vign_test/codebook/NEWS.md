# codebook 0.6.3
## Additions
- Vignettes for
  - documenting the expected attribute structure, how to add metadata in R
  - importing metadata from SPSS or Stata files
  - importing metadata from Qualtrics as made available by `qualtRics` package
- Importing some functions from labelled package to add metadata
- Default method for haven::as_factor when labelled class is absent
  
## Changes
- Changed the scale summary, so that Likert plots and distributions are shown
  on the first tab. Reliability now hidden under "Reliability details".
- removed unnecessary `readr` dependency.

## Bugfixes
- summarising factors in a table
- turning off components of the codebook without empty strings being echoed
- allow using variable and value labels in the absence of the labelled class
  (as imported by rio for example)

# codebook 0.6.2
## Additions
- Three RStudio Addin Shinyapps to browse variable labels and codebook. 

## Bug fix
- Specify a mice dependency that doesn't break degenerate test cases.

# codebook 0.5.9
## Additions
- plot_labelled now makes better plots for numeric variables
- codebook generation has been parallelised using the future package. By calling
  e.g. `plan(multicore(workers = 4))` before the codebook function, the 
  computation of reliabilities and the generation of scale and item summaries
  will happen in parallel. For this to work with plots, you have to choose a 
  graphics device in knitr that supports parallelisation, by calling e.g. 
  `opts_chunk$set(dev = "CairoPNG")`.
- for variables that store multiple multiple choice values comma-separated, 
  we now separate the values before plotting, if that item attribute
  `attributes(item)$item$type` contains "multiple"
- make it easier to trace which variable in a dataset cannot be summarised
- added and document `aggregate_and_document_scale` for people who don't import
  data via formr.org and want reliabilities to be calculated automatically
- use `rio` to import all kinds of file formats in the webapp

## Bug fixes
- fix bugs in plot_labelled
- fix bugs when variables are entirely missings
- escape HTML in various labels, use safe names for anchors, figures
- reliability functions no longer garble names
- require skimr >= 1.0.2 and ggplot2 >= 2.0.0

# codebook 0.5.8
- don't write files into anything but tempdir

# codebook 0.5.7
- changed description and documentation

# codebook 0.5.6
- changed license to MIT

# codebook 0.5.5
- improved documentation
- more tests

# codebook 0.4.4
- wrote some tests
- tried to please goodpractice::gp()
- removed some cruft