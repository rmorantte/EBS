#R VERSION: 2.15.1
options(warn = -1) 
suppressPackageStartupMessages(library(PBTools))
suppressPackageStartupMessages(library(optparse))

###TODO (Sep 3): ADD HELP ARGS, EDIT METAVARS
option_list = list(
  make_option(c("-f", "--nTrmts"), type = "integer", default = NULL, 
              help = "Number of levels of the Treatment", metavar = "Number_of_Treatments"),
  make_option(c("-b", "--nReps"), type = "integer", default = 2, metavar = "no_of_Replications"),
  make_option(c("-t", "--nTrials"), type = "integer", default= 1, metavar = "no_of_Trials"),
  make_option(c("-r", "--nFRows"), type = "integer", default = 1, metavar = "no_of_Field_Rows"),
  make_option(c("-rr", "--nRowsPerRep"), type = "integer", default = 1, metavar = "no_of_Rows_Per_Rep"),
  make_option(c("-s", "--serpentine"), type = "logical", default = FALSE, metavar = "is_Serpentine"),
  make_option(c("-o", "--outputFile"), type = "character", default = "rcbd_Out", metavar = "name_of_Output_File")
) 

opt_parser = OptionParser(option_list = option_list)
opt = parse_args(opt_parser)

# supply at least the input file 
if (is.null(opt$nTrmts)){
  print_help(opt_parser)
  stop("Please specify the number of treatment levels.\n", call. = FALSE)
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

# library(PBTools)
# args <- commandArgs(TRUE)
# designRCBD(generate = list(Treatment = 1:args[1]))
