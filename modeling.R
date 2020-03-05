germ_model <- glm(germination ~ janrain + febrain + marchrain + aprilrain + mayrain + bank, data = yearlydata)
summary(germ_model)

fecund_model <- glm(seedpods ~  janrain + febrain + marchrain + aprilrain + mayrain + cage, data = all_data, family = poisson) 
summary(fecund_model)

fecund_df <- data.frame(janrain = 300, febrain = 200, marchrain = 650, aprilrain = 100, mayrain = 200, cage = "Big")

test <- predict(fecund_model, fecund_df)
test


#####################
#####   to do:  #####
#####################

## 1) get montly rain data for past 15 years
#~ for each year w/in the model we will randomly select one of these 15 years and use those monthly rain numbers to predect a fecundity and germination rate)


## 2) to build the germination model: (note: use binomical dist)
#~~~ a) need to recalculate the "seedbank" variable w/in the dataframe
#~~~~~~ this will be based on some fixed assummed death rate of seeds (search literature to try and justify is this % or just use some arbitrary value like 20%)

#~~~~~~~based on Maron and Simmms 1997 we can assume the seed death rate is about 17%.

#~~~ b) based on this new seedbank variable, convert germination into a percent germination (this is so we can run this as a binomial regression)
#~~~ c) once we have that "new_bank" and "germ_percent" variables, we can build a bionomial regression, ie:
#~~~~~~ germination_percent ~ new_bank + janrain + febrain ..... 
# we can then use the same randomly rain selection to predict yearly germination within our model


### 3) For fecundity:
#~~ figure out why there NA's for march - may rain (may rain is also NA for the germ model)
#~~ also why are there two smalls? one "Small" and one "small" (lower case)


## 4) need to rebuild the function so that it can be re run with each cage treatment
#~~~~ and everything else obviously....



