//
//  Mediator.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

import Foundation

protocol Command {
    func displayStatus()
}

protocol RemoteUmpire {
    func registerTVDisplay(tvDisplay: TVDisplay)
    func registerTVOperator(tvOperator: TVOperator)
    func isDecisionMade() -> Bool
    func setDecisionStatus(status: Bool)
}

class TVDisplay: Command {
    private var tvUmpire: RemoteUmpire
    
    init(_ tvUmpire: TVUmpire) {
        self.tvUmpire = tvUmpire
    }
    
    func displayStatus() {
        if tvUmpire.isDecisionMade() {
            print("Decision made and the batter is out")
        } else {
            print("Dicision pending")
        }
    }
    
    func getReady() {
        print("Ready to display decision")
    }
}

class TVOperator: Command {
    private var tvUmpire: RemoteUmpire
    
    init(_ tvUmpire: TVUmpire) {
        self.tvUmpire = tvUmpire
    }
    
    func displayStatus() {
        if tvUmpire.isDecisionMade() {
            print("Decision made and permission granted to display the decision on TV Display")
        } else {
            print("Dicision pending")
        }
    }
}

class TVUmpire: RemoteUmpire { // Mediator
    private var tvOperator: TVOperator?
    private var tvDisplay: TVDisplay?
    private var decisionMade: Bool?
    
    func registerTVDisplay(tvDisplay: TVDisplay) {
        self.tvDisplay = tvDisplay
    }
    
    func registerTVOperator(tvOperator: TVOperator) {
        self.tvOperator = tvOperator
    }
    
    func isDecisionMade() -> Bool {
        return decisionMade!
    }
    
    func setDecisionStatus(status: Bool) {
        decisionMade = status
        tvOperator?.displayStatus()
        tvDisplay?.displayStatus()
    }
}

let tvUmpire = TVUmpire()
let tvDisplay = TVDisplay(tvUmpire)
let tvOperator = TVOperator(tvUmpire)
tvUmpire.registerTVDisplay(tvDisplay: tvDisplay)
tvUmpire.registerTVOperator(tvOperator: tvOperator)
tvDisplay.getReady()
tvUmpire.setDecisionStatus(status: true)
