//
//  Proxy.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol Coach {
    func coachTheTeam()
}

class BaseballCoach: Coach {
    func coachTheTeam() {
        print("Coach the baseballers")
    }
}

class CoachApplicant {
    var numberOfYearOfExperience: Int
    
    init(numberOfYearOfExperience: Int) {
        self.numberOfYearOfExperience = numberOfYearOfExperience
    }
}

class BaseballCoachProxy: Coach {
    private let baseballCoach = BaseballCoach()
    private let coachApplicant: CoachApplicant
    
    init(coachApplicant: CoachApplicant) {
        self.coachApplicant = coachApplicant
    }
    
    func coachTheTeam() {
        if coachApplicant.numberOfYearOfExperience > 9 {
            baseballCoach.coachTheTeam()
        } else {
            print("Not enough experience to coach the team")
        }
    }
}


let coach: Coach = BaseballCoachProxy(coachApplicant: CoachApplicant(numberOfYearOfExperience: 10))
coach.coachTheTeam()
