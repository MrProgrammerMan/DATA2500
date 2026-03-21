= 6.
#let tasks = (1, 2, 4, 7, 8, 9, 11, 14, 15, 21)

#for task in tasks {
	include("week6/task" + str(task) + ".typ")
}
