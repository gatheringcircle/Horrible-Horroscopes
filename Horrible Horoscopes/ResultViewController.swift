//
//  ResultViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever & Tyler Crago on 4/13/18.
//  Copyright © 2018 Sawyer Clever & Tyler Crago. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var horoscopeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    //Holds the value for the totals of each category to be replaced when the segue from the previous scene
    var death = 0, work = 0, finance = 0, happiness = 0, love = 0
    
    //Holds value of initial zodiac selection and polarity
    var zodiacSelection:String?
    var polarity:Int?
    
    //Holds the category for the horoscope types
    let category = ["Your Category: Death", "Your Category: Work", "Your Category: Finance", "Your Category: Happiness", "Your Category: Love"]
    
    //Holds the horoscopes for zodiac signs with the polarity of 1
    let horoscopesOne = [
        "Appreciate the small things in your life. The birds chirping, the flowers blooming, all of it. For your end is near. Soon you will know nothing but eternal blackness.",
        "Have an important project due? A deadline creeping up on you? Well stop working now because you are guaranteed to fail at your next important task.",
        "Financial stability is something you've always been looking for. Maybe you should just give up now. Soon the air you breathe will leave you choking with debt. You will forget what legal tender feels like.",
        "Your lifelong dreams will be fulfilled. All will be at peace and leave you at total satisfaction. Then everything you have will be taken from you. You will never know happiness again. So savor it while it lasts.",
        "Love someone or something? Well, that person or object of your affection will soon forget that you even exist. You will be replaced by someone who is better than you in every way imaginable."
    ]
    
    //Holds the horoscopes for zodiac signs with the polarity of 2
    let horoscopesTwo = [
        "The world bright and green will be engulfed in the scorching fires of nuclear war. Everything will be destroyed but you will remain... All alone.",
        "If you have employment, do not take it for granted. If you are looking for a job, you should stop looking. Your employment will soon be terminated or your job search will yield no results. Hopefully your parents didn't already turn your old room into storage.",
        "Out on the streets is where you will find everything you have been wanting to know about yourself. But be hopeful that your passerbys are charitable in their donations as your next meal solely depends on it.",
        "You love the feeling of delight and pure bliss. Cherish it because whatever brings you joy in this world will sooon cease to be fulfilling to you. Gloom and doom is all you will know. You will forget what happiness feels like.",
        "Friends and family are of high importance to you and have always held you to the same standards. The people who have long cared for you will now turn their backs on you. People who were once your enemy will still be your enemies. Loneliness is a word you will finally learn the true meaning of."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gets the user associated zodiac sign image and name for display
        signImageView.image = UIImage(named: zodiacSelection!.lowercased())
        signLabel.text = zodiacSelection
        
        //Calls the function to determine the text for the horoscope label
        getCategory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Uses polarity value and calculates the horoscope for the user based upon the number of selected inputs per category
    //Priority Order: Love => Happiness => Finance => Work => Death
    func getCategory() {
        if polarity == 1 {
            if love >= happiness && love >= finance && love >= work && love >= death {
                categoryLabel.text = category[4]
                horoscopeLabel.text = horoscopesOne[4]
            } else if happiness >= love && happiness >= finance && happiness >= work && happiness >= death {
                categoryLabel.text = category[3]
                horoscopeLabel.text = horoscopesOne[3]
            } else if finance >= love && finance >= happiness && finance >= work && finance >= death {
                categoryLabel.text = category[2]
                horoscopeLabel.text = horoscopesOne[2]
            } else if work >= love && work >= happiness && work >= finance && work >= death {
                categoryLabel.text = category[1]
                horoscopeLabel.text = horoscopesOne[1]
            } else {
                categoryLabel.text = category[0]
                horoscopeLabel.text = horoscopesOne[0]
            }
        } else if polarity == 2 {
            if love >= happiness && love >= finance && love >= work && love >= death {
                categoryLabel.text = category[4]
                horoscopeLabel.text = horoscopesTwo[4]
            } else if happiness >= love && happiness >= finance && happiness >= work && happiness >= death {
                categoryLabel.text = category[4]
                horoscopeLabel.text = horoscopesTwo[3]
            } else if finance >= love && finance >= happiness && finance >= work && finance >= death {
                categoryLabel.text = category[2]
                horoscopeLabel.text = horoscopesTwo[2]
            } else if work >= love && work >= happiness && work >= finance && work >= death {
                categoryLabel.text = category[1]
                horoscopeLabel.text = horoscopesTwo[1]
            } else {
                categoryLabel.text = category[0]
                horoscopeLabel.text = horoscopesTwo[0]
            }
        } else {
            horoscopeLabel.text = "Error."
        }
    }
    
}
