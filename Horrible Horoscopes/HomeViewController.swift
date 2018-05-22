//
//  HomeViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever & Tyler Crago on 4/11/18.
//  Copyright © 2018 Sawyer Clever & Tyler Crago. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var zodiacCollectionView: UICollectionView!
    @IBOutlet weak var errorLabel: UILabel!
        
    //String that handles checking for a zodiac selection
    var selection:String?
    var polarity:Int?
    
    //Array that holds the names of the zodiac signs
    let sign = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
    //Array that holds the images of the zodiac signs
    let signImage: [UIImage] = [
        UIImage(named: "aries")!,
        UIImage(named: "taurus")!,
        UIImage(named: "gemini")!,
        UIImage(named: "cancer")!,
        UIImage(named: "leo")!,
        UIImage(named: "virgo")!,
        UIImage(named: "libra")!,
        UIImage(named: "scorpio")!,
        UIImage(named: "sagittarius")!,
        UIImage(named: "capricorn")!,
        UIImage(named: "aquarius")!,
        UIImage(named: "pisces")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the zodiac collection view data source and delegate to itself
        zodiacCollectionView.dataSource = self
        zodiacCollectionView.delegate = self
        
        //Set initial value of the error label to a blank string
        errorLabel.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Gets the amount of cells to display in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sign.count
    }
    
    //Displays the sign label and sign image for each cell counted in the previous method
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.signLabel.text = sign[indexPath.item]
        cell.signImageView.image = signImage[indexPath.item]
        
        return cell
    }
    
    //Handles selection of an item within the zodiac sign collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
        selectedCell?.layer.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 0.3).cgColor
        selectedCell?.layer.cornerRadius = 10
        
        //Assigns the selected sign and retrieves the polarity from the zodiac sign
        errorLabel.text = nil
        selection = sign[indexPath.item]
        getPolarity()
    }
    
    //Handles the deselection of an item within the zodiac sign collection view
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectedCell = collectionView.cellForItem(at: indexPath)
        deselectedCell?.layer.backgroundColor = .none
        deselectedCell?.layer.cornerRadius = 0
    }
    
    //Makes sure that a zodiac sign is selected before advancing to the questionnaire
    @IBAction func nextPressed(_ sender: Any) {
        if selection != nil {
            errorLabel.text = nil
            performSegue(withIdentifier: "homeToQuestion", sender: self)
        } else {
            errorLabel.text = "Please select a sign to continue."
        }
    }
    
    //Divides the zodiac signs into two categories according to their polarity
    func getPolarity() {
        switch(selection!) {
        case "Aries", "Leo", "Sagittarius", "Gemini", "Libra", "Aquarius":
            polarity = 1
            break;
        case "Taurus", "Virgo", "Capricorn", "Cancer", "Scorpio" ,"Pisces":
            polarity = 2
            break;
        default:
            polarity = 0
            break;
        }
    }
    
    //Creates an unwinding segue for both exiting the help menu and trying again
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }
    
    //Sends the initial zodiac sign selection and polarity to the question view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuestionViewController {
            destination.zodiacSelection = selection
            destination.polarity = polarity
        }
    }
    
}

