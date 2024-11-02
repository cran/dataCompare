## ----setup, echo=FALSE, warning=FALSE, message=FALSE--------------------------
library(dplyr)

## ----echo=FALSE, out.width="35%", fig.align='left'----------------------------
knitr::include_graphics("../inst/app/www/dfComparator_vignette.png")

## ----echo=FALSE, out.width="98%", fig.align='center'--------------------------
knitr::include_graphics("../inst/app/www/context.png")

## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  # From Cran
#  install.packages('dataCompare')
#  
#  # From Github
#  install_github('seewe/dataCompare')
#  
#  # Load in the environment
#  library(dataCompare)

## ----eval=FALSE---------------------------------------------------------------
#  dataCompare::run_data_compare_app()

## ----echo=FALSE, out.width="98%", fig.align='center'--------------------------
knitr::include_graphics("../inst/app/www/mainPage.PNG")

## ----echo=FALSE, out.width="70%", fig.align='center'--------------------------
knitr::include_graphics("../inst/app/www/dataLoader.PNG")

## ----echo=FALSE, out.width="98%", fig.align='center'--------------------------
knitr::include_graphics("../inst/app/www/afterClickCompare.PNG")

## ----echo=FALSE, out.width="98%", fig.align='center'--------------------------
knitr::include_graphics("../inst/app/www/comparisonDescription.PNG")

## ----echo=FALSE, out.width="98%", fig.align='center'--------------------------
knitr::include_graphics("../inst/app/www/detailsDifferences.PNG")

## ----echo=FALSE, out.width="98%", fig.align='center'--------------------------
knitr::include_graphics("../inst/app/www/ComparisonReport.PNG")

## -----------------------------------------------------------------------------
iris_1 <- iris %>% dplyr::mutate(
  var_add1 = sample.int(nrow(iris), replace = TRUE),
  var_add2 = rnorm(nrow(iris)),
  var_add3 = sample(c("cat1", "cat2", "cat3"), nrow(iris), replace = TRUE)
)
iris_1 <- iris_1 %>% 
  rbind.data.frame(
    iris_1 %>% dplyr::sample_n(50)
  ) %>% 
  dplyr::mutate(
    ID = row_number()
  )

iris_2 <- iris %>% dplyr::mutate(
  var_more = sample(c("cat1", "cat2", "cat3"), nrow(iris), replace = TRUE),
  var_add3 = sample.int(nrow(iris), replace = TRUE)
)
iris_2 <- iris_2  %>% rbind.data.frame(
    iris_2 %>% dplyr::sample_n(50)
  ) %>% 
  dplyr::mutate(
    ID = row_number()
  )

## -----------------------------------------------------------------------------
dataCompare::data_table_formatter(iris)

## -----------------------------------------------------------------------------
dataCompare::same_variables(iris_1, iris_2)

## -----------------------------------------------------------------------------
dataCompare::skim_char(iris_1) %>% dataCompare::data_table_formatter(.)

## -----------------------------------------------------------------------------
dataCompare::skim_num(iris_1) %>% dataCompare::data_table_formatter(.)

## -----------------------------------------------------------------------------
comparison <- dataCompare::compare_data_frame_object(iris_1, iris_2, "ID")

## ----echo=FALSE---------------------------------------------------------------
 comparison$diff_percentage

## ----echo=FALSE---------------------------------------------------------------
dataCompare::data_table_formatter( comparison$frame.summary.table )

## ----echo=FALSE---------------------------------------------------------------
dataCompare::data_table_formatter( comparison$attrs.table )

## ----echo=FALSE---------------------------------------------------------------
dataCompare::data_table_formatter( comparison$comparison.summary.table )

## ----echo=FALSE---------------------------------------------------------------
dataCompare::data_table_formatter( comparison$vars.ns.table )

## ----echo=FALSE---------------------------------------------------------------
dataCompare::data_table_formatter( comparison$vars.nc.table )

## ----echo=FALSE---------------------------------------------------------------
dataCompare::data_table_formatter( comparison$obs.table )

## ----echo=FALSE---------------------------------------------------------------
dataCompare::data_table_formatter( comparison$diffs.byvar.table )

## ----echo=FALSE---------------------------------------------------------------
dataCompare::data_table_formatter( comparison$diffs.table )

