#NBA Data Prep

curry = read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
iguodala = read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green = read.csv("../data/graymond-green.csv", stringsAsFactors = FALSE)
durant = read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson = read.csv("../data/klay-thopmson.csv", stringsAsFactors = FALSE)

curry$name = rep("Stephen Curry", times = nrow(curry))
iguodala$name = rep("Andre Iguodala", times = nrow(iguodala))
green$name = rep("Draymond Green", times = nrow(green))
durant$name = rep("Kevin Durant", times = nrow(durant))
thompson$name = rep("Klay Thompson", times = nrow(thompson))

curry$shot_made_flag[curry$shot_made_flag == "y"] = "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] = "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] = "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] = "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] = "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] = "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] = "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] = "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] = "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] = "shot_no"

curry$minute = (curry$period)*12 - curry$minutes_remaining
iguodala$minute = (iguodala$period)*12 - iguodala$minutes_remaining
green$minute = (green$period)*12 - green$minutes_remaining
durant$mintue = (durant$period)*12 - durant$minutes_remaining
thompson$mintue = (thompson$period)*12 - thompson$minutes_remaining

sink("../output/stephen-curry-summary.txt")
print(summary(curry))
sink()
sink("../output/andre-iguodala-summary.txt")
print(summary(iguodala))
sink()
sink("../output/draymond-green-summary.txt")
print(summary(green))
sink()
sink("../output/kevin-durant-summary.txt")
print(summary(durant))
sink()
sink("../output/klay-thopmson-summary.txt")
print(summary(thompson))
sink()

shot-data = rbind(curry, iguodala, green, durant, thompson)
write.csv(shot-data, file = "../data/shots-data.csv")

sink("../output/shots-data-summary.txt")
print(summary(shot-data))
sink()


