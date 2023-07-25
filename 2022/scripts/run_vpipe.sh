#!/bin/bash

# Run vpipe with specified arguments
../vpipe --cores 8 allCooc results/cohort_cooc_report.v41.csv
../vpipe --cores 8 results/amplicons.v41.yaml
../vpipe --cores 8 deconvolution

