= 3.
#let tasks = (1, 2, 3, 13, 14, 15, 16, 17, 19, 22)

#for task in tasks {
	include("week3/task" + str(task) + ".typ")
}
