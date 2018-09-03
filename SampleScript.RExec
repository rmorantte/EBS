######################################################
###                  SAMPLE SCRIPT                 ###
######################################################

args = commandArgs(TRUE)
nTrmts <- as.double(args[1])
nReps <- as.double(args[2])


# load the library needed
library(agricolae)

# Define the levels of the treatment
myTrmt <- paste("T", 1:nTrmts, sep = "")

# Print the levels 
# myTrmt

# ---------------------------------------------
# One-Factor Randomized Complete Block Design
# ---------------------------------------------

# Generate a randomization
randRCBD <- design.rcbd(trt = myTrmt, r = nReps, serie = 1)

# # View the structure
# str(randRCBD)

# Display the fieldbook
cat("\n\nFIELDBOOK: \n\n")
randRCBD$book

#save fieldbook to a csv file
write.csv(randRCBD$book, "fieldbook_RCBD.csv")

## Layout case1:
# Treatment arrangement
cat("\n\nSAMPLE LAYOUT: \n")
cat("\nTreatments:\n")
layout1 <- randRCBD$sketch
row.names(layout1) <- paste("Blk",1:nReps, sep = "")
layout1

# Plot number arrangement
plotNumRCBD1 <- matrix(randRCBD$book$plots, nrow = nReps, ncol = nTrmts, byrow = T, dimnames = list(paste("Blk",1:nReps, sep = "")))
cat("\nPlot Numbers:\n")
plotNumRCBD1

# ## Layout Case2:
# # Treatment arrangement
# t(randRCBD$sketch)
# 
# # Plot number arrangement
# plotNumRCBD2 <- matrix(randRCBD$book$plots, nrow = 6, ncol = 4)
# colnames(plotNumRCBD2) <- paste("Blk", 1:4, sep = "")
# plotNumRCBD2
# 
# ## Layout Case3:
# # Treatment arrangement
# layoutRCBD3 <- matrix(NA, nrow = 4, ncol = 6)
# layoutRCBD3[1:2,1:3] <- matrix(subset(randRCBD$book, block == 1)$myTrmt, nrow = 2, ncol = 3)
# layoutRCBD3[1:2,4:6] <- matrix(subset(randRCBD$book, block == 2)$myTrmt, nrow = 2, ncol = 3)
# layoutRCBD3[3:4,1:3] <- matrix(subset(randRCBD$book, block == 3)$myTrmt, nrow = 2, ncol = 3)
# layoutRCBD3[3:4,4:6] <- matrix(subset(randRCBD$book, block == 4)$myTrmt, nrow = 2, ncol = 3)
# 
# # Display the treatment arrangement
# layoutRCBD3
# 
# # Plot number arrangement
# plotNum3 <- matrix(NA, nrow = 4, ncol = 6)
# plotNum3[1:2,1:3] <- matrix(subset(randRCBD$book, block == 1)$plots, nrow = 2, ncol = 3)
# plotNum3[1:2,4:6] <- matrix(subset(randRCBD$book, block == 2)$plots, nrow = 2, ncol = 3)
# plotNum3[3:4,1:3] <- matrix(subset(randRCBD$book, block == 3)$plots, nrow = 2, ncol = 3)
# plotNum3[3:4,4:6] <- matrix(subset(randRCBD$book, block == 4)$plots, nrow = 2, ncol = 3)
# 
# # Display
# plotNum3
