# Plumber test
library(plumber)
library(dplyr)
library(stringr)
#* @apiTitle Car mpg
#* @param name
#* @get /mtcars
function(name = "AMC"){
  df <- mtcars %>%
    mutate(carname = rownames(mtcars),
      carname = unlist(str_extract_all(carname, "^[:alpha:]+"))) %>%
    group_by(carname) %>%
    summarise(mpg = mean(mpg))
  return(df$mpg[df$carname == name])
}
