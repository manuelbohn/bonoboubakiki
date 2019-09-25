library(data.table)        
library(rJava)
library(xlsxjars)
library(xlsx)


#set directory and data



#create a character object to represent the string values

newlist<-character(0)

#loop for all 100 items
for (Word in 1:100){
  
  if (Word==1){
    b1<-data1$Foil[!data1$Foil %in% data1$Foil[Word]]
    oneword = sample(b1,1)
    newlist <- c(newlist, as.character(oneword))
  } else {
    b1<-data1$Foil[!data1$Foil %in% data1$Foil[Word]]
    b2 <- b1[!b1 %in% newlist]
    oneword = sample(b2,1)
    print(length(b2))
    newlist <- c(newlist, as.character(oneword))
  }
  
}
print(newlist)


write.xlsx(newlist, "Pretest1.xlsx", sheetName = "NewFoils",
           col.names =TRUE, row.names = TRUE, append = TRUE)


