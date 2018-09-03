# FILE: runRCBD.R - used to generate randomization and layout using RCBD
# Run in the command line, with arguments, for example:
# $ Rscript runRCBD.R -f 6 -b 3 -t 2
# Only required argument: f (no of levels of the factor or treatment)

# R VERSION: 2.15.1
options(warn = -1) #no warnings
suppressPackageStartupMessages(library(PBTools)) #no start-up messages
suppressPackageStartupMessages(library(optparse))

option_list = list(
  make_option(c("-f", "--nTrmts"), type = "integer", default = NULL, 
              help = "Number of levels of the Factor or Treatment", metavar = "Number_of_Levels_of_Factor_or_Treatment"),
  make_option(c("-b", "--nReps"), type = "integer", default = 2, 
              help = "Number of replications", metavar = "Number_of_Replications"),
  make_option(c("-t", "--nTrials"), type = "integer", default= 1, 
              help = "Number of trials", metavar = "Number_of_Trials"),
  make_option(c("-r", "--nFRows"), type = "integer", default = 1, 
              help = "Overall number of rows of experimental units", metavar = "Number_of_Field_Rows"),
  make_option(c("-rr", "--nRowsPerRep"), type = "integer", default = 1, 
              help = "Number of rows per replication", metavar = "no_of_Rows_Per_Rep"),
  make_option(c("-s", "--serpentine"), type = "logical", default = FALSE, 
              help = "Are experimental units arranged in serpentine from left to right?", metavar = "Is_Serpentine"),
  make_option(c("-o", "--outputFile"), type = "character", default = "rcbd_Out", 
              help = "File name to be used for the field book and layout file", metavar = "Name_of_Output_Files")
) 

opt_parser = OptionParser(option_list = option_list)
opt = parse_args(opt_parser)

# supply at least the number of treatment levels 
if (is.null(opt$nTrmts)){
  print_help(opt_parser) #display arguments with descriptions if input
  stop("Please specify the number of levels of the factor or treatment. \n", call. = FALSE)
}

sink(paste0(opt$outputFile,".txt"))
result <- designRCBD(generate = list(Treatment = 1:opt$nTrmts), r = opt$nReps, 
           trial = opt$nTrials, numFieldRow = opt$nFRows,
           rowPerBlk = opt$nRowsPerRep, serpentine = opt$serpentine,
           display = TRUE, file = paste0(opt$outputFile,".csv"))

for (i in 1:length(result$layout)) {
  printLayout(result$layout[[i]], result$plotNum, RowLabel = rownames(result$layout[[i]]), ColLabel = colnames(result$layout[[i]]), title = paste("Trial = ", i, sep = ""))
}

sink()
