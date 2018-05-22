//
//  QuestionViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever & Tyler Crago on 4/13/18.
//  Copyright © 2018 Sawyer Clever & Tyler Crago. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
        
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    @IBOutlet weak var answerEButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    //Integer that is used to advance questions
    var status = 0
    
    //Integer that handles checking for a user response
    var response:Int?
    
    //Holds value of initial zodiac selection
    var zodiacSelection:String?
    var polarity:Int?
    
    //Holds the value for the totals of each category for calculation
    var death = 0, work = 0, finance = 0, happiness = 0, love = 0
    
    //Multidimensional array to hold question label as well as the associated question
    let question = [
        ["Question 1", "Which would you have for lunch on a typical day?"],
        ["Question 2", "In high school, you would have described yourself as:"],
        ["Question 3", "If you were one of these animals, which would you be?"],
        ["Question 4", "In your car, what would you be listening to?"],
        ["Question 5", "Which of the following jobs appeal to you the most?"]
    ]
    
    //Multidimensional array to hold answers by their category
    let answer = [
        ["Fast Food", "Emo or Punk", "Cat", "Metal", "Doctor"],
        ["Just a Coffee", "Geek or Nerd", "Beaver", "EDM", "Lawyer"],
        ["Something Homemade", "Preppy", "Lion", "Rap", "Sports Player"],
        ["Sweets/Junk Food", "Free Spirit", "Dog", "Pop", "Fashion Designer"],
        ["Whatever My Friends Want", "Flirt", "Elephant", "Country", "Actor/Actress"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets initial question properties
        questionNumberLabel.text = question[0][0]
        questionLabel.text = question[0][1]
        
        //Set initial answer properties
        answerAButton.setTitle(answer[0][0], for: .normal)
        answerAButton.layer.cornerRadius = 25
        answerBButton.setTitle(answer[1][0], for: .normal)
        answerBButton.layer.cornerRadius = 25
        answerCButton.setTitle(answer[2][0], for: .normal)
        answerCButton.layer.cornerRadius = 25
        answerDButton.setTitle(answer[3][0], for: .normal)
        answerDButton.layer.cornerRadius = 25
        answerEButton.setTitle(answer[4][0], for: .normal)
        answerEButton.layer.cornerRadius = 25
        
        //Set initial value of the error label to a blank string
        errorLabel.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Used to select a single button
    func buttonSelect(btn: UIButton) {
        btn.layer.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 0.3).cgColor
    }
    
    //Used to deselect buttons when changing a previously selected answer
    func buttonDeselect(btn1: UIButton, btn2: UIButton, btn3: UIButton, btn4: UIButton) {
        btn1.layer.backgroundColor = UIColor.white.cgColor
        btn2.layer.backgroundColor = UIColor.white.cgColor
        btn3.layer.backgroundColor = UIColor.white.cgColor
        btn4.layer.backgroundColor = UIColor.white.cgColor
    }
    
    //Used to deselect all buttons upon advancing to a new question
    func resetPreviousButtonSelection(btn1: UIButton, btn2: UIButton, btn3: UIButton, btn4: UIButton, btn5: UIButton) {
        btn1.layer.backgroundColor = UIColor.white.cgColor
        btn2.layer.backgroundColor = UIColor.white.cgColor
        btn3.layer.backgroundColor = UIColor.white.cgColor
        btn4.layer.backgroundColor = UIColor.white.cgColor
        btn5.layer.backgroundColor = UIColor.white.cgColor
    }
    
    //Handles the action of clicking Answer A
    @IBAction func selectedA(_ sender: Any) {
        buttonSelect(btn: answerAButton)
        buttonDeselect(btn1: answerBButton!, btn2: answerCButton!, btn3: answerDButton!, btn4: answerEButton!)
        response = 1
        errorLabel.text = nil
    }
    
    //Handles the action of clicking Answer B
    @IBAction func selectedB(_ sender: Any) {
        buttonSelect(btn: answerBButton)
        buttonDeselect(btn1: answerAButton!, btn2: answerCButton!, btn3: answerDButton!, btn4: answerEButton!)
        response = 2
        errorLabel.text = nil
    }
    
    //Handles the action of clicking Answer C
    @IBAction func selectedC(_ sender: Any) {
        buttonSelect(btn: answerCButton)
        buttonDeselect(btn1: answerAButton!, btn2: answerBButton!, btn3: answerDButton!, btn4: answerEButton!)
        response = 3
        errorLabel.text = nil
    }
    
    //Handles the action of clicking Answer D
    @IBAction func selectedD(_ sender: Any) {
        buttonSelect(btn: answerDButton)
        buttonDeselect(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerEButton!)
        response = 4
        errorLabel.text = nil
    }
    
    //Handles the action of clicking Answer E
    @IBAction func selectedE(_ sender: Any) {
        buttonSelect(btn: answerEButton)
        buttonDeselect(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!)
        response = 5
        errorLabel.text = nil
    }
    
    //Handles the action of clicking the next button
    @IBAction func nextPressed(_ sender: Any) {
        //Makes sure that an answer is selected before advancing questions
        if response != nil {
            //Checks the status variable to further advance questions, set properties, and store answers
            switch(status) {
                case 0:
                    resetPreviousButtonSelection(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!, btn5: answerEButton!)
                    questionNumberLabel.text = question[1][0]
                    questionLabel.text = question[1][1]
                    prepareForNextQuestion()
                    break;
                case 1:
                    resetPreviousButtonSelection(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!, btn5: answerEButton!)
                    questionNumberLabel.text = question[2][0]
                    questionLabel.text = question[2][1]
                    prepareForNextQuestion()
                    break;
                case 2:
                    resetPreviousButtonSelection(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!, btn5: answerEButton!)
                    questionNumberLabel.text = question[3][0]
                    questionLabel.text = question[3][1]
                    prepareForNextQuestion()
                    break;
                case 3:
                    resetPreviousButtonSelection(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!, btn5: answerEButton!)
                    questionNumberLabel.text = question[4][0]
                    questionLabel.text = question[4][1]
                    prepareForNextQuestion()
                    break;
                case 4:
                    calcCategory(response: response!)
                    performSegue(withIdentifier: "questionToResult", sender: self)
                    break;
                default:
                    break;
            }
        } else {
            errorLabel.text = "Please select an answer to continue."
        }
    }
    
    //Determines which category to classify the response as
    func calcCategory(response:Int) {
        switch(response) {
            case 1:
                death += 1
                break;
            case 2:
                work += 1
                break;
            case 3:
                finance += 1
                break;
            case 4:
                happiness += 1
                break;
            case 5:
                love += 1
                break;
            default:
                //For development purposes only
                print("Error encountered while calculating category.")
                break;
        }
    }
    
    //Prepares answer labels, adds 1 to category selection, and resets response for the next question
    func prepareForNextQuestion() {
        answerAButton.setTitle(answer[0][status+1], for: .normal)
        answerBButton.setTitle(answer[1][status+1], for: .normal)
        answerCButton.setTitle(answer[2][status+1], for: .normal)
        answerDButton.setTitle(answer[3][status+1], for: .normal)
        answerEButton.setTitle(answer[4][status+1], for: .normal)
        calcCategory(response: response!)
        status += 1
        response = nil
    }
    
    //Sends the initial zodiac sign selection and answer selections to the result view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultViewController {
            destination.zodiacSelection = zodiacSelection
            destination.polarity = polarity
            destination.death = death
            destination.work = work
            destination.finance = finance
            destination.happiness = happiness
            destination.love = love
        }
    }

}
