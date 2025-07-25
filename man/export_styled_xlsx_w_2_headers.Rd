% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/export_styled_xlsx_w_2_headers.R
\name{export_styled_xlsx_w_2_headers}
\alias{export_styled_xlsx_w_2_headers}
\title{Export a styled Excel worksheet with two header rows}
\usage{
export_styled_xlsx_w_2_headers(df, ws_title, filename)
}
\arguments{
\item{df}{A data frame to be exported to Excel.}

\item{ws_title}{A character string specifying the worksheet title.}

\item{filename}{A character string specifying the output Excel file name.}
}
\value{
None. Exports provided data frame to a file.
}
\description{
This function takes a data frame with two header rows and exports it to an Excel
file with specific styling, including custom column widths and various cell
alignments and borders.
}
\details{
The function performs the following operations:
\enumerate{
\item Creates a new workbook and worksheet
\item Writes the data frame to the worksheet without column names
\item Sets custom column widths
\item Applies left alignment to all cells, except for the first column
\item Applies bold formatting to the first two rows
\item Adds medium borders to the top of table, row 2, and bottom of table
\item Adds thin borders below rows containing "Total", "N, \%", or "Mean\if{html}{\out{<c2>}}\if{html}{\out{<b1>}}SD"
in the first column
\item Converts string representations of numbers back to numeric values where
possible
}
}
\note{
This function requires the \code{openxlsx} package.
}
\examples{
\dontrun{
df <- data.frame(
  Variable = c("Header 1", "Header 2", "Row 1", "Row 2", "Total"),
  Value1 = c("", "", "10", "20", "30"),
  Value2 = c("", "", "1.5", "2.5", "4.0")
)
export_styled_xlsx_w_2_headers(df, "My Worksheet", "output.xlsx")
}

}
