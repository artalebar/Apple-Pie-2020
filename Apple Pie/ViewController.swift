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
    
    func updateUI() {
        let movesRemaining  = currentGame.incorrectMovesRemaining
        let image = "Tree\(movesRemaining < 8 ? movesRemaining : 7)"
        treeImageView.image = UIImage(named: image)
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    // MARK: - IB Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    
}

