# Complete study program to reproduce all steps from data ingest through to results dissemination for a study to map mental health measures to AQoL-6D health utility

This R program enables reproducibility and replicability of the following study: https://doi.org/10.1101/2021.07.07.21260129.

If you wish to simply browse the program to review its logic, open the CSP.pdf file located in the top level directory.

If you want to run the program open the CSP.RMD program in the Parent_PDF directory and run it chunk by chunk (do not run the program by knitting the document - the program requires interactivity and knitting will prevent the reports it creates from rendering properly).

If you plan on deriving derivative works by editing the CSP.RMD program you should also edit the authorship information for the reports to be generated that are included in the CSVs sub-directory of Parent_PDF and the metadata (including authorship) of the derived program that is specified in header_common.yaml within the Header sub-directory and CITATION.cff file. You can then recreate the PDF record of the derived program by sourcing the RENDER_PDF.R file, which will knit the CSP.RMD without evaluating any of the code.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6116077.svg)](https://doi.org/10.5281/zenodo.6116077)
