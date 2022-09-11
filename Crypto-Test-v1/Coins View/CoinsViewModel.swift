//
//  ListViewViewModel.swift
//  Crypto-Test-v1
//
//  Created by Александр on 10.09.2022.
//

import Foundation

protocol CoinsViewModelProtocol {
   
   var numberOfRows: Int { get }
   func cellViewModel(for indexPath: IndexPath) -> CoinCellViewModelProtocol?
   func detailViewModel(for indexPath: IndexPath) -> DetailViewModelProtocol?
   func sortByPercents()
}

class CoinsViewModel: CoinsViewModelProtocol {

   private var coins: [Coin]
   
   init(coins: [Coin]) {
      self.coins = coins
   }

   func cellViewModel(for indexPath: IndexPath) -> CoinCellViewModelProtocol? {
      let coin = coins[indexPath.row]
      return CoinCellViewModel(coin: coin)
   }
   
   func detailViewModel(for indexPath: IndexPath) -> DetailViewModelProtocol? {
      let coin = coins[indexPath.row]
      return DetailViewModel(coin: coin)
   }

   var numberOfRows: Int {
      coins.count
   }
   
   private var isUpToDown: Bool = true
   
   func sortByPercents() {
      
      if isUpToDown {
         let sortedCoins = coins.sorted { $0.data.marketData.percentChangeUsdLast24Hours > $1.data.marketData.percentChangeUsdLast24Hours }
         coins = sortedCoins
         isUpToDown.toggle()
      } else {
         let sortedCoins = coins.sorted { $0.data.marketData.percentChangeUsdLast24Hours < $1.data.marketData.percentChangeUsdLast24Hours }
         coins = sortedCoins
         isUpToDown.toggle()
      }
   }
}
