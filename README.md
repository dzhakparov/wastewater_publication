# wastewater_publication
A code and config files for Covid Waste Water publication
The project contains two folders: 2022 and 2023 for samples that were sequenced in May, 2022 (dir 2022) and January, 2023 (dir 2023) respectively. 
The data analysis was done according to the official Vpipe tutorial [link] and a specitifc guide [link] for waste water analysis branch "ninjaturtles" by Dr. Ivan Topolsky. 
Each directory contains following subdirectories: 
- *references*
_presets_ - contains deconvolution preset yaml file to run Lollipop
_voc_ - contains variant definitions provided by Vpipe
- *scripts*
Contains scripts to organize the sample folder and run Vpipe
Other files in the directory:
1. _config.yaml_ - a configuration file for the Vpipe
2. _regex.yaml_ - a yaml file containing regex expression to extract sample names
3. _samples.tsv_ - a tsv file containing sample information as required by Vpipe
4. _ww_cov_uploader_V-pipe.ipynb_ - a Jupyter notebook that generates prevalence dataframe file and does prevalence plots. Provided by Vpipe.

 To proceed with the analysis and Vpipe deployment and all other details on how to perform the analysis please refer to this guide [link]
