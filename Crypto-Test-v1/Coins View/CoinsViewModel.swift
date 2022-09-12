//
//  ListViewViewModel.swift
//  Crypto-Test-v1
//
//  Created by Александр on 10.09.2022.
//

import Foundation

protocol CoinsViewModelProtocol {
   
   var coins: [Coin] { get }
   var viewModelDidChange: ((CoinsViewModelProtocol) -> Void)? { get set }
   
   func getCoins(completion: @escaping () -> Void)
   func numberOfRows() -> Int
   func cellViewModel(for indexPath: IndexPath) -> CoinCellViewModelProtocol
   func detailViewModel(for indexPath: IndexPath) -> DetailViewModelProtocol
   func sortByPercents()
}

class CoinsViewModel: CoinsViewModelProtocol {

   var coins: [Coin] = []
   
   var viewModelDidChange: ((CoinsViewModelProtocol) -> Void)?
   
   func getCoins(completion: @escaping () -> Void) {
      let getCoinsManager = GetCoinsManager()
      getCoinsManager.getAllCoins { [weak self] coins in
         guard let self = self else { return }
         self.coins = coins
         completion()
      }
   }
   
   func numberOfRows() -> Int {
      coins.count
   }

   func cellViewModel(for indexPath: IndexPath) -> CoinCellViewModelProtocol {
      let coin = coins[indexPath.row]
      return CoinCellViewModel(coin: coin)
   }
   
   func detailViewModel(for indexPath: IndexPath) -> DetailViewModelProtocol {
      let coin = coins[indexPath.row]
      return DetailViewModel(coin: coin)
   }
   
   private var isUpToDown: Bool = true
   
   func sortByPercents() {
   
//      if isUpToDown {
//         let sortedCoins = coins.sorted { $0.data.marketData.percentChangeUsdLast24Hours > $1.data.marketData.percentChangeUsdLast24Hours }
//         coins = sortedCoins
//         isUpToDown.toggle()
//      } else {
//         let sortedCoins = coins.sorted { $0.data.marketData.percentChangeUsdLast24Hours < $1.data.marketData.percentChangeUsdLast24Hours }
//         coins = sortedCoins
//         isUpToDown.toggle()
//      }
      
//#error("у тебя оба блока одинаковые, за исключением знака </> подумай как можно проще сделать")
      //#fixed - плюс обновление tableview через callback
      
      let sortedCoins = coins.sorted { $0.data.marketData.percents > $1.data.marketData.percents }
      coins = isUpToDown ? sortedCoins : sortedCoins.reversed()
      isUpToDown.toggle()
      viewModelDidChange?(self)
   }
}
