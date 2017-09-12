==================================================================
Coursera Project - Getting and Cleaning Data
==================================================================

==================================================================
## Author
Amine EL AJI <amine.elaji@gmail.com>
==================================================================


##The repository includes the following files:
=========================================
*README.txt
*CodeBook.md: explaining different variables and code used
*dataset.txt: resulting dataset from the analysis
*run_analysis.R: the script to clean the data

##Instructions:
=========================================
To run the script please follow these steps:

*Download origine dataset to the working directory from the web site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*Clone the project to your working directory
*Execute the script

## Script Execution steps
=========================================

The script will perform the following steps:

* Require dplyr library (for the rename() function)
* download and put the data in the working directory
* copy the script in the working directory
* The script will read tables from train and test and merge it with activities label and subject id
* It will filter data to keep only those containing mean and standard deviation
* Finally, it will group it by activity and subject and calculate the avertage of the data to furnish the output: dataset.txt
