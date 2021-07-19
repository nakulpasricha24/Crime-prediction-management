setwd("C:/Users/Aditya Pasricha/Desktop/Crime Management System/Output")
indiacrime = read.csv("Crime.csv", header = TRUE)
if(!file.exists("output")) {
  dir.create("output")
}
crime <- c("Sexual Assault","Kidnapping & Abduction","Robbery","Drug Trafficking","Insult to modesty","Honor Killing","Homicides","Immoral traffic act","Embezzlement","Organized Crime","Cyber Crime","Total crimes against women")
state <- c( "Andhra Pradesh","Arunachal Pradesh", "Assam","Bihar","Chattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","JammuKashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab", "Rajasthan","Sikkim","Tamil Nadu","Tripura","Uttar Pradesh","Uttarakhand","West Bengal","Delhi")
for (i in 1:29){
  j <- c(i)
  for(k in 1:12)
  {
    statecrime(indiacrime, j, state[i],crime[k])
    j <- j+38
  }
}

