= 10.
#let tasks = (1, 2, 3, 5, 6, 8, 9)

#for task in tasks {
	include("week10/task" + str(task) + ".typ")
}
