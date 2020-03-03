//
//  ViewController.swift
//  BrainGame
//
//  Created by Lauren Dutton on 3/3/20.
//  Copyright © 2020 Lauren Dutton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var score: Int = 0
    var counter: Int = 59
    var starting: Bool = true
    var playing: Bool = false
    
    enum Color: CaseIterable {
        case red
        case orange
        case yellow
        case green
        case blue
        case purple
        case brown
        case black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordLabel.clipsToBounds = true
        colorLabel.clipsToBounds = true
        
        wordLabel.layer.cornerRadius = 10.0
        colorLabel.layer.cornerRadius = 10.0
        
        setLabels()
    }
    
    @IBAction func restartButtonTapped(_ sender: Any) {
        if starting {
            starting = false
            runTimer()
        }
        if playing {
            playing = false
        } else {
            playing = true
        }
        if timeLabel.text  == "0:00" {
            timeLabel.text = "1:00"
            playing = true
            counter = 59
            score = 0
            setLabels()
            runTimer()
        }
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        if playing && counter >= 0 {
            if colorMatches() {
                score += 10
            } else {
                score -= 10
            }
            setLabels()
        }
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        if playing && counter >= 0 {
              if colorMatches() {
                  score -= 10
              } else {
                  score += 10
              }
              setLabels()
          }
    }
    
    func runTimer() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if counter >= 10 {
            timeLabel.text = "0:\(counter)"
            counter -= 1
        } else if counter >= 0 {
            timeLabel.text = "0:0\(counter)"
            counter -= 1
        }
        
    }
    
    func setLabels() {
        setTextColors(label: wordLabel)
        setTextColors(label: colorLabel)
        scoreLabel.text = "\(score)"
    }
    
    func setTextColors(label: UILabel) {
        let color1 = randomColor()
        label.text = color1.name
        let color2 = randomColor()
        label.textColor = color2.rawValue
    }
    
    func randomColor() -> ViewController.Color {
        return Color.allCases.randomElement()!
    }
    
    func colorMatches() -> Bool {
        if let name = colorLabel.textColor.name {
            return wordLabel.text == name
        } else {
            print(colorLabel.textColor.name)
            return false
        }
    }
}


