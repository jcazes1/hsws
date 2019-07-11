

#finds elements of B corresponding to element A, need to find specific heat later
Li = "Li"
Ca = "Ca"
Mg = "Mg"
Y = "Y"
Zn = "Zn"
elementA=c(Li,Ca,Mg,Y,Zn)

findSpecificHeat = function(elementA){
  
  bIndices = which(battery_data$A == elementA)
  bElements = as.vector(battery_data$B[min(bIndices):max(bIndices)])  #gives list of elements that
                                                                      #could help with the battery
  # print(sort(bElements, index.return = TRUE))
  specificHeat = as.vector(subset(elemental_data, Symbol %in% bElements, select = c("Specific Heat", "Symbol"), drop = TRUE))
  specificHeat = data.frame(specificHeat)   #creates a data frame of the heat capacity and bElements, ordered numerically,
                                            #not alphabetically like we need
  # specificHeat= (as.vector(unlist(specificHeat[1])))
  #sort(specificHeat$A)
  print(specificHeat)
  intermediateData1=merge(battery_data, specificHeat, by.x = "B", by.y = "Symbol", all.x = TRUE)
  intermediateData2=intermediateData1[,c(2,1,3,4,5)]
  intermediateData2[order(intermediateData2$A), ]
  betterData=intermediateData2[order(intermediateData2$A), ]
  
  
}

