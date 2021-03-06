\name{aeReport2}
\alias{aeReport2}
\title{Report Summarizing All Adverse Events}
\usage{
  aeReport2(major, minor = rep("", length(major)), treat,
    id, denom, panel = "ae",
    caption = "Summary of adverse events by system organ class and preferred term",
    ncaption = "",
    descending = c("both", "major", "minor", "none"),
    sortby = c("incidence", "\% difference"),
    headerStr = "AE", minpct = c(0, 0), mindif = c(0, 0),
    size = NULL, longtable = FALSE, lines.page = 50,
    landscape = FALSE, maxcol = NULL, append = FALSE,
    ref.label = NULL, minfreq = 7, major.filter = TRUE,
    minor.filter = FALSE, appendix = TRUE)
}
\arguments{
  \item{major}{factor or character vector specifying the
  major classification of events, usually organ system}

  \item{minor}{factor or character vector specifying the
  minor classification, usually an individual event given
  by the preferred term. If \code{minor} is omitted,
  breakdowns are only by \code{major}.}

  \item{treat}{discrete treatment variable}

  \item{id}{subject ID, used to determine when multiple
  events arise from the same subject}

  \item{denom}{a vector giving the number of subjects on
  each treatment (in order of treatment levels), i.e.,
  number of subjects at risk}

  \item{panel}{base name for \code{.tex} files. Default is
  \code{"ae"}. Table for the open report has an \code{"O"}
  put at the front, and files are written to directory
  \code{gentex}.}

  \item{caption}{text string containing the table caption.
  Other information is automatically appended to this,
  especially related to \code{minpct} and \code{mindif}.
  \code{caption} should not end with a period.}

  \item{ncaption}{NEEDDOC}

  \item{descending}{By default, \code{major} categories are
  sorted in order of descending frequency (ignoring
  \code{minor}), and \code{minor} categories are sorted in
  order of descending frequency within each major category.
  Specify \code{descending='none'} to have categories in
  order of factor levels or alphabetic for character
  variables, or to \code{'major'} or \code{'minor'}.}

  \item{sortby}{Specify \code{sortby='\% difference'} to
  have \code{descending} apply to difference in percent
  incidence between two treatments, instead of to the
  pooled incidence over treatments. For the open report,
  sorting is always alphabetic by category or by descending
  pooled (over treatments) incidence.}

  \item{headerStr}{NEEDDOC}

  \item{minpct}{a 2-vector specifying the minimum percents
  for which to output results for \code{major} and
  \code{minor} categories, respectively. The default is
  \code{c(0,0)} so that all results are output. Specify
  \code{minpct=c(10,0)} for example to only print
  \code{major} categories for which at least a ten percent
  incidence of events in those categories are present,
  ignoring \code{treat}, and for any qualifying
  \code{major} category, output all \code{minor} ones. The
  percents pertain to the per-subject incidences, not
  counting multiple events per subject.}

  \item{mindif}{a 2-vector specifying the minimum
  difference in percent per-subject incidence between
  treatments, corresponding to \code{major} and
  \code{minor}. The sign of differences is ignored. This
  only applies to the case of two treatments. Output not
  meeting the minimum difference in percents is
  suppressed.}

  \item{size}{see \code{\link[Hmisc]{latex.default}}}

  \item{longtable}{see \code{\link[Hmisc]{latex.default}}}

  \item{lines.page}{see \code{\link[Hmisc]{latex.default}}}

  \item{landscape}{passed to \code{latex.default}}

  \item{maxcol}{the maximum number of columns to allow for
  a \code{major} or \code{minor} label (note that two extra
  spaces are added to \code{minor} labels as they are
  indented). Longer event labels are wrapped to multiple
  lines. By default, LaTeX will attempt to display the full
  labels no matter how long.}

  \item{append}{set to \code{TRUE} to have LaTeX code
  appended to existing files}

  \item{ref.label}{NEEDDOC}

  \item{minfreq}{NEEDDOC}

  \item{major.filter}{NEEDDOC}

  \item{minor.filter}{NEEDDOC}

  \item{appendix}{NEEDDOC}
}
\description{
  This report uses a data format in which records exist
  only for events, and these events are classified as
  \code{major} and \code{minor} events. Typically
  \code{major} refers to organ system and \code{minor} to
  preferred term. As only events are signaled in the data,
  the denominator (number of subjects at risk and having
  some likelihood of having had adverse events collected
  had they occured) for each treatment must be specified.
  Produces an open meeting table not stratified by
  \code{treatment} (for open report) and one stratified by
  \code{treatment} (for closed report) in the \code{gentex}
  directory.
}
\details{
  Values of \code{minor} are not assumed to be unique
  across values of \code{major}.
}
\section{Side Effects}{
  creates or appends to files \code{"gentex/Ox.tex"} and
  \code{"gentex/x.tex"} under the current working
  directory, where \code{x} is the value of \code{panel}.
}
\examples{
\dontrun{
major <- c('A', 'A', 'A', 'B', 'B', 'C')
minor <- c('a1','a1','a2','b1','b2','c1')
id <- c(1, 1, 1, 1, 2, 3)
treat <- c('drug','placebo','drug','placebo','drug','placebo')
aeReport2(major, minor, treat, id, denom=c(placebo=10,drug=10))
aeReport2(major, minor, treat, id, denom=c(placebo=10,drug=10),
          sortby='\% difference')
}
}
\seealso{
  \code{\link{aeReport}}
}
\concept{
  aggregation
}
\keyword{category}
\keyword{interface}

