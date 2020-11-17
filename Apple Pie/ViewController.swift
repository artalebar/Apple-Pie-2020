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
    @IBOutlet weak var genderChange: UISegmentedControl!
    @IBOutlet weak var nameForHelp: UILabel!
    
    // MARK: - Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    let listOfMenNames = [
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
        "Ярослав"
    ].shuffled()
    let listOfWomenNames = [
        "Агата",
        "Аделина",
        "Александра",
        "Алёна",
        "Алина",
        "Алиса",
        "Алия",
        "Алла",
        "Альбина",
        "Амалия",
        "Амелия",
        "Амина",
        "Анастасия",
        "Ангелина",
        "Анжелика",
        "Анна",
        "Антонина",
        "Ариана",
        "Арина",
        "Валентина",
        "Валерия",
        "Варвара",
        "Василина",
        "Василиса",
        "Вера",
        "Вероника",
        "Виктория",
        "Виолетта",
        "Виталина",
        "Влада",
        "Владислава",
        "Галина",
        "Дарина",
        "Дарья",
        "Диана",
        "Ева",
        "Евгения",
        "Екатерина",
        "Елена",
        "Елизавета",
        "Есения",
        "Жанна",
        "Зарина",
        "Злата",
        "Инна",
        "Ирина",
        "Камилла",
        "Карина",
        "Каролина",
        "Кира",
        "Кристина",
        "Ксения",
        "Лариса",
        "Лиана",
        "Лидия",
        "Лилия",
        "Любовь",
        "Людмила",
        "Мадина",
        "Майя",
        "Маргарита",
        "Марина",
        "Мария",
        "Марьяна",
        "Мелания",
        "Милана",
        "Милена",
        "Мирослава",
        "Надежда",
        "Наталия",
        "Наталья",
        "Наташа",
        "Нелли",
        "Ника",
        "Нина",
        "Оксана",
        "Олеся",
        "Ольга",
        "Полина",
        "Регина",
        "Самира",
        "Светлана",
        "Снежана",
        "София",
        "Софья",
        "Стефания",
        "Таисия",
        "Тамара",
        "Татьяна",
        "Ульяна",
        "Эвелина",
        "Элина",
        "Эльвира",
        "Эльмира",
        "Эмилия",
        "Юлиана",
        "Юлия",
        "Яна",
        "Ярослава",
        "Ясмина",
    ].shuffled()
    var listOfWords = [" "]
    var totalLosses = 0 {
        didSet {
            newRound()
            genderChange.isEnabled = true
        }
    }
    var totalWins = 0 {
        didSet {
            newRound()
            genderChange.isEnabled = true
        }
    }
    var countOfRounds = 0
    
    // MARK: - Methods
    func enableButtons(_ enable: Bool = true) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func newRound() {
        guard !listOfWords.isEmpty else {
            enableButtons(false)
            updateUI()
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        enableButtons()
        nameForHelp.text = "Угадай слово"
        countOfRounds += 1
    }
    
    func updateCorrectWordLabel() {
        var displayWord = [String]()
        for letter in  currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: "  ")
    }
    
    func updateState() {
        if currentGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
        } else if currentGame.guessedWord == currentGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func updateUI() {
        let movesRemaining  = currentGame.incorrectMovesRemaining
        
        //пример тернарного оператора с множеством условий
        //let imageNumber = movesRemaining < 0 ? 0 : movesRemaining < 8 ? movesRemaining : 7
        
        let imageNumber = (movesRemaining + 64) % 8
        let image = "Tree\(imageNumber)"
        treeImageView.image = UIImage(named: image)
        updateCorrectWordLabel()
        scoreLabel.text = "Побед: \(totalWins)    Поражений: \(totalLosses)    Раундов: \(countOfRounds)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfWords = listOfMenNames
        newRound()
    }
    
    // MARK: - IB Actions
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        genderChange.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateState()
    }
    
    
    @IBAction func changeGenderName(_ sender: UISegmentedControl) {
        listOfWords = sender.selectedSegmentIndex < 1 ? listOfMenNames.shuffled() : listOfWomenNames.shuffled()
        newRound()
    }
    
    @IBAction func resetRound() {
        newRound()
        genderChange.isEnabled = true
    }
    
    @IBAction func showWord() {
        nameForHelp.text = currentGame.word
    }
}

