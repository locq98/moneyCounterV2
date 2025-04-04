//
//  ViewController.swift
//  moneyCounterV2
//
//  Created by Ярослав Строков on 03.04.2025.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let textTotatlRevenue = UILabel()
    let textSeconds = UILabel()
    let textMintutes = UILabel()
    let textHours = UILabel()
    let textDays = UILabel()
    let textWeeks = UILabel()
    let total = UILabel()
    let incomeTextField = UITextField()
    let buttonCalculate = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textTotatlRevenue.text = "Мой доход - 0 рублей"
        textTotatlRevenue.textColor = .systemGray
        textTotatlRevenue.frame = CGRect(x: 100, y: 50, width: 200, height: 50)
        
        incomeTextField.delegate = self
        let screenWidth = UIScreen.main.bounds.width
        let leftPadding = screenWidth * 0.1
        incomeTextField.placeholder = "Введите доход"
        incomeTextField.borderStyle = .roundedRect
        incomeTextField.frame = CGRect(x: leftPadding, y: 150, width: 200, height: 50)
        incomeTextField.keyboardType = .numberPad
        incomeTextField.layer.cornerRadius = 40
        
        buttonCalculate.setTitle("Рассчитать", for: .normal)
        buttonCalculate.backgroundColor = .systemBlue
        buttonCalculate.frame = CGRect(x: leftPadding, y: 250, width: 200, height: 50)
        buttonCalculate.layer.cornerRadius = 20
        buttonCalculate.addTarget(self, action: #selector(calculateIncome), for: .touchUpInside)
        
        textSeconds.text = "Second summary"
        textSeconds.textColor = .systemGray
        textSeconds.font = .systemFont(ofSize: 22)
        textSeconds.frame = CGRect(x: leftPadding, y: 700, width: 200, height: 50)
        
        textMintutes.text = "Second summary"
        textMintutes.textColor = .systemGray
        textMintutes.font = .systemFont(ofSize: 22)
        textMintutes.frame = CGRect(x: leftPadding, y: 650, width: 200, height: 50)
        
        textHours.text = "Second summary"
        textHours.textColor = .systemGray
        textHours.font = .systemFont(ofSize: 22)
        textHours.frame = CGRect(x: leftPadding, y: 600, width: 200, height: 50)
        
        textDays.text = "Second summary"
        textDays.textColor = .systemGray
        textDays.font = .systemFont(ofSize: 22)
        textDays.frame = CGRect(x: leftPadding, y: 550, width: 200, height: 50)
        
        textWeeks.text = "Second summary"
        textWeeks.textColor = .systemGray
        textWeeks.font = .systemFont(ofSize: 22)
        textWeeks.frame = CGRect(x: leftPadding, y: 500, width: 200, height: 50)
        
        total.text = "Total:"
        total.textColor = .systemGray
        total.font = .systemFont(ofSize: 22)
        total.frame = CGRect(x: leftPadding, y: 450, width: 200, height: 50)
        
        view.addSubview(textTotatlRevenue)
        view.addSubview(incomeTextField)
        view.addSubview(buttonCalculate)
        view.addSubview(textSeconds)
        view.addSubview(textMintutes)
        view.addSubview(textHours)
        view.addSubview(textDays)
        view.addSubview(textWeeks)
        view.addSubview(total)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        return string.rangeOfCharacter(from: allowedCharacters) != nil || string.isEmpty
                    
}

    @objc func calculateIncome() {
        UIView.animate(withDuration: 0.1, animations: {
            self.buttonCalculate.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.buttonCalculate.transform = CGAffineTransform.identity
            }
        }
        if let incomeText = incomeTextField.text, let income = Double(incomeText) {
            let weeklyIncome = income / 4
            let roundedWeeklyIncome = String(format: "%.0f", weeklyIncome)
            let dailyIncome = income / 30
            let roundedDailyIncome = String(format: "%.2f", dailyIncome)
            let hourlyIncome = dailyIncome / 8
            let roundedHourseIncome = String(format: "%.2f", hourlyIncome)
            let minuteIncome = hourlyIncome / 60
            let roundedMinuteIncome = String(format: "%.2f", minuteIncome)
            let secondIncome = minuteIncome / 60
            let roundedSecondIncome = String(format: "%.2f", secondIncome)
            
            textTotatlRevenue.text = "Мой доход - \(roundedMinuteIncome) рублей/мин"
            if secondIncome > 1 {
                textSeconds.text = "\(roundedSecondIncome) руб/сек"
            } else {
                textSeconds.text = "\(roundedSecondIncome) коп/сек"
            }
            textMintutes.text = "\(roundedMinuteIncome) руб/мин"
            textHours.text = "\(roundedHourseIncome) руб/ч"
            textDays.text = "\(roundedDailyIncome) руб/день"
            textWeeks.text = "\(roundedWeeklyIncome) руб/неделя"
            
        }
        else {
            textTotatlRevenue.text = "Введите доход"
        }
        
        
            }
        }
    
    extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
