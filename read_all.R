## Read a directory of .csv files and combine into one data frame with an ID column

read_all <- function(dir_path, file_indicator_pattern = "*.csv", file_indicator_name = "subject") {
  require(here)
  require(fs)
  require(purrr)
  require(tidytable)
  
  all_data <-
    here::here(dir_path) %>%
    fs::dir_ls(glob = file_indicator_pattern) %>%
    purrr::map_dfr(~ tidytable::fread.(.x), .id = file_indicator_name) %>% 
    
  return(all_data)
}
