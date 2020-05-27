library(data.table)        
library(rJava)
library(xlsxjars)
library(xlsx)


#set directory and data


#create a character object to represent the string values
newlist<-character(0)

# for loop to shuffle the 100 Foil items, each presented once
for (Word in 1:100){
 # here is the position of the new variable "Word" 
  if (Word==1){
   #c is a vector and splits Foil into two strings, seperated by "_"
      c<-strsplit(as.vector(data2$Foil),"_")
   #gg is a two column matrix and each column correspondes to the two above strings
      gg = matrix(unlist(c), ncol=2, byrow=TRUE)
   #b1 is a new vector where all the items of the Foil vector are selected except of Word
      b1<-data2$Foil[!gg[,1] %in% gg[,1][Word]]
    #shuffle all the items from b1 and select one 
    oneword = sample(b1,1)
    #then add the new selected word to the list
    newlist <- c(newlist, as.character(oneword))
  } else {
    # b1 is a new vector where all the items of the Foil vector are selected except of Word
    b1<-data1$Foil[!data1$Foil %in% data1$Foil[Word]]
    #create a new object named b2, it includes all the items of b1 except the output of newlist
    b2 <- b1[!b1 %in% newlist]
    #shuffle the items of b2 and select one
    oneword = sample(b2,1)
    #then add the new selected word to the list
    newlist <- c(newlist, as.character(oneword))
  }
  
}
print(newlist)

# write results
write.xlsx(newlist, "Pretest1.xlsx", sheetName = "NewFoils",
           col.names =TRUE, row.names = TRUE, append = TRUE)


