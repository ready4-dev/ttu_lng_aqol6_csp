library(ready4)
library(ready4use)
library(specific)
X <- Ready4useRepos(dv_nm_1L_chr = "TTU", 
                    dv_ds_nm_1L_chr = "https://doi.org/10.7910/DVN/DKDIB0", 
                    dv_server_1L_chr = "dataverse.harvard.edu")
predictors_r3 <- youthvars::predictors_lup %>%
  specific_predictors()

dictionary_r3 <- Ready4useRepos(dv_nm_1L_chr = "fakes",
                                dv_ds_nm_1L_chr = "https://doi.org/10.7910/DVN/HJXYKQ",
                                dv_server_1L_chr = "dataverse.harvard.edu") %>%
  ingest(fls_to_ingest_chr = c("ymh_clinical_dict_r3"),
         metadata_1L_lgl = F) 
labels_ls <- labels(dictionary_r3)
dictionary_r3 <- dictionary_r3 %>%
  remove_labels_from_ds() %>%
  dplyr::mutate(var_nm_chr = dplyr::case_when(var_nm_chr == "phq9_total" ~ "PHQ9",
                                              var_nm_chr == "bads_total" ~ "BADS",
                                              var_nm_chr == "gad7_total" ~ "GAD7",
                                              var_nm_chr == "oasis_total" ~ "OASIS",
                                              var_nm_chr == "scared_total" ~ "SCARED",
                                              var_nm_chr == "k6_total" ~ "K6",
                                              var_nm_chr == "c_sofas" ~ "SOFAS",
                                              T ~ var_nm_chr))
dictionary_r3 <- dictionary_r3 %>%
  add_labels_from_dictionary(dictionary_tb = labels_ls %>% 
                               as.data.frame()  %>% 
                               t() %>% 
                               as.data.frame() %>%
                               tibble::rownames_to_column() %>%
                               dplyr::rename(var_nm_chr = rowname,
                                             var_desc_chr = V1))
X <- share(X,
           obj_to_share_xx = predictors_r3,
           fl_nm_1L_chr = "predictors_r3",
           description_1L_chr = "A table of input parameters about the candidate predictors (primary and secondary analyses) explored in modelling.")
X <- share(X@a_Ready4usePointer@b_Ready4useRepos,
           obj_to_share_xx = dictionary_r3,
           fl_nm_1L_chr = "dictionary_r3",
           description_1L_chr = "A data dictionary describing the variables included in the input dataset.")

