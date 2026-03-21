= 9.
#let tasks = (1, 2, 3, 7, 10, 13, 14, 15, 19)

#for task in tasks {
	include("week9/task" + str(task) + ".typ")
}
