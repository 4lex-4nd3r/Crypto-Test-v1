//
//  DetailViewModel.swift
//  Crypto-Test-v1
//
//  Created by Александр on 10.09.2022.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
   
   init(coin: Coin)

   var name: String { get }
   var price: String { get }
   var change: String { get }
   var ath: String { get }
   var volume: String { get }
   var rank: String { get }
   
   //#fixed - callback на случай если будет взаимодействие с элементами на экране
   var viewModelDidChange: ((DetailViewModelProtocol) -> Void)? { get set }
}

class DetailViewModel: DetailViewModelProtocol {
   
   var viewModelDidChange: ((DetailViewModelProtocol) -> Void)?
      
//   #fixed
   private var coin: Coin 
   
   required init(coin: Coin) {
      self.coin = coin
   }
   
   var name: String {
      return coin.data.name
   }
   
   var price: String {
      let priceData = String(format: "%.2f", coin.data.marketData.priceUsd)
      return "Price today - " + priceData + " usd"
   }
   
   var change: String {
      let changeData = String(format: "%.2f", coin.data.marketData.percents)
      return "Changes last 24 hours - " + changeData + " %"
   }
   
   var ath: String {
      let athData = String(format: "%.2f", coin.data.allTimeHigh.price)
      return "All time hight price - " + athData + " usd"
   }
   
   var volume: String {
      let volumeData = String(format: "%.2f", (coin.data.marketData.volumeLast24Hours / 1000000))
      return "Trade volume last 24 hours - " + volumeData + " mln usd"
   }
   
   var rank: String {
      let rankData = "\(coin.data.marketcap.rank)"
      return "World rank by capitlization - " + rankData
   }
}
