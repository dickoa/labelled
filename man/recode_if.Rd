% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recode_if.R
\name{recode_if}
\alias{recode_if}
\title{Recode some values based on condition}
\usage{
recode_if(x, condition, true)
}
\arguments{
\item{x}{vector to be recoded}

\item{condition}{logical vector of same length as \code{x}}

\item{true}{values to use for \code{TRUE} values of \code{condition}. It must be
either the same length as \code{x}, or length 1.}
}
\value{
Returns \code{x} with values replaced by \code{true} when \code{condition} is
\code{TRUE} and unchanged when \code{condition} is \code{FALSE} or \code{NA}. Variable and value
labels are preserved unchanged.
}
\description{
Recode some values based on condition
}
\examples{
v <- labelled(c(1,2,2,9), c(yes = 1, no = 2))
v \%>\% recode_if(v == 9, NA)
if (require(dplyr)) {
  df <- tibble(s1 = c("M", "M", "F"), s2 = c(1, 2, 1)) \%>\%
    set_value_labels(
      s1 = c(Male = "M", Female = "F"),
      s2 = c(A = 1, B = 2)
    ) \%>\%
    set_variable_labels(s1 = "Gender", s2 = "Group")

  df <- df \%>\%
    mutate(
      s3 = s2 \%>\% recode_if(s1 == "F", 2),
      s4 = s2 \%>\% recode_if(s1 == "M", s2 + 10)
    )
  df
  df \%>\% look_for()
}
}
