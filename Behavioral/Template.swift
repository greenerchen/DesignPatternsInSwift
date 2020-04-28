//
//  Template.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

enum PlayerType: String {
    case catcher = "Catcher"
    case infielder = "Infielder"
    case outfielder = "Outfielder"
    case startingPitcher = "Starting Pitcher"
    case reliefPitcher = "Relief Pitcher"
    case backupCatcher = "Backup Catcher"
    case backupInfielder = "Backup Infielder"
    case backupOutfielder = "Backup Outfielder"
    case pinchHitter = "Pinch Hitter"
    case manager = "Manager"
}

struct Player {
    var name: String
    var number: Int
    var _type: PlayerType
}

protocol BaseballTeamTemplate {
    func buildTeam()
    func pickCatchers()
    func pickInfielder()
    func pickOutfielder()
    func pickStartingPitcher()
    func pickReliefPitcher()
    func pickBackupCatcher()
    func pickBackupInfielder()
    func pickBackupOutfielder()
    func pickPinchHitter()
    func pickManager()
}

protocol ListTeamStrategy {
    func list(players: [Player])
}

class ListNumberNameByCategory: ListTeamStrategy {
    func list(players: [Player]) {
        var categories: [PlayerType:[Player]] = [:]
        for p in players {
            if categories[p._type] != nil {
                categories[p._type]?.append(p)
            } else {
                categories[p._type] = [p]
            }
        }
        
        for (category, players) in categories {
            print(category.rawValue + "s: ")
            for p in players {
                print("\(p.number): \(p.name)")
            }
        }
    }
}

class Yankees2020Spring: BaseballTeamTemplate {
    private var catchers: [Player] = []
    private var infielders: [Player] = []
    private var outfielders: [Player] = []
    private var pitchers: [Player] = []
    private var others: [Player] = []
    private var manager: [Player] = []
    private var listStrategy: ListTeamStrategy = ListNumberNameByCategory()
    
    func buildTeam() {
        pickCatchers()
        pickInfielder()
        pickOutfielder()
        pickStartingPitcher()
        pickReliefPitcher()
        pickBackupCatcher()
        pickBackupInfielder()
        pickBackupOutfielder()
        pickPinchHitter()
        pickManager()
    }
    
    func listTeam() {
        let players = catchers + infielders + outfielders + pitchers + others + manager
        listStrategy.list(players: players)
    }
    
    func pickCatchers() {
        catchers.append(Player(name: "Kyle Higashioka", number: 66, _type: .catcher))
    }
    
    func pickInfielder() {
        infielders.append(Player(name: "Miguel Andújar", number: 41, _type: .infielder))
        infielders.append(Player(name: "Thairo Estrada", number: 71, _type: .infielder))
        infielders.append(Player(name: "Mike Ford", number: 72, _type: .infielder))
        infielders.append(Player(name: "DJ LeMahieu", number: 26, _type: .infielder))
    }
    
    func pickOutfielder() {
        outfielders.append(Player(name: "Estevan Florial", number: 90, _type: .outfielder))
        outfielders.append(Player(name: "Clint Frazier", number: 77, _type: .outfielder))
        outfielders.append(Player(name: "Brett Gardner", number: 11, _type: .outfielder))
    }
    
    func pickStartingPitcher() {
        pitchers.append(Player(name: "Albert Abreu", number: 84, _type: .startingPitcher))
        pitchers.append(Player(name: "Zack Britton", number: 53, _type: .startingPitcher))
        pitchers.append(Player(name: "Luis Cessa", number: 85, _type: .startingPitcher))
        pitchers.append(Player(name: "Aroldis Chapman", number: 54, _type: .startingPitcher))
        pitchers.append(Player(name: "Gerrit Cole", number: 45, _type: .startingPitcher))
    }
    
    func pickReliefPitcher() {
        pitchers.append(Player(name: "Deivi García", number: 83, _type: .reliefPitcher))
        pitchers.append(Player(name: "Luis Gil", number: 81, _type: .reliefPitcher))
        pitchers.append(Player(name: "Chad Green", number: 57, _type: .reliefPitcher))
        pitchers.append(Player(name: "J. A. Happ", number: 33, _type: .reliefPitcher))
        pitchers.append(Player(name: "Ben Heller", number: 61, _type: .reliefPitcher))
        pitchers.append(Player(name: "Jonathan Holder", number: 56, _type: .reliefPitcher))
    }
    
    func pickBackupCatcher() {
        catchers.append(Player(name: "Gary Sánchez", number: 24, _type: .backupCatcher))
    }
    
    func pickBackupInfielder() {
        infielders.append(Player(name: "Gleyber Torres", number: 25, _type: .backupInfielder))
        infielders.append(Player(name: "Gio Urshela", number: 29, _type: .backupInfielder))
    }
    
    func pickBackupOutfielder() {
        outfielders.append(Player(name: "Aaron Hicks", number: 31, _type: .backupOutfielder))
        outfielders.append(Player(name: "Aaron Judge", number: 99, _type: .backupOutfielder))
    }
    
    func pickPinchHitter() {
        others.append(Player(name: "James Paxton", number: 65, _type: .pinchHitter))
    }
    
    func pickManager() {
        manager.append(Player(name: "Aaron Boone", number: 17, _type: .manager))
    }
}

let yankees = Yankees2020Spring()
yankees.buildTeam()
yankees.listTeam()
