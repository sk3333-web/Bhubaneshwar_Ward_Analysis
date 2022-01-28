
#Installing and loading packages
install.packages("tmap")
install.packages("rgdal")
install.packages("sf")
install.packages("rgeos")
install.packages("anytime")
install.packages("dplyr")
install.packages("data.table")
install.packages("RColorBrewer")

library(dplyr)
library(rgdal)
library(rgeos)
library(tmap)
library(sf)
library(data.table)
library(anytime)
library(RColorBrewer)

#Importing shape file
bhubh_shape<- readOGR(choose.files(caption = "select shapefile",multi = "FALSE"))
plot(bhubh_shape)

#Importing dataset
bhubh_data<- read.csv("C:\\Users\\saura\\OneDrive\\Desktop\\bhubhu\\Slum_Housing_Bhubaneswar_1.csv")
bhubh_data
View(bhubh_data)
colnames(bhubh_data)
mum_merge<- merge(bhubh_shape,bhubh_data, by.x = "objectid", by.y = "Ward.No.")

#Slum population
tm_shape(mum_merge) + tm_fill("Slum.Population...Total",n = 20,palette = "Reds") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "BHUBANESHWAR(INDIA)", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)

tm_shape(mum_merge) + tm_fill("Slum.Population...Male",n = 20,palette = "Reds") + tm_borders(alpha = 0.7)

tm_shape(mum_merge) + tm_fill("Male.Literacy",n = 20,palette = "Reds") + tm_borders(alpha = 0.7)


#Male Literacy
tm_shape(mum_merge) + tm_fill("Male.Literacy",n = 20,palette = "Oranges") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "MALE LITERACY", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)

#Female Literacy
tm_shape(mum_merge) + tm_fill("Female.Literacy",n = 20,palette = "Reds") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "FEMALE LITERACY", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)

#Male Population
tm_shape(mum_merge) + tm_fill("Male.Population",n = 20,palette = "Blues") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "MALE POPULATION", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)

#Female Population
tm_shape(mum_merge) + tm_fill("Female.Population",n = 20,palette = "PuBu") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "FEMALE POPULATION", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)

#Children Population
tm_shape(mum_merge) + tm_fill("Children.Population",n = 20,palette = "OrRd") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "CHILDREN POPULATION", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)

#No of Households
tm_shape(mum_merge) + tm_fill("Number.of.Households",n = 20,palette = "BuGn") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "No of houses", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)

#No..of.Identfied.Slums
tm_shape(mum_merge) + tm_fill("No..of.Identfied.Slums",n = 20,palette = "Oranges") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "No of slums", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)


#Total population

tm_shape(mum_merge) + tm_fill("Total.Population",n = 20,palette = "Oranges") + tm_borders(alpha = 0.7)+
  tm_text("objectid", size ="AREA")+ tm_layout(title = "Total Population", legend.outside = TRUE, frame = FALSE, legend.text.size = 1.5)


