Historic updates of the Kyoto Protocol financial information 30 March 2016

http://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-emissions/nzs-net-position-under-kyoto-protocol/historic
# https://web.archive.org/web/20160503020232/http://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-emissions/nzs-net-position-under-kyoto-protocol/historic
# https://docs.google.com/spreadsheets/d/1GPw0cyPWK7X6oYklgpZEaLRwYjDU2YfcuCtCgUZTzWc/edit?usp=sharing

# This page has projected net position estimate changes since 2002 and carbon price changes since 2005. The commands below read the html table into R and tidy it up.
# check working directory if needed
getwd()
[1] "/home/user"
setwd("/home/user/R/cer")

getwd()
[1] "/home/user/r/cer"
# load packages
library(XML)
library(tidyr)

# read in the html file "cer.html" which I saved from the Ministry for the Environment webpage
df<-readHTMLTable("cer.html",skip.rows =1,which=1,header=TRUE,row.names = NULL, stringsAsFactors = FALSE)

# check the dataframe
str(df)
'data.frame':	123 obs. of  8 variables:
 $ Financial Statements Period Ended        : chr  "Million units" "" "May-15" "Apr-15" ...
 $ Net position excluding transfers         : chr  "Million units" "A" "8.3" "8.3" ...
 $ Net transfers from the assigned amount   : chr  "Million units" "B" "-115.4" "-119.7" ...
 $ Net position                             : chr  NA "C=A-B" "123.7" "128.0" ...
 $ Carbon Price                             : chr  NA "X" "€ 0.02" "€ 0.02" ...
 $ NZ$ Exchange Rate                        : chr  NA "Y" "0.6521" "0.6855" ...
 $ Carbon Price (NZ$)                       : chr  NA "Z=X/Y" "0.03" "0.03" ...
 $ Value of the Net Asset/(Liability) (NZ$m): chr  NA "C x Z" "4" "4" ...

 # Look at first 6 rows
head(df)
  Financial Statements Period Ended Net position excluding transfers
1                     Million units                    Million units
2                                                                  A
3                            May-15                              8.3
4                            Apr-15                              8.3
5                            Mar-15                              8.3
6                            Feb-15                              8.3
  Net transfers from the assigned amount Net position Carbon Price
1                          Million units         <NA>         <NA>
2                                      B        C=A-B            X
3                                 -115.4        123.7       € 0.02
4                                 -119.7        128.0       € 0.02
5                                 -119.7        128.1       € 0.02
6                                 -119.9        128.2       € 0.02
  NZ$ Exchange Rate Carbon Price (NZ$)
1              <NA>               <NA>
2                 Y              Z=X/Y
3            0.6521               0.03
4            0.6855               0.03
5            0.6928               0.03
6            0.6732               0.03
  Value of the Net Asset/(Liability) (NZ$m)
1                                      <NA>
2                                     C x Z
3                                         4
4                                         4
5                                         4
6                                         4

# The first two rows are part of the column headers in the html file
df[["Carbon Price"]][1:2]
[1] NA  "X"
str(df[["Carbon Price (NZ$)"]][1:2])
 chr [1:2] NA "Z=X/Y"
str(df[["Financial Statements Period Ended"]] [1:2])
 chr [1:2] "Million units" ""

# The estimated NZ carbon price is the seventh column "Carbon Price (NZ$)" and the first two rows are part of the column headers
str(df[["Carbon Price (NZ$)"]][3:123])
chr [1:121] "0.03" "0.03" "0.03" "0.03" "0.03" "0.03" "0.10" ...

# The international carbon price is two columns tsuck together, a character string for a currency name and an amount, both in character format

df[["Carbon Price"]][3:123]
  [1] "€ 0.02"    "€ 0.02"    "€ 0.02"    "€ 0.02"    "€ 0.02"    "€ 0.02"   
  [7] "€ 0.06"    "€ 0.10"    "€ 0.12"    "€ 0.16"    "€ 0.17"    "€ 0.16"   
 [13] "€ 0.09"    "€ 0.15"    "€ 0.19"    "€ 0.26"    "€ 0.43"    "€ 0.32"   
 [19] "€ 0.31"    "€ 0.51"    "€ 0.61"    "€ 0.58"    "€ 0.56"    "€ 0.49"   
 [25] "€ 0.41"    "€ 0.01"    "€ 0.06"    "€ 0.28"    "€ 0.12"    "€ 0.18"   
 [31] "€ 0.68"    "€ 1.10"    "€ 2.17"    "€ 3.60"    "€ 3.60"    "€ 3.60"   
 [37] "€ 5.03"    "€ 5.03"    "€ 5.03"    "€ 5.03"    "€ 5.03"    "€ 5.03"   
 [43] "€ 5.03"    "€ 7.63"    "€ 7.63"    "€ 10.95"   "€ 10.95"   "€ 10.95"  
 [49] "€ 10.95"   "€ 10.95"   "€ 10.95"   "€ 10.95"   "€ 10.95"   "€ 10.75"  
 [55] "€ 10.75"   "€ 10.75"   "€ 10.75"   "€ 10.75"   "€ 10.75"   "€ 10.75"  
 [61] "€ 10.75"   "€ 10.75"   "€ 10.75"   "€ 10.75"   "€ 10.75"   "€ 10.75"  
 [67] "€ 10.00"   "€ 10.00"   "€ 10.00"   "€ 10.00"   "€ 10.00"   "€ 10.00"  
 [73] "€ 10.00"   "€ 10.00"   "€ 10.00"   "€ 10.00"   "€ 10.00"   "€ 10.00"  
 [79] "€ 12.50"   "€ 12.50"   "€ 12.50"   "€ 12.50"   "€ 12.50"   "€ 12.50"  
 [85] "€ 11.13"   "€ 11.13"   "€ 11.13"   "€ 11.13"   "€ 11.13"   "€ 11.13"  
 [91] "€ 11.13"   "USD 11.90" "USD 11.90" "USD 11.90" "USD 11.90" "USD 11.90"
 [97] "USD 9.65"  "USD 9.65"  "USD 9.65"  "USD 9.65"  "USD 9.65"  "USD 9.65" 
[103] "USD 9.65"  "USD 9.65"  "USD 9.65"  "USD 9.65"  "USD 9.65"  "USD 9.65" 
[109] "USD 6.00"  "USD 6.00"  "USD 6.00"  "USD 6.00"  "USD 6.00"  "USD 6.00" 
[115] "USD 6.00"  "USD 6.00"  "USD 6.00"  "USD 6.00"  "USD 6.00"  "USD 6.00" 
[121] "USD 6.00" 

# leave out the first two rows so that number of rows is 121
df1 <- as.data.frame(df[3:123,])

str(df1)
'data.frame':	121 obs. of  8 variables:
 $ Financial Statements Period Ended        : chr  "May-15" "Apr-15" "Mar-15" "Feb-15" ...
 $ Net position excluding transfers         : chr  "8.3" "8.3" "8.3" "8.3" ...
 $ Net transfers from the assigned amount   : chr  "-115.4" "-119.7" "-119.7" "-119.9" ...
 $ Net position                             : chr  "123.7" "128.0" "128.1" "128.2" ...
 $ Carbon Price                             : chr  "€ 0.02" "€ 0.02" "€ 0.02" "€ 0.02" ...
 $ NZ$ Exchange Rate                        : chr  "0.6521" "0.6855" "0.6928" "0.6732" ...
 $ Carbon Price (NZ$)                       : chr  "0.03" "0.03" "0.03" "0.03" ...
 $ Value of the Net Asset/(Liability) (NZ$m): chr  "4" "4" "4" "4" ...

# the international carbon price column includes a character/factor and a numeric
head(df1[["Carbon Price"]])
[1] "€ 0.02" "€ 0.02" "€ 0.02" "€ 0.02" "€ 0.02" "€ 0.02"

tail(df1[["Carbon Price"]])
[1] "USD 6.00" "USD 6.00" "USD 6.00" "USD 6.00" "USD 6.00" "USD 6.00"

# Use tidyr command to separate the name of the currency (character) and the amount (numeric)
df2 <- separate(df1, "Carbon Price", c("Currency", "Price"),-4)
str(df2)
'data.frame':	121 obs. of  9 variables:
 $ Financial Statements Period Ended        : chr  "May-15" "Apr-15" "Mar-15" "Feb-15" ...
 $ Net position excluding transfers         : chr  "8.3" "8.3" "8.3" "8.3" ...
 $ Net transfers from the assigned amount   : chr  "-115.4" "-119.7" "-119.7" "-119.9" ...
 $ Net position                             : chr  "123.7" "128.0" "128.1" "128.2" ...
 $ Currency                                 : chr  "€ " "€ " "€ " "€ " ...
 $ Price                                    : chr  "0.02" "0.02" "0.02" "0.02" ...
 $ NZ$ Exchange Rate                        : chr  "0.6521" "0.6855" "0.6928" "0.6732" ...
 $ Carbon Price (NZ$)                       : chr  "0.03" "0.03" "0.03" "0.03" ...
 $ Value of the Net Asset/(Liability) (NZ$m): chr  "4" "4" "4" "4" ...

# is Currency column okay? Yes.
head(df2[["Currency"]])
[1] "€ " "€ " "€ " "€ " "€ " "€ "
tail(df2[["Currency"]])
[1] "USD " "USD " "USD " "USD " "USD " "USD "

head(df2[["Price"]])
[1] "0.02" "0.02" "0.02" "0.02" "0.02" "0.02"
tail(df2[["Price"]])
[1] "6.00" "6.00" "6.00" "6.00" "6.00" "6.00"

# date
tail(df2[["Financial Statements Period Ended"]])
[1] "Oct-05" "Sep-05" "Aug-05" "Jul-05" "Jun-05" "May-05"


# replace Financial Statements Period ended (month) a month date-formatted object starting from 1st of each month from 01/06/2005
MonthEnddates = seq(as.Date('2005-06-01'), by = 'months', length = 121)
# take off 1 day to get true month end dates
MonthEnddates = MonthEnddates - 1
# check first rows
head(MonthEnddates)
[1] "2005-05-31" "2005-06-30" "2005-07-31" "2005-08-31" "2005-09-30"
[6] "2005-10-31"
#check last rows
tail(MonthEnddates)
[1] "2014-12-31" "2015-01-31" "2015-02-28" "2015-03-31" "2015-04-30"
[6] "2015-05-31"
# check structure & class
str(MonthEnddates)
 Date[1:121], format: "2005-05-31" "2005-06-30" "2005-07-31" "2005-08-31" "2005-09-30" ...

# reverse the date order to match the dataframe "df2"
MonthEnddates <- MonthEnddates[order(MonthEnddates, decreasing = TRUE)]
# replace Financial Statements Period ended (month) a month date-formatted object
df2[["Financial Statements Period Ended"]] <- MonthEnddates

str(df2[["Financial Statements Period Ended"]])
 Date[1:121], format: "2015-05-31" "2015-05-01" "2015-03-31" "2015-03-03" "2015-01-31" ...

head(df2,1)
  Financial Statements Period Ended Net position excluding transfers
3                        2015-05-31                              8.3
  Net transfers from the assigned amount Net position Currency Price
3                                 -115.4        123.7       €   0.02
  NZ$ Exchange Rate Carbon Price (NZ$)
3            0.6521               0.03
  Value of the Net Asset/(Liability) (NZ$m)
3                                         4

# reorder dataframe by date oldest to most recent date
df2 <- df2[order(as.Date(df2[["Financial Statements Period Ended"]])),]
head(df2,1)
    Financial Statements Period Ended Net position excluding transfers
123                        2005-05-31                            -36.2
    Net transfers from the assigned amount Net position Currency Price
123                                    0.0        -36.2     USD   6.00
    NZ$ Exchange Rate Carbon Price (NZ$)
123            0.7076               8.48
    Value of the Net Asset/(Liability) (NZ$m)
123                                      -307
# check column names
colnames(df2)
[1] "Financial Statements Period Ended"
[2] "Net position excluding transfers"
[3] "Net transfers from the assigned amount"
[4] "Net position"
[5] "Currency"
[6] "Price"
[7] "NZ$ Exchange Rate"
[8] "Carbon Price (NZ$)"
[9] "Value of the Net Asset/(Liability) (NZ$m)"
# change formats of variables mostly from caharcter to numeric
df2[["Net position excluding transfers"]]<-as.numeric(df2[["Net position excluding transfers"]])
df2[["Net transfers from the assigned amount"]]<-as.numeric(df2[["Net transfers from the assigned amount"]])
df2[["Net position"]]<-as.numeric(df2[["Net position"]])
df2[["Currency"]]<-as.factor(df2[["Currency"]])
df2[["Price"]]<-as.numeric(df2[["Price"]])
df2[["NZ$ Exchange Rate"]]<-as.numeric(df1[["NZ$ Exchange Rate"]])
df2[["Carbon Price (NZ$)"]]<-as.numeric(df2[["Carbon Price (NZ$)"]])
df2[["Value of the Net Asset/(Liability) (NZ$m)"]]<-as.numeric(df2[["Value of the Net Asset/(Liability) (NZ$m)"]])

# check dataframe
str(df2)
'data.frame':	121 obs. of  9 variables:
 $ Financial Statements Period Ended        : Date, format: "2005-05-31" "2005-06-30" ...
 $ Net position excluding transfers         : num  -36.2 -36.2 -36.2 -36.2 -36.2 -36.2 -36.2 -64 -64 -64 ...
 $ Net transfers from the assigned amount   : num  0 0 0 0 0 0 0 0 0 0 ...
 $ Net position                             : num  -36.2 -36.2 -36.2 -36.2 -36.2 -36.2 -36.2 -64 -64 -64 ...
 $ Currency                                 : Factor w/ 4 levels "€ ","€ 1","USD ",..: 3 3 3 3 3 3 3 3 3 3 ...
 $ Price                                    : num  6 6 6 6 6 6 6 6 6 6 ...
 $ NZ$ Exchange Rate                        : num  0.652 0.685 0.693 0.673 0.642 ...
 $ Carbon Price (NZ$)                       : num  8.48 8.56 8.78 8.7 8.66 8.54 8.55 8.78 8.79 9.09 ...
 $ Value of the Net Asset/(Liability) (NZ$m): num  -307 -310 -318 -315 -313 -309 -309 -562 -563 -582 ...

# write a csv file
write.table(df2, file = "nz-kyoto-cer-prices-2005-2015.csv", sep = ",", col.names = TRUE, qmethod = "double",row.names = FALSE)

# create a dataframe that is onlt the date and price
df3 <- data.frame(Date =df2[["Financial Statements Period Ended"]], Price = df2[["Carbon Price (NZ$)"]])
# write a csv file
write.table(df3, file = "nz-carbon-prices-2005-2015.csv", sep = ",", col.names = TRUE, qmethod = "double",row.names = FALSE)

## charts

# create line chart with line colour #D2691E or "Hot Cinnamon" 
svg(filename="NZ-Kyoto-Prices-720by540v1.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
#png("NZ-Kyoto-Prices-560by420-v1.png", bg="white", width=560, height=420,pointsize = 14)
#png("NZ-Kyoto-Prices-560by420-v2.png", bg="white", width=560, height=420,pointsize = 12)
par(mar=c(2.7,2.7,1,1)+0.1)
plot(df2[["Financial Statements Period Ended"]], df2[["Carbon Price (NZ$)"]] , ylim=c(0,34),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,lwd=3,col="#D2691E",ylab="",xlab="",main="")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
mtext(side=3,cex=1.7, line=-4.2,expression(paste("Carbon prices used in calculation of New Zealand \nKyoto Protocol net position 2005 - 2015")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/unit")
mtext(side=1, adj=0,line =-1.1 ,cex=0.8,"Data: Historic updates of the Kyoto Protocol financial information\nhttps://github.com/theecanmole/Historic-updates-of-the-Kyoto-Protocol-carbon-price")
dev.off()
 

# chart the net position in units
# y axis limit
max(df2[["Net position"]])
[1] 128.2
col is #1D556C "blumine"
png("NZ-Kyoto-Net-Units-720by540v2.png", width = 720, height = 540, pointsize = 16, family = "sans", bg = "white")
par(mar=c(2.7,3,1,1)+0.1)
plot(df2[["Financial Statements Period Ended"]],df2[["Net position"]], ylim=c(-65,130),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,lwd=3,col="#1D556C",ylab="",xlab="",main="")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
mtext(side=1, line =-1.1 ,cex=0.9,"Data: Historic updates of the Kyoto Protocol financial information\nhttps://github.com/theecanmole/Historic-updates-of-the-Kyoto-Protocol-carbon-price")
mtext(side=3,cex=1.7, line=-4.2, expression(paste("New Zealand Kyoto Protocol net \nposition in Kyoto units 2005 - 2015")) )
mtext(side=2,cex=1, line=-1.3,"Million Kyoto units")
dev.off()

# chart the net position asset/liability is expressed in million NZD
summary(df2[["Value of the Net Asset/(Liability) (NZ$m)"]])
  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
-1009.0  -565.0    38.0  -154.4   195.0   444.0

# colour is "#FF4700"  Red-Orange

png("NZ-Kyoto-Net-Asset-720by540v2.png", width = 720, height = 540, pointsize = 16, family = "sans", bg = "white")
par(mar=c(2.7,3,1,1)+0.1)
plot(df2[["Financial Statements Period Ended"]] , df2[["Value of the Net Asset/(Liability) (NZ$m)"]], ylim=c(-1000,635),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,lwd=3,col="#FF4700",ylab="",xlab="",main="")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
mtext(side=3,cex=1.6, line=-3.8, expression(paste("New Zealand Kyoto Protocol net position \nasset/liability in $NZ million 2005 - 2015")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Million")
mtext(side=1, line =-1.1 ,cex=0.9,"Data: Historic updates of the Kyoto Protocol financial information\nhttps://github.com/theecanmole/Historic-updates-of-the-Kyoto-Protocol-carbon-price")
dev.off()

## sessionInfo()
sessionInfo()
R version 4.2.2 Patched (2022-11-10 r83330)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Debian GNU/Linux 12 (bookworm)

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.21.so

locale:
 [1] LC_CTYPE=en_NZ.UTF-8          LC_NUMERIC=C
 [3] LC_TIME=en_NZ.UTF-8           LC_COLLATE=en_NZ.UTF-8
 [5] LC_MONETARY=en_NZ.UTF-8       LC_MESSAGES=en_NZ.UTF-8
 [7] LC_PAPER=en_NZ.UTF-8          LC_NAME=en_NZ.UTF-8
 [9] LC_ADDRESS=en_NZ.UTF-8        LC_TELEPHONE=en_NZ.UTF-8
[11] LC_MEASUREMENT=en_NZ.UTF-8    LC_IDENTIFICATION=en_NZ.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base

other attached packages:
[1] tidyr_1.3.2   XML_3.99-0.20 rkward_0.7.5

loaded via a namespace (and not attached):
 [1] withr_3.0.2      dplyr_1.1.4      R6_2.6.1         lifecycle_1.0.5
 [5] magrittr_2.0.4   pillar_1.11.1    rlang_1.1.7      cli_3.6.5
 [9] vctrs_0.7.1      generics_0.1.4   tools_4.2.2      glue_1.8.0
[13] purrr_1.2.1      compiler_4.2.2   pkgconfig_2.0.3  tidyselect_1.2.1
[17] tibble_3.3.1
