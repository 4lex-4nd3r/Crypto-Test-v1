//
//  DetailViewModel.swift
//  Crypto-Test-v1
//
//  Created by Александр on 10.09.2022.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {

   var name: String { get }
   var price: String { get }
   var change: String { get }
   var ath: String { get }
   var volume: String { get }
   var marketcap: String { get }
   var rank: String { get }
}

class DetailViewModel: DetailViewModelProtocol {

   var coin: Coin
   
   init(coin: Coin) {
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
      let changeData = String(format: "%.2f", coin.data.marketData.percentChangeUsdLast24Hours)
      return "Changes last 24 hours - " + changeData + " %"
   }
   
   var ath: String {
      let athData = String(format: "%.2f", coin.data.allTimeHigh.price)
      return "All time hight price - " + athData + " usd"
   }
   
   var volume: String {
      let volumeData = String(format: "%.2f", coin.data.marketData.volumeLast24Hours)
      return "Trade volume last 24 hours - " + volumeData + " usd"
   }
   
   var marketcap: String {
      let marketcapData = String(format: "%.2f", coin.data.marketData.priceUsd)
      return "Market capitalization - " + marketcapData + " usd"
   }
   
   var rank: String {
      let rankData = "\(coin.data.marketcap.rank)"
      return "World rank by capitlization - " + rankData
   }
}
