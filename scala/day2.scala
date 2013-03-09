// day 2 scala

val names = List("sam","joe","peter")
val name_size = (0 /: names) { (sum, name) => sum + name.size }
println(name_size)