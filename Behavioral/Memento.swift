//
//  Memento.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

class Memento {
    let numberOfRunsScored: Int
    
    init(_ numberOfRunsScored: Int) {
        self.numberOfRunsScored = numberOfRunsScored
    }
}

class StatsHolder {
    private var numberOfRunsScored: Int
    private var history: [Memento] = []
    private var currentIndexInHistory = 0
    
    init(_ numberOfRunsScored: Int) {
        self.numberOfRunsScored = numberOfRunsScored
        history.append(Memento(numberOfRunsScored))
    }
    
    var description: String {
        return "Total Runs Scored: \(numberOfRunsScored)"
    }
    
    func addStatsToHolder(_ runsToBeAdded: Int) -> Memento {
        self.numberOfRunsScored += runsToBeAdded
        let memento = Memento(numberOfRunsScored)
        history.append(memento)
        currentIndexInHistory += 1
        return memento
    }
    
    func rollbackToPastStats(_ memento: Memento?) {
        guard let memento = memento else { return }
        
        numberOfRunsScored = memento.numberOfRunsScored
        history.append(memento)
        currentIndexInHistory = history.count - 1
    }
    
    func undo() -> Memento? {
        guard currentIndexInHistory > 0 else { return nil }
        
        currentIndexInHistory -= 1
        let memento = history[currentIndexInHistory]
        numberOfRunsScored = memento.numberOfRunsScored
        return memento
    }
    
    func redo() -> Memento? {
        guard currentIndexInHistory+1 < history.count else { return nil }
        
        currentIndexInHistory += 1
        let memento = history[currentIndexInHistory]
        numberOfRunsScored = memento.numberOfRunsScored
        return memento
    }
}

let statsHolder = StatsHolder(100)
let stat1 = statsHolder.addStatsToHolder(150)
let stat2 = statsHolder.addStatsToHolder(80)
print("1 - \(statsHolder.description)")
statsHolder.undo()
print("2 - \(statsHolder.description)")
statsHolder.undo()
print("3 - \(statsHolder.description)")
statsHolder.redo()
print("4 - \(statsHolder.description)")
