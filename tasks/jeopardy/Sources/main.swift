import Foundation

print("Welcome to Jeopardy on the fancy commandline!")

let io = ConsoleIO()

var shouldQuit = false

// game loop
func gameLoop() {
    
    // ask for players
    
    print("Name of Player 1:".onWhite)
    let p1name = io.getInput()
    var p1 = Player(name: p1name, points: 0)
    
    print("Name of Player 2:".onWhite)
    let p2name = io.getInput()
    var p2 = Player(name: p2name, points: 0)
    
    print("Name of Player 3:".onWhite)
    let p3name = io.getInput()
    var p3 = Player(name: p3name, points: 0)
    
    // random starting player
    let starting = Int(arc4random_uniform(3) + 1)
    
    var pSeq = [Player]();
    
    switch(starting) {
    case 1:
        pSeq.append(p1)
        pSeq.append(p2)
        pSeq.append(p3)
        break
        
    case 2:
        pSeq.append(p2)
        pSeq.append(p3)
        pSeq.append(p1)
        break
        
    case 3:
        pSeq.append(p3)
        pSeq.append(p1)
        pSeq.append(p2)
        break
        
    default: break;
    }
    
    // create questions db connection
    let questor = Questionaire()
    
    // playing 10 rounds
    for round in 1...1 {
        var c = 0
        // each round each player
        for player in pSeq {
            
            c += 1
            
            print("Round \(round), Turn Player \(player.name)".onWhite)
            
            // 1. print Categories
            let cats = questor.categories()
            
            // 2. choose category from 10 randomly chosen categories
            print(cats)
            
            print("now choose one of the Categories")
            let ucc = io.getInput()
            
            // 3. with category get all difficulties by value of question
            let cCat = cats[ Int(ucc)! ]
            
            let difficulties = questor.difficultiesForCategory(category: cCat!)
            
            print(difficulties)
            
            print("Now choose the difficulty")
            
            let ucd = io.getInput()
            let cdif = difficulties[Int(ucd)!]
            
            // 4. search a question
            print("A question is searched...")
            
            let entry = questor.getRandomQuestion(category: cCat!, value: cdif!)
            
            print("Question is: \(entry["question"].stringValue)\n\n\n\n\(entry["answer"].stringValue)")
            print("Your Answer: ")
            
            let uca = io.getInput()
            
            if uca == entry["answer"].stringValue {
                print("you are right. Earning points:")
                
                
                if c == 1 {
                    p1.points += normalizeValueEntry(valueEntry: entry["value"].stringValue!)
                }
                
                if c == 2 {
                    p2.points += normalizeValueEntry(valueEntry: entry["value"].stringValue!)
                }
                
                if c == 3 {
                    p3.points += normalizeValueEntry(valueEntry: entry["value"].stringValue!)
                }
                
            } else {
                print("oh no, you lose. Good luck next time!")
            }
            
        }
    }
    
    // rounds finished, save into leaderboard collection
    print(p1, p2, p3)
    let highestScore = [p1.points, p2.points, p3.points].max()
    
    if p1.points == highestScore {
        questor.updateLeaderboard(player: p1)
    }
    
    if p2.points == highestScore {
        questor.updateLeaderboard(player: p2)
    }

    if p3.points == highestScore {
        questor.updateLeaderboard(player: p3)
    }

    print("\n\n\n (= JEOPARDY =) \n\n\n")
}

func normalizeValueEntry(valueEntry: String) -> Int {
    let s = valueEntry.characters.split(separator: "$").map(String.init)
    return Int(s[0])!
}

// main loop
while !shouldQuit {
    
    print("\n\n\n (= JEOPARDY =) \n\n\n".red.onWhite)
    
    // main menu
    print("Choose your Options. Type one of the following:\n\n")
    print("l, leeaderboard".bold + " - to print the leaderboard\n")
    
    print("n, new".bold + " - start a new game\n")
    
    print("q, quit".bold + " - to exit this awesome jeopardy\n")
    
    switch (io.getInput()) {
        
    case "l" , "leaderboard":
        print("printing the leaderboard")
        Questionaire().printLeaderboard()
        break
    
    case "new", "n":
        print("starting new game");
        gameLoop()
        break
    
    case "quit", "q":
        print("goodbye")
        shouldQuit = true
        break
        
    default:
        print("Do not understand")
    }
}
