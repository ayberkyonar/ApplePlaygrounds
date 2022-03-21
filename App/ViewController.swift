//
//  ViewController.swift
//  Jigachad
//
//  Created by SD on 07/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var currentElementIndex = 0
    
    func updateElement(){
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        answerLabel.text = "?"
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        updateElement()
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = elementList[currentElementIndex]
        state = .answer
        updateFlashCardUI()
        
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex == elementList.count{
            currentElementIndex = 0
        }
        state = .question
        updateFlashCardUI()
    }
    
    func updateFlashCardUI() {
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        
        if state == .answer {
            answerLabel.text = elementName
        } else {
            answerLabel.text = "?"
        }
    }
    
    func updateQuizUI(){
        
    }
    
    func updateUI(){
        switch mode {
        case .flashCard:
            updateFlashCardUI()
            
        case .quiz:
            updateQuizUI()
        }
    }
    
    enum Mode {
        case flashCard
        case quiz
    }
    
    var mode: Mode = .flashCard
    
    enum State {
        case question
        case answer
    }
    
    var state: State = .question
    
    
    
}

