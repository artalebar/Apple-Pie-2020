//
//  ViewController.swift
//  Apple Pie
//
//  Created by Артем Баранкевич on 07.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfMenNames = [
        "Адель",
        "Айдар",
        "Александр",
        "Алексей",
        "Альберт",
        "Амир",
        "Анатолий",
        "Андрей",
        "Антон",
        "Арсен",
        "Арсений",
        "Артём",
        "Артемий",
        "Артур",
        "Богдан",
        "Борис",
        "Вадим",
        "Валерий",
        "Василий",
        "Виктор",
        "Виталий",
        "Влад",
        "Владимир",
        "Владислав",
        "Всеволод",
        "Вячеслав",
        "Георгий",
        "Герман",
        "Глеб",
        "Гордей",
        "Григорий",
        "Давид",
        "Дамир",
        "Даниил",
        "Данил",
        "Данила",
        "Даниэль",
        "Демид",
        "Денис",
        "Дмитрий",
        "Евгений",
        "Егор",
        "Елисей",
        "Захар",
        "Иван",
        "Игнат",
        "Игорь",
        "Ильдар",
        "Илья",
        "Кирилл",
        "Константин",
        "Лев",
        "Леонид",
        "Макар",
        "Максим",
        "Марат",
        "Марк",
        "Марсель",
        "Матвей",
        "Мирон",
        "Мирослав",
        "Михаил",
        "Назар",
        "Никита",
        "Николай",
        "Одиссей",
        "Олег",
        "Павел",
        "Петр",
        "Платон",
        "Радмир",
        "Рамиль",
        "Ринат",
        "Роберт",
        "Родион",
        "Роман",
        "Ростислав",
        "Руслан",
        "Рустам",
        "Савва",
        "Савелий",
        "Самир",
        "Святогор",
        "Святослав",
        "Семен",
        "Сергей",
        "Станислав",
        "Степан",
        "Тамерлан",
        "Тимофей",
        "Тимур",
        "Тихон",
        "Федор",
        "Филипп",
        "Эдуард",
        "Эмиль",
        "Юрий",
        "Ян",
        "Яромир",
        "Ярослав",
    ]
    var totalLosses = 0
    var totalWins = 0
    
    // MARK: - Methods
    func newRound() {
        let newWord = listOfMenNames.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateCorrectWordLabel() {
        var displayWord = [String]()
        for letter in  currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: "  ")
    }
    
    func updateUI() {
        let movesRemaining  = currentGame.incorrectMovesRemaining
        
        //пример тернарного оператора с множеством условий
        //let imageNumber = movesRemaining < 0 ? 0 : movesRemaining < 8 ? movesRemaining : 7
        
        let imageNumber = (movesRemaining + 64) % 8
        let image = "Tree\(imageNumber)"
        treeImageView.image = UIImage(named: image)
        updateCorrectWordLabel()
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    // MARK: - IB Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateUI()
    }
    
    
}

