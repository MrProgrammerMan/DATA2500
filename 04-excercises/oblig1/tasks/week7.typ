= 7.
#let tasks = (1, 2, 5, 7, 9, 10, 12, 17, 19)

#for task in tasks {
	include("week7/task" + str(task) + ".typ")
}
