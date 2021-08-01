//
//  ViewController.swift
//  lesson4
//
//  Created by ALIAKSANDR MISHCHANKA on 28.07.2021.
//Владислав Штыцко, [29 июля 2021 г., 14:04:53]:
//Домашнее задание. Создать массив из кортежей, первый элемент в котором будет Int, а второй String. Нужно возвести все числа в квадрат, затем отфильтровать и оставить только четные числа, а в конце отсортировать по увеличению строк. То есть начальный массив кортежей должен выглядеть так
//[(1,"x"), (3,"z"), (2, "y"), (4, "a")]
//А в результате должно получиться так:
//[(16, "a"), (4, "y")]

//И сделайте это все как функцию, которая принимает параметр и возвращает значение

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        let numberArray: [(number: Int, text: String)] = [(1,"x"), (3,"z"), (2, "y"), (4, "a")]
        var numberArraySquare = numberArray.map { (number: Int, text: String) in
            return ((number * number), text)
            
        }
        print (numberArraySquare)
        
        numberArraySquare.sort { firstElement, secondElement in
            return secondElement.0 < firstElement.0
        
        }
        
        let numberArraySquareFilter = numberArraySquare.filter { (number: Int, text: String) in
            return number % 2 == 0
        
            }
            print (numberArraySquareFilter)
        
    }
    
    
}
        
    
        
        
       
