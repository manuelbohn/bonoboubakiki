library(data.table)        
library(xlsxjars)
library(xlsx)

# set directory

#load audiovisual data both for the animal and for the sound symbolic lists


#create blocks of animal and sound symbolic stimuli

#for loop for the 30 sessions
for (s in 1:30){
  #define 100 positions for each session for animals
  A1=(s-1)*90+1
  A2=90*s
  #define 100 positions for each session for sound symbolic shapes
  S1=(s-1)*10+1
  S2=10*s
  Animals=data2[A1:A2,]
  Shapes=data1[S1:S2,]
  # for loop for the 10 blocks
  for (b in 1:10) {
    #define position to use for random sampling 
    b1 = 2+(b-1)*10
    b2 = 9+(b-1)*10
    #sample random a value from positions b1 to b2
    rand=sample(b1:b2,1)
    #here one row from the Animal list is replaced by the a sound symbolic row
    Animals[seq(rand+1,nrow(Animals)+1),] <- Animals[seq(rand,nrow(Animals)),]
    Animals[rand,] <- Shapes[b,]
  }
  #write output
  write.xlsx(Animals, paste("Session",as.character(s),".xlsx",sep="_"), sheetName = paste("Session",as.character(s)),
             col.names =TRUE, row.names = TRUE, append = TRUE)
}
