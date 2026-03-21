= 4.
#let tasks = (1, 2, 3, 4, 5, 9, 10, 11, 13, 15, 24, 28, 33)

#for task in tasks {
	include("week4/task" + str(task) + ".typ")
}
