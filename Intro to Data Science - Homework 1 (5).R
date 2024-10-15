Emily is the coolest person ever and is so amzing.
GitHub sucks!
attempt2
#QUESTION 1 - approved vs defeated bonds
table(bonds$Result)
#Differences in the rates of approved bonds across the four different government types
table(bonds$Type, bonds$Result)
#Obtain percentages/ descriptive statistics
prop.table(table(bonds$Type, bonds$Result),1)

#QUESTION 2 - add new variable to dataframe
bonds$'Votes_Total'<-bonds$VotesFor+bonds$VotesAgainst
#when, where, what of highest bond measure
bonds[which.max(bonds$Votes_Total),]

#QUESTION 3 - Create subset of dataset
approvedbonds <- bonds[bonds$Result=='Carried'& bonds$Votes_Total>=100,]
#create new variable within the subset dataframe
approvedbonds$'ApprovalRate'<-(approvedbonds$VotesFor)/(approvedbonds$Votes_Total)*100
#graph the variable's distribution
hist(approvedbonds$ApprovalRate)
#Upgrade the histogram
hist(approvedbonds$ApprovalRate, main = 'Approved Bonds', ylab = 'Carried Bonds', 
     xlab='Approval Rate(%)', col = '#B254A5')
#describe the graph's distribution
summary(approvedbonds$ApprovalRate)

#QUESTION 4 - graph relationship between approved bonds and cost
plot(approvedbonds$ApprovalRate,approvedbonds$Amount)
#Upgrade the plot
plot(approvedbonds$ApprovalRate,approvedbonds$Amount,main='Approved Bonds vs Cost',
     xlab='Approved Bonds',ylab='Cost ($)', col='lightpink')
#Display relationship
cor(approvedbonds$ApprovalRate, approvedbonds$Amount)
