//
//  Observer.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

import Foundation

protocol Observer {
    var identifier: String { get set }
    func propertyDidUpdate(propertyName: String, property: Any?)
}

protocol Subject {
    func register(observer: Observer)
    func unregister(observer: Observer)
    func notify()
}

class ClockTimer: Subject, Equatable {
    private var identifier: String
    private var observers: [Observer] = []
    private var hour: Int = 0
    private var minute: Int = 0
    private var second: Int = 0
    private var timer: Timer?
    
    init(_ date: Date) {
        identifier = String(date.timeIntervalSince1970)
        setTime(date)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [unowned self] (_) in
            self.tick()
        })
    }
    
    func setTime(_ date: Date) {
        let calendar = Calendar.current
        self.hour = calendar.component(.hour, from: date)
        self.minute = calendar.component(.minute, from: date)
        self.second = calendar.component(.second, from: date)
    }
    
    func getHour() -> Int {
        return hour
    }
    
    func getMinute() -> Int {
        return minute
    }
    
    func getSecond() -> Int {
        return second
    }
    
    func tick() {
        setTime(Date())
        notify()
    }
    
    func register(observer: Observer) {
        observers.append(observer)
    }
    
    func unregister(observer: Observer) {
        var idx = 0
        for i in 0..<observers.count {
            if observers[i].identifier == observer.identifier {
                idx = i
                break
            }
        }
        observers.remove(at: idx)
    }
    
    func notify() {
        for observer in observers {
            observer.propertyDidUpdate(propertyName: "Current time", property: self)
        }
    }
    
    static func ==(lhs: ClockTimer, rhs: ClockTimer) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

class DigitalClock: Observer {
    var identifier: String
    private var timer: ClockTimer
    
    init(_ timer: ClockTimer) {
        let date = Date()
        identifier = String(date.timeIntervalSince1970)
        self.timer = timer
        self.timer.register(observer: self)
    }
    
    deinit {
        timer.unregister(observer: self)
    }
    
    func draw() {
        let hour = timer.getHour()
        let minute = timer.getMinute()
        let second = timer.getSecond()
        print(String(format: "%02d:%02d:%02d", hour, minute, second))
    }
    
    func propertyDidUpdate(propertyName: String, property: Any?) {
        if let property = property as? ClockTimer, property == timer {
            draw()
        }
    }
}

let timer = ClockTimer(Date())
let digitalClock = DigitalClock(timer)
