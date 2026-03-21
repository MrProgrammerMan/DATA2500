= 5.
#let tasks = (1, 2, 4, 5, 7, 14, 20, 21, 22, 23, 27, 29, 32, 36)

#for task in tasks {
	include("week5/task" + str(task) + ".typ")
}
