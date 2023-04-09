//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answersResult: [Answer]!
    private var animals: [Animal] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        getDefinition()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getAnimals() -> [Animal] {
        for answer in answersResult {
            animals.append(answer.animal)
        }  
        return animals
    }
    private func getDefinition() {
        var animalsCount: [Animal: Int] = [
            .dog: animals.filter { $0 == .dog }.count,
            .turtle: animals.filter { $0 == .turtle }.count,
            .rabbit: animals.filter { $0 == .rabbit }.count,
            .cat: animals.filter { $0 == .cat }.count
        ]
        let frequentAnswersSorted = animalsCount.sorted(by: {
            (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultLabel.text = "Вы - \(mostCommonAnswer.rawValue)"
        descriptionLabel.text = mostCommonAnswer.definition
        }
  
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
