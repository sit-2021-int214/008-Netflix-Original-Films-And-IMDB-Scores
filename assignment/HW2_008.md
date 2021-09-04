# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) จากตาราง cats สรุปได้ว่าน้ำหนักเฉลี่ยของแมวเพศผู้คือ 2.9 และน้ำหนักเฉลี่ยของแมวเมียคือ 2.359574
```{R}
avgcatsM <- mean(cats$Bwt[cats$Sex == "M"])
avgcatsM #2.9
avgcatsF <- mean(cats$Bwt[cats$Sex == "F"])
avgcatsF #2.359574
```

2.) จากตาราง cats สรุปได้ว่ามีแมวเพศผู้มีจำนวนมากกว่าเพศเมีย 50 ตัว
```{R}
catsM <- sum(cats$Sex == "M")
catsF <- sum(cats$Sex == "F")
catsF - catsM #50
```

3.) จากตาราง cats สรุปได้ว่าน้ำหนักเฉลี่ยของหัวใจแมวเพศผู้มากกว่าเพศเมีย
```{R}
mean(cats$Hwt[cats$Sex == "M"]) #11.32268
mean(cats$Hwt[cats$Sex == "F"]) #9.202128
```

4.) จากตาราง cats สรุปได้ว่าน้ำหนักของหัวใจแมวมากที่สุดคือ 20.5
```{R}
max(cats$Hwt) #20.5
```

5.) จากตาราง survey สรุปได้ว่าอายุเฉลี่ยของนักเรียนที่น้อยที่สุดห่างจากอายุเฉลี่ยของนักเรียนที่มากที่สุดอยู่ 56.25 
```{R}
minAge <- min(survey$Age)
maxAge <- max(survey$Age)
maxAge - minAge #56.25
```

6.) จากตาราง survey สรุปได้ว่านักเรียนส่วนมากไม่เคยสูบบุหรี่ มีจำนวน 189 คน
```{R}
Mode(survey$Smoke,na.rm=TRUE) #Never 189
```

7.) จากตาราง survey สรุปได้ว่าอัตราการเต้นของตัวใจนักเรียนเฉลี่ยอยู่ที่ 74.15104
```{R}
mean(survey$Pulse,na.rm=TRUE) #74.15104
```

8.) จากตาราง survey สรุปได้ว่านักเรียนหญิงที่ออกกำกายบ่อยมีอยู่ 49 คน ที่ออกกำลังกายบ้างเป็นบางครั้ง 58 คน และไม่ออกกำกายเลย 11 คน
```{R}
table(survey$Exer[survey$Sex == "Female"]) #Freq 49 None 11 Some 58
```


### Team: TammaKratookJit

1. ทรงสิจ สินนุรักษ์ StudentID: 63130500043
2. ธราเทพ ศิริพิศ StudentID: 63130500055
3. ธัญกร แถลงดี StudentID: 63130500056
4. ธีระเดช ปานคล้าย StudentID: 63130500061
5. นภษร พัฒนะเดชา StudentID: 63130500063
