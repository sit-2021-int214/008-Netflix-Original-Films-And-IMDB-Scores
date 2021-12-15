n1 <- 125
n2 <- 183
sd1 <- 9.52
sd2 <- 7.79
xbar1 <- 10.42  
xbar2 <- 15.25
u0 <- 15

#h0: mue1-mue2 >= 15   ,ha: mue1-mue2 <  15

alpha <- 0.05


z <- (xbar1 - xbar2) / (sqrt(sd1^2/n1+sd2^2/n2));z

# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha

# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
