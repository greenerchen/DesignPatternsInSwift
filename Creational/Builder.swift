//
//  Builder.swift
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

class BaseballTeam {
    private var catchers: [Player] = []
    private var infielders: [Player] = []
    private var outfielders: [Player] = []
    private var pitchers: [Player] = []
    private var others: [Player] = []
    private var manager: [Player] = []
    private var listStrategy: ListTeamStrategy = ListNumberNameByCategory()
    
    init(catchers: [Player], infielders: [Player], outfielders: [Player], pitchers: [Player], others: [Player], manager: [Player]) {
        self.catchers = catchers
        self.infielders = infielders
        self.outfielders = outfielders
        self.pitchers = pitchers
        self.others = others
        self.manager = manager
    }
    
    func listTeam() {
        let players = catchers + infielders + outfielders + pitchers + others + manager
        listStrategy.list(players: players)
    }
}

class BaseballTeamBuilder {
    private var catchers: [Player] = []
    private var infielders: [Player] = []
    private var outfielders: [Player] = []
    private var pitchers: [Player] = []
    private var others: [Player] = []
    private var manager: [Player] = []
    
    func addCatcher(_ player: Player) {
        catchers.append(player)
    }
    
    func addInfielder(_ player: Player) {
        infielders.append(player)
    }
    
    func addOutfielder(_ player: Player) {
        outfielders.append(player)
    }
    
    func addStartingPitcher(_ player: Player) {
        pitchers.append(player)
    }
    
    func addReliefPitcher(_ player: Player) {
        pitchers.append(player)
    }
    
    func addBackupCatcher(_ player: Player) {
        catchers.append(player)
    }
    
    func addBackupInfielder(_ player: Player) {
        infielders.append(player)
    }
    
    func addBackupOutfielder(_ player: Player) {
        outfielders.append(player)
    }
    
    func addPinchHitter(_ player: Player) {
        others.append(player)
    }
    
    func addManager(_ player: Player) {
        manager.append(player)
    }
    
    func makeTeam() -> BaseballTeam {
        return BaseballTeam(catchers: catchers, infielders: infielders, outfielders: outfielders, pitchers: pitchers, others: others, manager: manager)
    }
}


let teamBuilder = BaseballTeamBuilder()
teamBuilder.addCatcher(Player(name: "Kyle Higashioka", number: 66, _type: .catcher))
teamBuilder.addInfielder(Player(name: "Miguel Andújar", number: 41, _type: .infielder))
teamBuilder.addInfielder(Player(name: "Thairo Estrada", number: 71, _type: .infielder))
teamBuilder.addInfielder(Player(name: "Mike Ford", number: 72, _type: .infielder))
teamBuilder.addInfielder(Player(name: "DJ LeMahieu", number: 26, _type: .infielder))
teamBuilder.addOutfielder(Player(name: "Estevan Florial", number: 90, _type: .outfielder))
teamBuilder.addOutfielder(Player(name: "Clint Frazier", number: 77, _type: .outfielder))
teamBuilder.addOutfielder(Player(name: "Brett Gardner", number: 11, _type: .outfielder))
teamBuilder.addStartingPitcher(Player(name: "Albert Abreu", number: 84, _type: .startingPitcher))
teamBuilder.addStartingPitcher(Player(name: "Zack Britton", number: 53, _type: .startingPitcher))
teamBuilder.addStartingPitcher(Player(name: "Luis Cessa", number: 85, _type: .startingPitcher))
teamBuilder.addStartingPitcher(Player(name: "Aroldis Chapman", number: 54, _type: .startingPitcher))
teamBuilder.addStartingPitcher(Player(name: "Gerrit Cole", number: 45, _type: .startingPitcher))
teamBuilder.addReliefPitcher(Player(name: "Deivi García", number: 83, _type: .reliefPitcher))
teamBuilder.addReliefPitcher(Player(name: "Luis Gil", number: 81, _type: .reliefPitcher))
teamBuilder.addReliefPitcher(Player(name: "Chad Green", number: 57, _type: .reliefPitcher))
teamBuilder.addReliefPitcher(Player(name: "J. A. Happ", number: 33, _type: .reliefPitcher))
teamBuilder.addReliefPitcher(Player(name: "Ben Heller", number: 61, _type: .reliefPitcher))
teamBuilder.addReliefPitcher(Player(name: "Jonathan Holder", number: 56, _type: .reliefPitcher))
teamBuilder.addBackupCatcher(Player(name: "Gary Sánchez", number: 24, _type: .backupCatcher))
teamBuilder.addBackupInfielder(Player(name: "Gleyber Torres", number: 25, _type: .backupInfielder))
teamBuilder.addBackupInfielder(Player(name: "Gio Urshela", number: 29, _type: .backupInfielder))
teamBuilder.addBackupOutfielder(Player(name: "Aaron Hicks", number: 31, _type: .backupOutfielder))
teamBuilder.addBackupOutfielder(Player(name: "Aaron Judge", number: 99, _type: .backupOutfielder))
teamBuilder.addPinchHitter(Player(name: "James Paxton", number: 65, _type: .pinchHitter))
teamBuilder.addManager(Player(name: "Aaron Boone", number: 17, _type: .manager))

let yankees2020Spring = teamBuilder.makeTeam()
yankees2020Spring.listTeam()
    
