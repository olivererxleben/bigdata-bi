//
//  Questionaire.swift
//  jeopardy
//
//  Created by Oliver Erxleben on 11.12.16.
//
//

import Foundation
import MongoKitten
import Rainbow

class Questionaire {
    
    var db:Database!
    
    init() {
        do {
    
            let server = try Server(mongoURL: "mongodb://localhost")
            try server.connect()
            
            db = server["jeopardy"]
            
        }
        
        catch {
            print("an error occured while connectiong db".red)
        }
    }
    
    func categories() -> Dictionary<Int,String> {
        let questions = db["questions"]
        
        do {
            
            let results = try questions.distinct(onField: "category")
            
            var chosenCategories = Dictionary<Int, String>()
            
            // randomly choose 10 categories
            for index in 1...10 {
            
                let r = Int(arc4random_uniform(UInt32(results!.count)) + 1)
                let cat = results?[r].stringValue
                
                chosenCategories[index] = cat
                
            }
            
            //Int(arc4random_uniform(3) + 1)
            
            return chosenCategories
        }
        catch {
            print("error querying categories".red)
        
        }
        
        return [:]
    }
    
    func difficultiesForCategory(category: String) -> Dictionary<Int, String> {
        
        let questions = db["questions"]
        
        let query: Query = "category" == category
        
        do {
            let results = Array(try questions.find(matching: query, sortedBy: nil, projecting: ["_id": false, "value": true], skipping: nil))
            
            print(results)
            var difficulties = Dictionary<Int, String>()
            var tmp = Array<String>()
            for index in 0...results.count - 1 {
                
                
                tmp.append(results[index]["value"].stringValue!)
                
               // difficulties[index] = results[index].
            }
            
            let u = uniq(source: tmp)
            
            for index in 1...u.count - 1 {
                difficulties[index] = u[index]
            }
            
            print(difficulties)
            return difficulties
        }
        catch {
            print("error querying values".red)
        }
        
        return [:]
    }
    
    func getRandomQuestion(category: String, value: String) -> Document {
        let questions = db["questions"]
        
        let query: Query = "category" == category && "value" == value
        
        do {
            let results = Array(try questions.find(matching: query, sortedBy: nil, projecting: [ "_id": false, "question": true, "answer": true, "value": true], skipping: nil))
            
            return results[0]
            
        }
        catch {
            print("error querying for question".red)
        }
        
        return Document()
    }
    
    func updateLeaderboard(player: Player) {
        let lb = db["leaderboard"]
        
        do {
            let id = try lb.insert(["name": player.name.makeBsonValue(), "points": player.points.makeBsonValue()])
            
            print("inserted \(id.stringValue)")
        }
        catch {
            print("error inserting doc".red)
        }
    }
    
    func printLeaderboard() {
        let lb = db["leaderboard"]
        
        do {
            let results = Array(try lb.find(projecting: ["value": true, "name": true]))
            
            // sort result
            print(results)
        }
        catch {
            print("errer reading leaderbord".red)
        }
    }
    
    private func uniq<S: Sequence, E: Hashable>(source: S) -> [E] where E==S.Iterator.Element {
        var seen: [E:Bool] = [:]
        return source.filter { seen.updateValue(true, forKey: $0) == nil }
    }
    
}
