//
//  main.swift
//  Robot
//
//  Created by Vyacheslav Usikov on 26.09.2021.
//

import Foundation

var counterMove = 0

func chekPersonName(getUnrapping person: String?) -> String {
    if var name = person {
        if name == "" {
            name = "Странник"
        } else {
            return name
        }
    }
    return "Странник"
}

print("Как тебя зовут ?")

let name = readLine()
let gamer = chekPersonName(getUnrapping: name)

print("Хорошо \(gamer), перед вами поле 10 на 10... ")
print("Вы не должны выйти за рамки поля.")
print("Будте осторожны!")
print("Начнем!")
print("Выбери квадрат по Х : ")
var iWannaIntValueX = true
var xCord = 0

while iWannaIntValueX {
    
    let xCoordinate = readLine()
    
    if let xCoordinate = xCoordinate {
        if let intValue = Int(xCoordinate){
            if intValue >= 1 && intValue <= 10 {
                xCord = intValue
                iWannaIntValueX = false
            } else {
                print("Вы должны выбрать число от 1 до 10")
            }
            
        } else {
            print("Нужно ввести целое число")
        }
        
    } else {
        print("Нужно ввести значение")
    }
}
var xMove = xCord

print("Теперь выбери квадрат по Y : ")
var iWannaIntValueY = true
var yCoord = 0
while iWannaIntValueY {
    let yCoordinate = readLine()
    if let yCoordinate = yCoordinate {
        if let intValue = Int(yCoordinate) {
            if intValue >= 1 && intValue <= 10 {
                yCoord = intValue
                iWannaIntValueY = false
            } else {
                print("Вы должны выбрать число от 1 до 10")
            }
        } else {
            print("Нужно ввести целое число")
        }
    } else {
        print("Нужно ввести значение")
    }
}

var yMove = yCoord

print("Твоя начальная позиция Х = \(xCord), Y = \(yCoord)")
print("\nВыбери следующий шаг:")

var shouldShowMenu = true

while shouldShowMenu {
    print("1. \u{2192} \n2. \u{2193} \n3. \u{2191} \n4. \u{2190} \n5. Вызвать статистику \n6. Закончить игру")
    let personChoiseString = readLine()
    
    if let personChoise = personChoiseString, let personChoiseInt = Int(personChoise) {
        
        switch personChoiseInt {
        case 1: xMove += 1
            print("Позиция на на поле : Х = \(xMove)\u{2191}, Y = \(yMove)")
            if xMove > 10 {
                print("Вы вышли за рамки поля \nИгра окончена")
                shouldShowMenu = false
            }
            counterMove += 1
        case 2: yMove += 1
            print("Позиция на на поле : Х = \(xMove), Y = \(yMove)\u{2191}")
            if yMove > 10 {
                print("Вы вышли за рамки поля \nИгра окончена")
                shouldShowMenu = false
            }
            counterMove += 1
        case 3: yMove -= 1
            print("Позиция на на поле : Х = \(xMove), Y = \(yMove)\u{2193}")
            if yMove < 1 {
                print("Вы вышли за рамки поля \nИгра окончена")
                shouldShowMenu = false
            }
            counterMove += 1
        case 4: xMove -= 1
            print("Позиция на на поле : Х = \(xMove)\u{2193}, Y = \(yMove)")
            if xMove < 1 {
                print("Вы вышли за рамки поля \nИгра окончена")
                shouldShowMenu = false
            }
            counterMove += 1
        case 5: print("Пройдено шагов \(counterMove)")
            print("Позиция на на поле : Х = \(xMove), Y = \(yMove)")
            
        case 6: print("Хотите покинуть игру?")
            print("1. Да \n2. Нет")
            let yesOrNo = readLine()
            if let yesOrNo = yesOrNo , let yesOrNoInt = Int(yesOrNo){
                
                switch yesOrNoInt {
                case 1: print("Игра закончена. \nВаш счет = \(counterMove)")
                    shouldShowMenu = false
                case 2: print("Продолжим. \n Ваша позиция на поле Х = \(xMove), Y = \(yMove)")
                    break
                default: shouldShowMenu = false
                }
            }
        default: print("Не верное значение. Попробуйте снова.")
            
        }
    }
}
