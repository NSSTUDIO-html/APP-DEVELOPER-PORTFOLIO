fun main() {
    val features = listOf("Expense Tracker","News Reader","Chat","Recipe Search","Translator","Music Player","Social Feed")
    val expenses = mutableListOf<Double>()
    val messages = mutableListOf<String>()
    val news = listOf("Kotlin 1.9 Released!","SmartSuite Launched!","Jetpack Tips")
    val recipes = mutableListOf<String>()
    var running = true

    while (running) {
        println("\nSmartSuite Menu:")
        features.forEachIndexed { i, f -> println("${i+1}. $f") }
        println("0. Exit")
        print("Choose option: ")
        when(readLine()?.toIntOrNull()) {
            1 -> {
                print("Enter expense amount: ")
                val amt = readLine()?.toDoubleOrNull()
                if (amt != null) {
                    expenses.add(amt)
                    println("Expenses: $expenses | Total: ${expenses.sum()}")
                }
            }
            2 -> news.forEach { println(it) }
            3 -> {
                print("Enter message: ")
                val msg = readLine() ?: ""
                messages.add(msg)
                println("Messages: $messages")
            }
            4 -> {
                print("Enter dish name: ")
                val dish = readLine() ?: ""
                recipes.clear()
                recipes.addAll(listOf("$dish Special","Easy $dish Recipe","$dish Deluxe"))
                println("Recipes: $recipes")
            }
            5 -> {
                print("Enter text: ")
                val txt = readLine() ?: ""
                println("Translated (mock): ${txt.uppercase()}")
            }
            6 -> {
                val tracks = listOf("Kotlin Beats","Compose Jam","SmartSuite Theme")
                println("Tracks: $tracks")
                println("Playing: ${tracks.first()}")
            }
            7 -> println("Social Feed: User1: SmartSuite is amazing! | User2: Love this app!")
            0 -> running = false
            else -> println("Invalid option!")
        }
    }
    println("SmartSuite Closed.")
}