

Workflow for 2024 samples


(all links last accessed 04.03.2024)


Start with empty folder in Linux

Install V-pipe using quick install script:
#specify branch ninjaturtles
curl -O 'https://raw.githubusercontent.com/cbg-ethz/V-pipe/ninjaturtles/utils/quick_install.sh' 
#give ./quick_install.sh execution permission if needed
chmod +x quick_install.sh
#specify branch ninjaturtles
./quick_install.sh -b ninjaturtles -w work 

Put files from wastewater_publication repository (https://github.com/dzhakparov/wastewater_publication/tree/master/2023) into "work" folder
(references, scripts, config file, regex file, Jupyter notebook)

Add raw sample files in new "samples_raw" directory (still in "work" directory)

Run command to create "samples" folder structure and samples.tsv file needed by V-pipe
/home/ale/BioCovid/V-pipe/utils/sort_samples_dumb -f /home/ale/BioCovid/work/samples_raw/ -t samples.imported.tsv -o samples
#Important for now, add column 4 with proto
gawk 'BEGIN{OFS="\t"};{print $0, "v41"}' samples.imported.tsv |tee samples.tsv

Configuration
Adopted from https://github.com/dzhakparov/wastewater_publication/tree/master/2023

Update voc files
Adjust VOC of now (january 2024) -> go to cov-spectrum.org, input the current VOC or VOI for switzerland in the timeframe of the samples
Alo check https://nextstrain.org/ncov/gisaid/europe/2m?dmax=2024-02-12&dmin=2024-01-01&f_country=Switzerland&p=full&r=region
and https://covariants.org/per-country?region=Switzerland&country=Region+6&variant=23A+%28Omicron%29&variant=23F+%28Omicron%29&variant=23G+%28Omicron%29&variant=23I+%28Omicron%29
Include variants under monitoring aswell? (BA.2.87.1) https://www.ecdc.europa.eu/en/covid-19/variants-concern
Create var_dates.yaml manually using the prevalent variants found in covSpectrum before
#Go to cojac executable and create variant .yaml files for voc folder in references
#add header manually according to tutorial
./cojac sig-generate --url https://lapis.cov-spectrum.org/open/v1 --variant BA.2.86 | tee /home/ale/BioCovid/work/references/voc/omicron_ba.2.86_mutations_full.yaml
./cojac sig-generate --url https://lapis.cov-spectrum.org/open/v1 --variant XBB.1.5 | tee /home/ale/BioCovid/work/references/voc/omicron_xbb.1.5_mutations_full.yaml

Run Cojac
#This command will run all the COJAC processing, and generate a report-like CSV for protocol Artic V4.1:
./vpipe --cores 8 allCooc results/cohort_cooc_report.v41.csv
#This command will generate just the amplicons list for Artic V4.1, to checks them before running the rest
./vpipe --cores 8 results/amplicons.v41.yaml

Run LolliPop
#This command will run the deconvolution:
./vpipe --cores 8 deconvolution

Run ww_cov_uploader_V-pipe.ipynb
#Will display the curves in the Notebook