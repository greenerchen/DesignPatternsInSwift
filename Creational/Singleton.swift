//
//  Singleton.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

class BaseballTeamManager {
    static let shared = BaseballTeamManager()
    
    private init() {
        // init here
    }
}

let manager = BaseballTeamManager.shared
