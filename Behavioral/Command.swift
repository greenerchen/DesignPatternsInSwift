//
//  Command.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol Command {
    func execute()
}

class TV {
    private var isOn: Bool = false {
        didSet {
            print("TV is \(isOn ? "on" : "off")")
        }
    }
    private var volumn: Int = 15 {
        didSet {
            print("TV volumn is \(volumn)")
        }
    }
    
    func turnOn() {
        isOn = true
    }
    
    func turnOff() {
        isOn = false
    }
    
    func volumnUp() {
        volumn += 1
    }
    
    func volumnDown() {
        volumn -= 1
    }
}

class OnCommand: Command {
    private var tv: TV
    
    init(_ tv: TV) {
        self.tv = tv
    }
    
    func execute() {
        tv.turnOn()
    }
}

class OffCommand: Command {
    private var tv: TV
    
    init(_ tv: TV) {
        self.tv = tv
    }
    
    func execute() {
        tv.turnOff()
    }
}

class VolumnUpCommand: Command {
    private var tv: TV
    
    init(_ tv: TV) {
        self.tv = tv
    }
    
    func execute() {
        tv.volumnUp()
    }
}

class VolumnDownCommand: Command {
    private var tv: TV
    
    init(_ tv: TV) {
        self.tv = tv
    }
    
    func execute() {
        tv.volumnDown()
    }
}

class RemoteControlButton {
    private var command: Command
    
    init(_ command: Command) {
        self.command = command
    }
    
    func press() {
        command.execute()
    }
}

let tv = TV()
let onCommand = OnCommand(tv)
let offCommand = OffCommand(tv)
let volUpCommand = VolumnUpCommand(tv)
let volDownCommand = VolumnDownCommand(tv)
let onButton = RemoteControlButton(onCommand)
let offButton = RemoteControlButton(offCommand)
let volUpButton = RemoteControlButton(volUpCommand)
let volDownButton = RemoteControlButton(volDownCommand)
onButton.press()
volUpButton.press()
volUpButton.press()
volDownButton.press()
volDownButton.press()
volDownButton.press()
offButton.press()
