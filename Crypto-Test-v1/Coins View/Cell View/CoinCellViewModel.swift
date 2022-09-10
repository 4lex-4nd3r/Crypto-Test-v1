//
//  CoinCellViewModel.swift
//  Crypto-Test-v1
//
//  Created by Александр on 10.09.2022.
//

import Foundation

protocol CoinCellViewModelProtocol: AnyObject {
   
   var name: String { get }
   var price: String { get }
   var change: String { get }
}

class CoinCellViewModel: CoinCellViewModelProtocol {

   private var coin: Coin
   
   init(coin: Coin) {
      self.coin = coin
   }
   
   var name: String {
      coin.data.name
   }
   
   var price: String {
      String(format: "%.2f", coin.data.marketData.priceUsd) + " usd"
   }
   
   var change: String {
      String(format: "%.2f", coin.data.marketData.percentChangeUsdLast24Hours) + " %"
   }
}
