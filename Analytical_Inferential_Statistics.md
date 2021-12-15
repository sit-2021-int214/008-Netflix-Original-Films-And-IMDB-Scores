การเข้าฉายของภาพยนต์ในปี 2019 มีจำนวนการเข้าฉายเป็น  125 เรื่องซึ่งในปี 2020 
นั้นมีการเข้าฉายภาพยนต์จำนวน 183 เรื่อง พวกเรามีความสนใจว่าเวลาในการฉายรวมของปี 2020 นั้น
มีการฉายหนังที่มากกว่าเดิม 15 เรื่องหรือไม่ โดยที่การฉายหนังเฉลี่ยในปี 2019 คือ10.42 ปี 2020 คือ 15.25
และมีค่าความแปรปรวนเป็น 90.63 และ 60.68 ตามลำดับ

```R
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
```

![image](https://user-images.githubusercontent.com/68818040/146147796-7f079b6d-3155-481a-b3e7-62a1a5285511.png)
