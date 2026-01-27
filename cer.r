Historic updates of the Kyoto Protocol financial information 30 March 2016

http://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-emissions/nzs-net-position-under-kyoto-protocol/historic

# This page has projected net position estimate changes since 2002 and carbon price changes since 2005

getwd()
[1] "/home/user"
setwd("/home/user/R/cer")

getwd()
[1] "/home/user/r/cer"

library(XML)
library(tidyr)

#data_df <- head(readHTMLTable("cer.html",skip.rows =1,which=1))

                                 V1                               V2
1 Financial Statements Period Ended Net position excluding transfers
2                     Million units                    Million units
3                                                                  A
4                            May-15                              8.3
5                            Apr-15                              8.3
6                            Mar-15                              8.3
                                      V3           V4           V5
1 Net transfers from the assigned amount Net position Carbon Price
2                          Million units         <NA>         <NA>
3                                      B        C=A-B            X
4                                 -115.4        123.7       € 0.02
5                                 -119.7        128.0       € 0.02
6                                 -119.7        128.1       € 0.02
                 V6                 V7
1 NZ$ Exchange Rate Carbon Price (NZ$)
2              <NA>               <NA>
3                 Y              Z=X/Y
4            0.6521               0.03
5            0.6855               0.03
6            0.6928               0.03
                                         V8
1 Value of the Net Asset/(Liability) (NZ$m)
2                                      <NA>
3                                     C x Z
4                                         4
5                                         4
6                                         4

df<-readHTMLTable("cer.html",skip.rows =1,which=1,header=TRUE,row.names = NULL, stringsAsFactors = FALSE)
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

df[["Carbon Price (NZ$)"]][3:123]

  [1] "0.03"  "0.03"  "0.03"  "0.03"  "0.03"  "0.03"  "0.10"  "0.16"  "0.20" 
 [10] "0.25"  "0.27"  "0.25"  "0.14"  "0.24"  "0.30"  "0.42"  "0.71"  "0.54" 
 [19] "0.52"  "0.85"  "1.00"  "0.99"  "0.93"  "0.82"  "0.66"  "0.02"  "0.09" 
 [28] "0.44"  "0.19"  "0.29"  "1.07"  "1.73"  "3.36"  "5.64"  "5.45"  "5.70" 
 [37] "8.27"  "8.10"  "8.20"  "8.05"  "8.06"  "8.45"  "8.77"  "13.16" "13.48"
 [46] "18.54" "18.09" "19.10" "19.09" "20.23" "20.33" "20.02" "19.32" "18.53"
 [55] "18.92" "19.83" "19.87" "19.32" "19.48" "18.94" "19.46" "19.65" "20.29"
 [64] "21.01" "21.29" "21.27" "20.90" "20.27" "20.35" "20.94" "21.57" "21.61"
 [73] "22.36" "23.50" "23.43" "25.15" "25.31" "24.46" "29.24" "27.30" "26.84"
 [82] "26.18" "26.51" "25.89" "22.13" "22.34" "22.18" "20.78" "21.17" "21.15"
 [91] "21.26" "15.57" "15.75" "16.97" "15.45" "15.48" "13.21" "13.04" "13.52"
[100] "13.76" "14.03" "13.68" "14.23" "14.52" "14.77" "14.80" "15.62" "15.92"
[109] "9.37"  "9.47"  "9.80"  "9.09"  "8.79"  "8.78"  "8.55"  "8.54"  "8.66" 
[118] "8.70"  "8.78"  "8.56"  "8.48" 
 
str(df[["Carbon Price (NZ$)"]][3:123])
chr [1:121] "0.03" "0.03" "0.03" "0.03" "0.03" "0.03" "0.10" ...

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

# knock out the first two rows so that no rows are 121
df <- as.data.frame(df[3:123,])

str(df)
'data.frame':	121 obs. of  8 variables:
 $ Financial Statements Period Ended        : chr  "May-15" "Apr-15" "Mar-15" "Feb-15" ...
 $ Net position excluding transfers         : chr  "8.3" "8.3" "8.3" "8.3" ...
 $ Net transfers from the assigned amount   : chr  "-115.4" "-119.7" "-119.7" "-119.9" ...
 $ Net position                             : chr  "123.7" "128.0" "128.1" "128.2" ...
 $ Carbon Price                             : chr  "€ 0.02" "€ 0.02" "€ 0.02" "€ 0.02" ...
 $ NZ$ Exchange Rate                        : chr  "0.6521" "0.6855" "0.6928" "0.6732" ...
 $ Carbon Price (NZ$)                       : chr  "0.03" "0.03" "0.03" "0.03" ...
 $ Value of the Net Asset/(Liability) (NZ$m): chr  "4" "4" "4" "4" ...

head(df[["Carbon Price"]])
[1] "€ 0.02" "€ 0.02" "€ 0.02" "€ 0.02" "€ 0.02" "€ 0.02"

tail(df[["Carbon Price"]])
[1] "USD 6.00" "USD 6.00" "USD 6.00" "USD 6.00" "USD 6.00" "USD 6.00"


df2 <- separate(df, "Carbon Price", c("currency", "value"),-4)
str(df2)
'data.frame':	121 obs. of  9 variables:
 $ Financial Statements Period Ended        : chr  "May-15" "Apr-15" "Mar-15" "Feb-15" ...
 $ Net position excluding transfers         : chr  "8.3" "8.3" "8.3" "8.3" ...
 $ Net transfers from the assigned amount   : chr  "-115.4" "-119.7" "-119.7" "-119.9" ...
 $ Net position                             : chr  "123.7" "128.0" "128.1" "128.2" ...
 $ currency                                 : chr  "€ 0" "€ 0" "€ 0" "€ 0" ...
 $ value                                    : chr  ".02" ".02" ".02" ".02" ...
 $ NZ$ Exchange Rate                        : chr  "0.6521" "0.6855" "0.6928" "0.6732" ...
 $ Carbon Price (NZ$)                       : chr  "0.03" "0.03" "0.03" "0.03" ...
 $ Value of the Net Asset/(Liability) (NZ$m): chr  "4" "4" "4" "4" ...
rm(df2)

# use tidyr 'separate' tool to separate the two variables in "Carbon Price", 'foreigncurrency', a factor which is either USD or €, and 'foreignvalue' which is numeric

df2 <- separate(df, "Carbon Price", c("foreigncurrency", "foreignvalue"),sep=-5,convert=TRUE)

head(df2[["foreigncurrency"]])
[1] "€ " "€ " "€ " "€ " "€ " "€ "
tail(df2[["foreigncurrency"]])
[1] "USD " "USD " "USD " "USD " "USD " "USD "
head(df2[["foreignvalue"]])
[1] "0.02" "0.02" "0.02" "0.02" "0.02" "0.02"
tail(df2[["foreignvalue"]])
[1] "6.00" "6.00" "6.00" "6.00" "6.00" "6.00"

str(df2)
'data.frame':	121 obs. of  9 variables:
 $ Financial Statements Period Ended        : chr  "May-15" "Apr-15" "Mar-15" "Feb-15" ...
 $ Net position excluding transfers         : chr  "8.3" "8.3" "8.3" "8.3" ...
 $ Net transfers from the assigned amount   : chr  "-115.4" "-119.7" "-119.7" "-119.9" ...
 $ Net position                             : chr  "123.7" "128.0" "128.1" "128.2" ...
 $ fcurrency                                : chr  "€ " "€ " "€ " "€ " ...
 $ value                                    : chr  "0.02" "0.02" "0.02" "0.02" ...
 $ NZ$ Exchange Rate                        : chr  "0.6521" "0.6855" "0.6928" "0.6732" ...
 $ Carbon Price (NZ$)                       : chr  "0.03" "0.03" "0.03" "0.03" ...
 $ Value of the Net Asset/(Liability) (NZ$m): chr  "4" "4" "4" "4" ...

df2[["Financial Statements Period Ended"]] <-as.Date(df2[["Financial Statements Period Ended"]],format="%mmm-%YY")

str(df2[["Financial Statements Period Ended"]])
Date[1:121], format: NA NA NA NA NA NA NA NA NA NA NA NA NA NA ...
# did not work
head(df)


df2[["Net position excluding transfers"]]<-as.numeric(df2[["Net position excluding transfers"]])
df2[["Net transfers from the assigned amount"]]<-as.numeric(df2[["Net transfers from the assigned amount"]])
df2[["Net position"]]<-as.numeric(df2[["Net position"]])
df2[["fcurrency"]]<-as.factor(df2[["fcurrency"]])
df2[["value"]]<-as.numeric(df2[["value"]])
df2[["NZ$ Exchange Rate"]]<-as.numeric(df2[["NZ$ Exchange Rate"]])
df2[["Carbon Price (NZ$)"]]<-as.numeric(df2[["Carbon Price (NZ$)"]])
df2[["Value of the Net Asset/(Liability) (NZ$m)"]]<-as.numeric(df2[["Value of the Net Asset/(Liability) (NZ$m)"]])

df3 <- data.frame(df2, colClasses=c("date","numeric","numeric","numeric","factor","character","numeric","numeric","numeric"))

str(df3)

Named logi [1:9] TRUE TRUE TRUE TRUE TRUE TRUE ...
 - attr(*, "names")= chr [1:9] "Financial Statements Period Ended" "Net position excluding transfers" "Net transfers from the assigned amount" "Net position" ...


---------------------------------
df<-readHTMLTable("cer.html",skip.rows =1,which=1,header=TRUE,row.names = NULL, colClasses=c("character","numeric","numeric","numeric","character","numeric","numeric","numeric"))
Warning messages:
1: In asMethod(object) : NAs introduced by coercion
2: In asMethod(object) : NAs introduced by coercion
3: In asMethod(object) : NAs introduced by coercion
4: In asMethod(object) : NAs introduced by coercion
5: In asMethod(object) : NAs introduced by coercion
6: In asMethod(object) : NAs introduced by coercion
str(df)
'data.frame':	123 obs. of  8 variables:
 $ Financial Statements Period Ended        : Factor w/ 123 levels "","Apr-06","Apr-07",..: 93 1 92 11 81 41 51 31 103 113 ...
 $ Net position excluding transfers         : num  NA NA 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 ...
 $ Net transfers from the assigned amount   : num  NA NA -115 -120 -120 ...
 $ Net position                             : num  NA NA 124 128 128 ...
 $ Carbon Price                             : Factor w/ 37 levels "€ 0.01","€ 0.02",..: NA 37 2 2 2 2 2 2 3 5 ...
 $ NZ$ Exchange Rate                        : num  NA NA 0.652 0.685 0.693 ...
 $ Carbon Price (NZ$)                       : num  NA NA 0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 ...
 $ Value of the Net Asset/(Liability) (NZ$m): num  NA NA 4 4 4 4 4 4 12 20 ...

str(df[["Financial Statements Period Ended"]])
Factor w/ 123 levels "","Apr-06","Apr-07",..: 93 1 92 11 81 41 51 31 103 113 ...
df[["Financial Statements Period Ended"]][1]
[1] Million units
123 Levels:  Apr-06 Apr-07 Apr-08 Apr-09 Apr-10 Apr-11 Apr-12 Apr-13 ... Sep-14

# the data only has 121 rows - so the extra 2 rows is caused by some error in reading the html table 

summary(df[["Financial Statements Period Ended"]])
                     Apr-06        Apr-07        Apr-08        Apr-09 
            1             1             1             1             1 
       Apr-10        Apr-11        Apr-12        Apr-13        Apr-14 
            1             1             1             1             1 

df[["Financial Statements Period Ended"]]
  [1] Million units               May-15        Apr-15        Mar-15       
  [6] Feb-15        Jan-15        Dec-14        Nov-14        Oct-14       
 [11] Sep-14        Aug-14        Jul-14        Jun-14        May-14       
 [16] Apr-14        Mar-14        Feb-14        Jan-14        Dec-13       
 [21] Nov-13        Oct-13        Sep-13        Aug-13        Jul-13       
 [26] Jun-13        May-13        Apr-13        Mar-13        Feb-13       
 [31] Jan-13        Dec-12        Nov-12        Oct-12        Sep-12       
 [36] Aug-12        Jul-12        Jun-12        May-12        Apr-12       
 [41] Mar-12        Feb-12        Jan-12        Dec-11        Nov-11       
 [46] Oct-11        Sep-11        Aug-11        Jul-11        Jun-11       
 [51] May-11        Apr-11        Mar-11        Feb-11        Jan-11       
 [56] Dec-10        Nov-10        Oct-10        Sep-10        Aug-10       
 [61] Jul-10        Jun-10        May-10        Apr-10        Mar-10       
 [66] Feb-10        Jan-10        Dec-09        Nov-09        Oct-09       
 [71] Sep-09        Aug-09        Jul-09        Jun-09        May-09       
 [76] Apr-09        Mar-09        Feb-09        Jan-09        Dec-08       
 [81] Nov-08        Oct-08        Sep-08        Aug-08        Jul-08       
 [86] Jun-08        May-08        Apr-08        Mar-08        Feb-08       
 [91] Jan-08        Dec-07        Nov-07        Oct-07        Sep-07       
 [96] Aug-07        Jul-07        Jun-07        May-07        Apr-07       
[101] Mar-07        Feb-07        Jan-07        Dec-06        Nov-06       
[106] Oct-06        Sep-06        Aug-06        Jul-06        Jun-06       
[111] May-06        Apr-06        Mar-06        Feb-06        Jan-06       
[116] Dec-05        Nov-05        Oct-05        Sep-05        Aug-05       
[121] Jul-05        Jun-05        May-05       

# = 123 rows, first two units are Million units and nothing

df[["Financial Statements Period Ended"]][3:123]

[1] May-15 Apr-15 Mar-15 Feb-15 Jan-15 Dec-14 Nov-14 Oct-14 Sep-14 Aug-14
 [11] Jul-14 Jun-14 May-14 Apr-14 Mar-14 Feb-14 Jan-14 Dec-13 Nov-13 Oct-13
 [21] Sep-13 Aug-13 Jul-13 Jun-13 May-13 Apr-13 Mar-13 Feb-13 Jan-13 Dec-12
 [31] Nov-12 Oct-12 Sep-12 Aug-12 Jul-12 Jun-12 May-12 Apr-12 Mar-12 Feb-12
 [41] Jan-12 Dec-11 Nov-11 Oct-11 Sep-11 Aug-11 Jul-11 Jun-11 May-11 Apr-11
 [51] Mar-11 Feb-11 Jan-11 Dec-10 Nov-10 Oct-10 Sep-10 Aug-10 Jul-10 Jun-10
 [61] May-10 Apr-10 Mar-10 Feb-10 Jan-10 Dec-09 Nov-09 Oct-09 Sep-09 Aug-09
 [71] Jul-09 Jun-09 May-09 Apr-09 Mar-09 Feb-09 Jan-09 Dec-08 Nov-08 Oct-08
 [81] Sep-08 Aug-08 Jul-08 Jun-08 May-08 Apr-08 Mar-08 Feb-08 Jan-08 Dec-07
 [91] Nov-07 Oct-07 Sep-07 Aug-07 Jul-07 Jun-07 May-07 Apr-07 Mar-07 Feb-07
[101] Jan-07 Dec-06 Nov-06 Oct-06 Sep-06 Aug-06 Jul-06 Jun-06 May-06 Apr-06
[111] Mar-06 Feb-06 Jan-06 Dec-05 Nov-05 Oct-05 Sep-05 Aug-05 Jul-05 Jun-05
[121] May-05

df[3:123,]

# knock out the first two rows so that number of rows is 121
df <- as.data.frame(df[3:123,])

df[["Financial Statements Period Ended"]] <- seq(as.Date('2005-05-15'), by = 'months', length = 121)
#df[["Financial Statements Period Ended"]] <- sort(df[["Financial Statements Period Ended"]],decreasing=TRUE)

df <- sort(df[["Financial Statements Period Ended"]],)
head(df)
[1] "2005-05-15" "2005-06-15" "2005-07-15" "2005-08-15" "2005-09-15"
[6] "2005-10-15"
class(df)

[1] "Date"
# I have lost the rest of the dataframe, its just the date vector

#sort(df[["Financial Statements Period Ended"]],decreasing=TRUE)

str(df)
'data.frame':	121 obs. of  8 variables:
 $ Financial Statements Period Ended        : Date, format: "2015-05-15" "2015-04-15" ...
 $ Net position excluding transfers         : num  8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 ...
 $ Net transfers from the assigned amount   : num  -115 -120 -120 -120 -119 ...
 $ Net position                             : num  124 128 128 128 128 ...
 $ Carbon Price                             : Factor w/ 37 levels "€ 0.01","€ 0.02",..: 2 2 2 2 2 2 3 5 6 8 ...
 $ NZ$ Exchange Rate                        : num  0.652 0.685 0.693 0.673 0.642 ...
 $ Carbon Price (NZ$)                       : num  0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ...
 $ Value of the Net Asset/(Liability) (NZ$m): num  4 4 4 4 4 4 12 20 24 30 ...

 
 
df[120:121,]

dim(df)
1] 121   8
# rows should be 121
names(df)
[1] "Financial Statements Period Ended"        
[2] "Net position excluding transfers"         
[3] "Net transfers from the assigned amount"   
[4] "Net position"                             
[5] "Carbon Price"                             
[6] "NZ$ Exchange Rate"                        
[7] "Carbon Price (NZ$)"                       
[8] "Value of the Net Asset/(Liability) (NZ$m)"

str(df[,1])
Date[1:121], format: "2015-05-15" "2015-04-15" "2015-03-15" "2015-02-15" ...
str(df[,2])
num [1:121] 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 ...

str(df[,3])
num [1:121] -115 -120 -120 -120 -119 ...
str(df[,4])
num [1:121] 124 128 128 128 128 ...
str(df[,5])
Factor w/ 37 levels "€ 0.01","€ 0.02",..: 2 2 2 2 2 2 3 5 6 8 ...
str(df[,6])
num [1:121] 0.652 0.685 0.693 0.673 0.642 ...
str(df[,8])
num [1:121] 4 4 4 4 4 4 12 20 24 30 ...
str(df[,7])
num [1:121] 0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ... 

summary(df[,7])
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.02    1.07   13.52   12.23   20.23   29.24
       
summary(df["Carbon Price (NZ$)"])
 Carbon Price (NZ$)
 Min.   : 0.02     
 1st Qu.: 1.07     
 Median :13.52     
 Mean   :12.23     
 3rd Qu.:20.23     
 Max.   :29.24  

str(df["Carbon Price (NZ$)"])
'data.frame':	121 obs. of  1 variable:
 $ Carbon Price (NZ$): num  0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ...
str(df[,7])
 num [1:121] 0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ...
#  one is a data frame, the other is a numeric vector

# sort/order data by date    https://www.statmethods.net/management/sorting.html

attach(df)

df <- df[order(df[["Financial Statements Period Ended"]],decreasing=FALSE),] 

write.table(df, file = "nz-kyoto-cer-price-2005-2015.csv", sep = ",", col.names = TRUE, qmethod = "double",row.names = FALSE)

dput(df, "cer_df.txt")

# One problem - the dates are the wrong way - backward!  need to sort dataframe Now resolved

head(df[["Financial Statements Period Ended"]])
[1] "2005-05-15" "2005-06-15" "2005-07-15" "2005-08-15" "2005-09-15" [6] "2005-10-15"

sort(df[["Financial Statements Period Ended"]])

[1] "2005-05-15" "2005-06-15" "2005-07-15" "2005-08-15" "2005-09-15"
  [6] "2005-10-15" "2005-11-15" "2005-12-15" "2006-01-15" "2006-02-15"
 [11] "2006-03-15" "2006-04-15" "2006-05-15" "2006-06-15" "2006-07-15"
 [16] "2006-08-15" "2006-09-15" "2006-10-15" "2006-11-15" "2006-12-15"
 [21] "2007-01-15" "2007-02-15" "2007-03-15" "2007-04-15" "2007-05-15"
 [26] "2007-06-15" "2007-07-15" "2007-08-15" "2007-09-15" "2007-10-15"
 [31] "2007-11-15" "2007-12-15" "2008-01-15" "2008-02-15" "2008-03-15"
 [36] "2008-04-15" "2008-05-15" "2008-06-15" "2008-07-15" "2008-08-15"
 [41] "2008-09-15" "2008-10-15" "2008-11-15" "2008-12-15" "2009-01-15"
 [46] "2009-02-15" "2009-03-15" "2009-04-15" "2009-05-15" "2009-06-15"
 [51] "2009-07-15" "2009-08-15" "2009-09-15" "2009-10-15" "2009-11-15"
 [56] "2009-12-15" "2010-01-15" "2010-02-15" "2010-03-15" "2010-04-15"
 [61] "2010-05-15" "2010-06-15" "2010-07-15" "2010-08-15" "2010-09-15"
 [66] "2010-10-15" "2010-11-15" "2010-12-15" "2011-01-15" "2011-02-15"
 [71] "2011-03-15" "2011-04-15" "2011-05-15" "2011-06-15" "2011-07-15"
 [76] "2011-08-15" "2011-09-15" "2011-10-15" "2011-11-15" "2011-12-15"
 [81] "2012-01-15" "2012-02-15" "2012-03-15" "2012-04-15" "2012-05-15"
 [86] "2012-06-15" "2012-07-15" "2012-08-15" "2012-09-15" "2012-10-15"
 [91] "2012-11-15" "2012-12-15" "2013-01-15" "2013-02-15" "2013-03-15"
 [96] "2013-04-15" "2013-05-15" "2013-06-15" "2013-07-15" "2013-08-15"
[101] "2013-09-15" "2013-10-15" "2013-11-15" "2013-12-15" "2014-01-15"
[106] "2014-02-15" "2014-03-15" "2014-04-15" "2014-05-15" "2014-06-15"
[111] "2014-07-15" "2014-08-15" "2014-09-15" "2014-10-15" "2014-11-15"
[116] "2014-12-15" "2015-01-15" "2015-02-15" "2015-03-15" "2015-04-15"
[121] "2015-05-15"

df[["Financial Statements Period Ended"]]

  [1] "2005-05-15" "2005-06-15" "2005-07-15" "2005-08-15" "2005-09-15"
  [6] "2005-10-15" "2005-11-15" "2005-12-15" "2006-01-15" "2006-02-15"
 [11] "2006-03-15" "2006-04-15" "2006-05-15" "2006-06-15" "2006-07-15"
 [16] "2006-08-15" "2006-09-15" "2006-10-15" "2006-11-15" "2006-12-15"
 [21] "2007-01-15" "2007-02-15" "2007-03-15" "2007-04-15" "2007-05-15"
 [26] "2007-06-15" "2007-07-15" "2007-08-15" "2007-09-15" "2007-10-15"
 [31] "2007-11-15" "2007-12-15" "2008-01-15" "2008-02-15" "2008-03-15"
 [36] "2008-04-15" "2008-05-15" "2008-06-15" "2008-07-15" "2008-08-15"
 [41] "2008-09-15" "2008-10-15" "2008-11-15" "2008-12-15" "2009-01-15"
 [46] "2009-02-15" "2009-03-15" "2009-04-15" "2009-05-15" "2009-06-15"
 [51] "2009-07-15" "2009-08-15" "2009-09-15" "2009-10-15" "2009-11-15"
 [56] "2009-12-15" "2010-01-15" "2010-02-15" "2010-03-15" "2010-04-15"
 [61] "2010-05-15" "2010-06-15" "2010-07-15" "2010-08-15" "2010-09-15"
 [66] "2010-10-15" "2010-11-15" "2010-12-15" "2011-01-15" "2011-02-15"
 [71] "2011-03-15" "2011-04-15" "2011-05-15" "2011-06-15" "2011-07-15"
 [76] "2011-08-15" "2011-09-15" "2011-10-15" "2011-11-15" "2011-12-15"
 [81] "2012-01-15" "2012-02-15" "2012-03-15" "2012-04-15" "2012-05-15"
 [86] "2012-06-15" "2012-07-15" "2012-08-15" "2012-09-15" "2012-10-15"
 [91] "2012-11-15" "2012-12-15" "2013-01-15" "2013-02-15" "2013-03-15"
 [96] "2013-04-15" "2013-05-15" "2013-06-15" "2013-07-15" "2013-08-15"
[101] "2013-09-15" "2013-10-15" "2013-11-15" "2013-12-15" "2014-01-15"
[106] "2014-02-15" "2014-03-15" "2014-04-15" "2014-05-15" "2014-06-15"
[111] "2014-07-15" "2014-08-15" "2014-09-15" "2014-10-15" "2014-11-15"
[116] "2014-12-15" "2015-01-15" "2015-02-15" "2015-03-15" "2015-04-15"
[121] "2015-05-15"

sort(df[["Financial Statements Period Ended"]],decreasing=TRUE)
  [1] "2015-05-15" "2015-04-15" "2015-03-15" "2015-02-15" "2015-01-15"
  [6] "2014-12-15" "2014-11-15" "2014-10-15" "2014-09-15" "2014-08-15"
 [11] "2014-07-15" "2014-06-15" "2014-05-15" "2014-04-15" "2014-03-15"
 [16] "2014-02-15" "2014-01-15" "2013-12-15" "2013-11-15" "2013-10-15"
 [21] "2013-09-15" "2013-08-15" "2013-07-15" "2013-06-15" "2013-05-15"
 [26] "2013-04-15" "2013-03-15" "2013-02-15" "2013-01-15" "2012-12-15"
 [31] "2012-11-15" "2012-10-15" "2012-09-15" "2012-08-15" "2012-07-15"
 [36] "2012-06-15" "2012-05-15" "2012-04-15" "2012-03-15" "2012-02-15"
 [41] "2012-01-15" "2011-12-15" "2011-11-15" "2011-10-15" "2011-09-15"
 [46] "2011-08-15" "2011-07-15" "2011-06-15" "2011-05-15" "2011-04-15"
 [51] "2011-03-15" "2011-02-15" "2011-01-15" "2010-12-15" "2010-11-15"
 [56] "2010-10-15" "2010-09-15" "2010-08-15" "2010-07-15" "2010-06-15"
 [61] "2010-05-15" "2010-04-15" "2010-03-15" "2010-02-15" "2010-01-15"
 [66] "2009-12-15" "2009-11-15" "2009-10-15" "2009-09-15" "2009-08-15"
 [71] "2009-07-15" "2009-06-15" "2009-05-15" "2009-04-15" "2009-03-15"
 [76] "2009-02-15" "2009-01-15" "2008-12-15" "2008-11-15" "2008-10-15"
 [81] "2008-09-15" "2008-08-15" "2008-07-15" "2008-06-15" "2008-05-15"
 [86] "2008-04-15" "2008-03-15" "2008-02-15" "2008-01-15" "2007-12-15"
 [91] "2007-11-15" "2007-10-15" "2007-09-15" "2007-08-15" "2007-07-15"
 [96] "2007-06-15" "2007-05-15" "2007-04-15" "2007-03-15" "2007-02-15"
[101] "2007-01-15" "2006-12-15" "2006-11-15" "2006-10-15" "2006-09-15"
[106] "2006-08-15" "2006-07-15" "2006-06-15" "2006-05-15" "2006-04-15"
[111] "2006-03-15" "2006-02-15" "2006-01-15" "2005-12-15" "2005-11-15"
[116] "2005-10-15" "2005-09-15" "2005-08-15" "2005-07-15" "2005-06-15"
[121] "2005-05-15"

-------------------------------------------------------------------------------------------------------------------
cer <- read.csv("nz-kyoto-cer-price-2005-2015.csv", skip=0,header=TRUE, sep=",", na.strings="NaN", dec=".", strip.white=TRUE)
'data.frame':	121 obs. of  8 variables:
 $ Financial.Statements.Period.Ended        : chr  "2005-05-15" "2005-06-15" "2005-07-15" "2005-08-15" ...
 $ Net.position.excluding.transfers         : num  -36.2 -36.2 -36.2 -36.2 -36.2 -36.2 -36.2 -64 -64 -64 ...
 $ Net.transfers.from.the.assigned.amount   : num  0 0 0 0 0 0 0 0 0 0 ...
 $ Net.position                             : num  -36.2 -36.2 -36.2 -36.2 -36.2 -36.2 -36.2 -64 -64 -64 ...
 $ Carbon.Price                             : chr  "USD 6.00" "USD 6.00" "USD 6.00" "USD 6.00" ...
 $ NZ..Exchange.Rate                        : num  0.708 0.701 0.684 0.69 0.693 ...
 $ Carbon.Price..NZ..                       : num  8.48 8.56 8.78 8.7 8.66 8.54 8.55 8.78 8.79 9.09 ...
 $ Value.of.the.Net.Asset..Liability...NZ.m.: int  -307 -310 -318 -315 -313 -309 -309 -562 -563 -582 ... 
 # change date column to date format
cer$Financial.Statements.Period.Ended <- as.Date(cer$Financial.Statements.Period.Ended)
# check the date formatted column
str(cer[["Financial.Statements.Period.Ended"]]) 
Date[1:121], format: "2005-05-15" "2005-06-15" "2005-07-15" "2005-08-15" "2005-09-15" ... 
# check the first 2 rows of data frame
head(cer,2)
  Financial.Statements.Period.Ended Net.position.excluding.transfers
1                        2005-05-15                            -36.2
2                        2005-06-15                            -36.2
  Net.transfers.from.the.assigned.amount Net.position Carbon.Price
1                                      0        -36.2     USD 6.00
2                                      0        -36.2     USD 6.00
  NZ..Exchange.Rate Carbon.Price..NZ..
1            0.7076               8.48
2            0.7010               8.56
  Value.of.the.Net.Asset..Liability...NZ.m.
1                                      -307
2                                      -310 
names(cer) 
[1] "Financial.Statements.Period.Ended"        
[2] "Net.position.excluding.transfers"         
[3] "Net.transfers.from.the.assigned.amount"   
[4] "Net.position"                             
[5] "Carbon.Price"                             
[6] "NZ..Exchange.Rate"                        
[7] "Carbon.Price..NZ.."                       
[8] "Value.of.the.Net.Asset..Liability...NZ.m."

# create line chart with line colour #D2691E or "Hot Cinnamon" 
#svg(filename="NZ-Kyoto-Prices-720by540v1.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
#png("NZ-Kyoto-Prices-560by420-v1.png", bg="white", width=560, height=420,pointsize = 14)
png("NZ-Kyoto-Prices-560by420-v2.png", bg="white", width=560, height=420,pointsize = 12)
par(mar=c(2.7,2.7,1,1)+0.1)
plot(cer$Financial.Statements.Period.Ended,cer$"Carbon.Price..NZ..",ylim=c(0,34),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,lwd=3,col="#D2691E",ylab="",xlab="",main="")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
mtext(side=3,cex=1.7, line=-4.2,expression(paste("Carbon prices used in calculation of New Zealand \nKyoto Protocol net position 2005 - 2015")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/unit")
mtext(side=1, adj=0,line =-1.1 ,cex=0.8,"Data: Historic updates of the Kyoto Protocol financial information\nhttps://github.com/theecanmole/Historic-updates-of-the-Kyoto-Protocol-carbon-price")
dev.off()


cer <- read.csv("HistoricupdatesKyotoProtocolfinancialinformation2015.csv", skip=4,header=TRUE, sep=",", na.strings="NaN", dec=".", strip.white=TRUE)
str(cer) 
'data.frame':	121 obs. of  8 variables:
 $ X.1  : Factor w/ 121 levels "2005/05/15","2005/06/15",..: 121 120 119 118 117 116 115 114 113 112 ...
 $ A    : num  8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 ...
 $ B    : num  -115 -120 -120 -120 -119 ...
 $ C.A.B: num  124 128 128 128 128 ...
 $ X    : Factor w/ 36 levels "0.01","0.02",..: 2 2 2 2 2 2 3 5 6 8 ...
 $ Y    : num  0.652 0.685 0.693 0.673 0.642 ...
 $ Z.X.Y: num  0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ...
 $ C.x.Z: int  4 4 4 4 4 4 12 20 24 30 ...
names(cer)
[1] "X.1"   "A"     "B"     "C.A.B" "X"     "Y"     "Z.X.Y" "C.x.Z"
# X.1 is the month/date 'Financial Statements Period Ended'
# A 'Net position excluding transfers million units'
# B 'Net transfers from the assigned amount m'
# C.A.B 'Net position' in million units 
# X 'Carbon Price' in euro or USD
# Y 'NZD exchange rate'
# Z.X.Y 'Carbon price NZD'
# C.x.Z 'Value of the Net Asset/(Liability) (NZ$m)' is the net Kyoto position asset/liability in million NZD 

# cer$Z.X.Y is the 'carbon price' used to calculate NZ's Kyoto Protocol net position (asset or liability)

cer$date<-as.Date(cer$X.1) 
cer$price <-as.numeric(cer$Z.X.Y)

str(cer)
'data.frame':	121 obs. of  9 variables:
 $ X.1  : Factor w/ 121 levels "2005/05/15","2005/06/15",..: 121 120 119 118 117 116 115 114 113 112 ...
 $ A    : num  8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 ...
 $ B    : num  -115 -120 -120 -120 -119 ...
 $ C.A.B: num  124 128 128 128 128 ...
 $ X    : Factor w/ 36 levels "0.01","0.02",..: 2 2 2 2 2 2 3 5 6 8 ...
 $ Y    : num  0.652 0.685 0.693 0.673 0.642 ...
 $ Z.X.Y: num  0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ...
 $ C.x.Z: int  4 4 4 4 4 4 12 20 24 30 ...
 $ date : Date, format: "2015-05-15" "2015-04-15" ...

summary(cer$Z.X.Y)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.02    8.36   14.80   13.81   20.34   29.24

head(cer)
         X.1   A      B C.A.B    X      Y Z.X.Y C.x.Z       date price
1 2015/05/15 8.3 -115.4 123.7 0.02 0.6521  0.03     4 2015-05-15  0.03
2 2015/04/15 8.3 -119.7 128.0 0.02 0.6855  0.03     4 2015-04-15  0.03
3 2015/03/15 8.3 -119.7 128.1 0.02 0.6928  0.03     4 2015-03-15  0.03 
   
cerprice <-subset(cer, select = c(date,price))   

str(cerprice) 
'data.frame':	121 obs. of  2 variables:
 $ date : Date, format: "2015-05-15" "2015-04-15" ...
 $ price: num  0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ...
 
write.table(cerprice, file = "cer-price-2005-2015.csv", sep = ",", col.names = TRUE, qmethod = "double",row.names = FALSE)

dput(cerprice, "cerprice.txt")

cerprice[["price"]][121]
8.48
cerprice[["date"]][121]
[1] "2005-05-15"
# 2005 first price
cerprice[["price"]][1]
[1] 0.03 
# 2015 last price

cerprice[1,]
        date price
1 2015-05-15  0.03
cerprice[63,]
         date price
63 2010-03-15 20.29

#cerprice20102015 <-c(cerprice[1:65,])
# str(cerprice20102015)
# List of 2
# $ date : Date[1:65], format: "2015-05-15" "2015-04-15" ...
# $ price: num [1:65] 0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ...
# plot(cerprice20102015)
# Error in xy.coords(x, y, xlabel, ylabel, log) : 
#  'x' is a list, but does not have components 'x' and 'y'
# rm(cerprice20102015)

cerprice20102015 <-data.frame(cerprice[1:65,])

str(cerprice20102015)
'data.frame':	65 obs. of  2 variables:
 $ date : Date, format: "2015-05-15" "2015-04-15" ...
 $ price: num  0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25

 
png("NZ-Cers20102015-720by540v1.png", width = 720, height = 540, pointsize = 16, family = "sans", bg = "white")
#par(mar=c(2.7,2.7,1,1)+0.1)
plot(cerprice20102015,ylim=c(0,24),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,ylab="$NZ Dollars/unit",xlab="",
main="Carbon prices used in calculation of New Zealand \nKyoto Protocol net position 2010 - 2015")
#axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
#axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
mtext(side=1,cex=1, line=2.3, "Data: MfE Historic updates of the Kyoto Protocol financial information 30/03/16")
dev.off()

png("NZ-Cers20102015-720by540v1.png", width = 720, height = 540, pointsize = 16, family = "sans", bg = "white")
#par(mar=c(2.7,2.7,1,1)+0.1)
plot(cerprice20102015,ylim=c(0,24),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,ylab="$NZ Dollars/unit",xlab="",
main="Carbon prices used in calculation of New Zealand \nKyoto Protocol net position 2010 - 2015")
points(cerprice20102015,pch=19)
#axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
#axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
mtext(side=1,cex=1, line=2.3, "Data: MfE Historic updates of the Kyoto Protocol financial information 30/03/16")
dev.off()
#mtext(side=3,cex=1.7, line=-2.2,expression(paste("New Zealand Kyoto Protocol Carbon Prices 2010 - 2015")) )
#text(2005.333,2.5,adj=0,cex=0.8,"Data: Historic updates of the Kyoto Protocol financial information 30/03/16 
\nhttp://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-emissions/\nnzs-net-position-under-kyoto-protocol/historic)

abline(v=2007+(5/6))
# change from USD to EUR

svg(filename="NZ-Kyoto-Net-720by540b.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))  
#par(mar=c(2.7,2.7,1,1)+0.1)
plot(cerprice[["date"]],cerprice[["price"]],ylim=c(0,29),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,ylab="$NZ Dollars/unit",xlab="Date",
main="Carbon prices used in calculation of New Zealand \nKyoto Protocol net position 2010 - 2015")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
text(cerprice$date[3],2.5,adj=1,cex=0.8,"Data: Historic updates of the Kyoto Protocol financial information 30/03/16 
\nhttp://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-emissions/\nnzs-net-position-under-kyoto-protocol/historic")
dev.off()
# col #00FA9A = medium spring green #D2691E chocolate

png("NZ-Kyoto-Prices-720by540v2.png", width = 720, height = 540, pointsize = 16, family = "sans", bg = "white")
par(mar=c(2.7,2.7,1,1)+0.1)
plot(cer[["date"]],cer[["price"]],ylim=c(0,34),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,lwd=3,col="#D2691E",ylab="",xlab="",main="")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
#grid(col="darkgray")
mtext(side=1, adj=0,cex=0.8,line=4.2,"Data: Historic updates of the Kyoto Protocol financial information 30/03/16\nhttp://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-\nemissions/nzs-net-position-under-kyoto-protocol/historic")
mtext(side=3,cex=1.7, line=-4.2,expression(paste("Carbon prices used in calculation of New Zealand \nKyoto Protocol net position 2005 - 2014")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/unit")
dev.off()

svg(filename="NZ-Kyoto-Prices-720by540v2.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(cer$date,cer$Z.X.Y,ylim=c(0,34),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,lwd=3,col="#D2691E",ylab="",xlab="",main="")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
#text(2005.1,2.5,adj=0,cex=0.8,"Data: Historic updates of the Kyoto Protocol financial information\nhttp://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-\nemissions/nzs-net-position-under-kyoto-protocol/historic 30/03/16")
mtext(side=3,cex=1.7, line=-4.2,expression(paste("Carbon prices used in calculation of New Zealand \nKyoto Protocol net position 2005 - 2014")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/unit")
dev.off()


# C.x.Z is net position asset/liability in million NZD 
summary(cer$C.x.Z)
  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-1009.0  -565.0    38.0  -154.4   195.0   444.0

png("NZ-Kyoto-Net-Asset-720by540v2.png", width = 720, height = 540, pointsize = 16, family = "sans", bg = "white")
par(mar=c(2.7,3,1,1)+0.1)
plot(cer$Decimal,cer$C.x.Z,ylim=c(-1000,635),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,lwd=3,col="#D2691E",ylab="",xlab="",main="")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
text(2008.5,-900,adj=0,cex=0.8,"Data: Historic updates of the Kyoto Protocol financial information\nhttp://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-\nemissions/nzs-net-position-under-kyoto-protocol/historic 30/03/16")
mtext(side=3,cex=1.6, line=-3.8, expression(paste("New Zealand Kyoto Protocol Net Position \nAsset/Liability in $NZ Million 2005 - 2014")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Million")
dev.off()

# C.A.B is net position in million units 
summary(cer$C.A.B)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-64.000 -41.200   9.100  -0.414  21.900 100.800 

png("NZ-Kyoto-Net-Units-720by540v2.png", width = 720, height = 540, pointsize = 16, family = "sans", bg = "white")
par(mar=c(2.7,3,1,1)+0.1)
plot(cer$Decimal,cer$C.A.B,ylim=c(-65,110),tck=0.01,axes=TRUE,ann=TRUE, type="l",las=1,lwd=3,col="#D2691E",ylab="",xlab="",main="")
axis(side=3, tck=0.01, las=0,tick=TRUE,labels = FALSE)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
grid(col="darkgray")
text(2006.8,-60,adj=0,cex=0.8,"Data: Historic updates of the Kyoto Protocol financial information\nhttp://www.mfe.govt.nz/climate-change/reporting-greenhouse-gas-\nemissions/nzs-net-position-under-kyoto-protocol/historic 30/03/16")
mtext(side=3,cex=1.7, line=-4.2, expression(paste("New Zealand Kyoto Protocol Net \nPosition in Kyoto Units 2005 - 2014")) )
mtext(side=2,cex=1, line=-1.3,"Million Kyoto units")
dev.off()

----------------------------------------------------------------
4/02/2017
opened cer.rdata workspace
ls()
[1] "df" "x"  "y"
str(df)
'data.frame':	121 obs. of  8 variables:
 $ Financial Statements Period Ended        : Date, format: "2015-05-15" "2015-04-15" ...
 $ Net position excluding transfers         : num  8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 8.3 ...
 $ Net transfers from the assigned amount   : num  -115 -120 -120 -120 -119 ...
 $ Net position                             : num  124 128 128 128 128 ...
 $ Carbon Price                             : Factor w/ 37 levels "€ 0.01","€ 0.02",..: 2 2 2 2 2 2 3 5 6 8 ...
 $ NZ$ Exchange Rate                        : num  0.652 0.685 0.693 0.673 0.642 ...
 $ Carbon Price (NZ$)                       : num  0.03 0.03 0.03 0.03 0.03 0.03 0.1 0.16 0.2 0.25 ...
 $ Value of the Net Asset/(Liability) (NZ$m): num  4 4 4 4 4 4 12 20 24 30 ...
 # the dataframe is in reverse monthly date order - newest to oldest
 

head(df)
  Financial Statements Period Ended Net position excluding transfers
3                        2015-05-15                              8.3
4                        2015-04-15                              8.3
5                        2015-03-15                              8.3
6                        2015-02-15                              8.3
7                        2015-01-15                              8.3
8                        2014-12-15                              8.3

order[df,df$Financial Statements Period Ended,]

http://www.statmethods.net/management/sorting.html
# sorting examples using the mtcars dataset
attach(mtcars)

# sort by mpg
newdata <- mtcars[order(mpg),]

# sort by mpg and cyl
newdata <- mtcars[order(mpg, cyl),]

#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mpg, -cyl),]

head(temps)
   Source    Date   Mean
1 GISTEMP 2016-11 0.9500
2    GCAG 2016-10 0.7301
3 GISTEMP 2016-10 0.8800
4    GCAG 2016-09 0.8739
5 GISTEMP 2016-09 0.9000
6    GCAG 2016-08 0.8907

temps[order(Date),]
Error in order(Date) : object 'Date' not found

attach(temps)

tempsort <- temps[order(Date),]
head(tempsort)
      Source    Date    Mean
3284    GCAG 1880-01 -0.0084
3285 GISTEMP 1880-01 -0.3000
3282    GCAG 1880-02 -0.1315
3283 GISTEMP 1880-02 -0.2100
3280    GCAG 1880-03 -0.1450
3281 GISTEMP 1880-03 -0.1800

# That worked

detach(temps)
tempsortv2 <- temps[order(temps[["Date"]]),]
head(tempsort)
      Source    Date    Mean
3284    GCAG 1880-01 -0.0084
3285 GISTEMP 1880-01 -0.3000
3282    GCAG 1880-02 -0.1315
3283 GISTEMP 1880-02 -0.2100
3280    GCAG 1880-03 -0.1450
3281 GISTEMP 1880-03 -0.1800

# That worked

temps[order(3),]
Source    Date Mean
1 GISTEMP 2016-11 0.95

head(temps[2:3,])
   Source    Date   Mean
2    GCAG 2016-10 0.7301
3 GISTEMP 2016-10 0.8800
#  rows 2:3 all columns

 head(temps[,2:3])
     Date   Mean
1 2016-11 0.9500
2 2016-10 0.7301
3 2016-10 0.8800
4 2016-09 0.8739
5 2016-09 0.9000
6 2016-08 0.8907
# all rows but only columns 2:3
