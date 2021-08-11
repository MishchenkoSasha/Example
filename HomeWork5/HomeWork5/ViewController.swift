//
//  ViewController.swift
//  HomeWork5
//
//  Created by ALIAKSANDR MISHCHANKA on 10.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInfoLabel: UILabel!
    @IBOutlet weak var beerAddShopButton: UIButton!
    @IBOutlet weak var beerClientButton: UIButton!
    @IBOutlet weak var closeBarButton: UIButton!
    @IBOutlet weak var printStatisticsBeerButton: UIButton!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        }
    @IBAction func beerAddShopActionButton() {
        BeerBar.shared.beerAddShop(value: Beer.zhigulevskoeBeer())
        textInfoLabel.text = Beer.beerInfo(Beer.zhigulevskoeBeer())()
        }
    
    @IBAction func beerClientActionButton() {
        if BeerBar.shared.beerClient() == true {
        textInfoLabel.text = Beer.beerInfo(Beer.zhigulevskoeBeer())()
        } else {
        textInfoLabel.text = "Пива нет"
        }
    }
    @IBAction func closeBarActionButton() {
        textInfoLabel.text = "Бар закрыт"
}
    @IBAction func printStatisticsBeerLabel() {
        textInfoLabel.text = BeerBar.printStatisticsBeer(BeerBar.shared)()
    }
}
    
    
    class Beer {
        var beerName: String
        var beerCountry: String
        var beerPrice: Double
        var beerSize: Double
        
        init(beerName: String, beerCountry: String, beerPrice: Double, beerSize: Double) {
            self.beerName = beerName
            self.beerCountry = beerCountry
            self.beerPrice = beerPrice
            self.beerSize = beerSize
            
        
    }
    func beerInfo () -> String {
        return ("Пиво! \n Название пива: \(beerName) \n Страна происхождения: \(beerCountry) \n Цена: \(beerPrice) \n Объем бутылки: \(beerSize) \n")
    }
    static func heiniekenBeer () -> Beer {
        let heinieken = Beer (beerName: "Heinieken", beerCountry: "Германия", beerPrice: 2.5, beerSize: 0.5)
        return heinieken
}

    static func zhigulevskoeBeer () -> Beer {
        let zhigulevskoe = Beer (beerName: "Жигулевское", beerCountry: "Россия", beerPrice: 1.0, beerSize: 1.5)
        return zhigulevskoe
    }
    }



    class BeerBar {
        var arrayBeer: ([Beer]) = []
        static let shared: BeerBar = BeerBar()
        
        private init() {
            self.arrayBeer = []
        }
        
        func beerAddShop(value: Beer) {
            arrayBeer.append(value)
        }
        func beerClient() -> Bool {
            if arrayBeer.count > 0 {
                arrayBeer.removeLast()
                return true
            } else {
                return false
            }
            func closeBar() {
                arrayBeer.removeAll()
            }
        func printStatisticsBeer() -> String {
            var statistics: String = ""
            for value in arrayBeer {
                statistics += "\n \(value.beerInfo())"
                }
                return statistics
            }
    }
    }
