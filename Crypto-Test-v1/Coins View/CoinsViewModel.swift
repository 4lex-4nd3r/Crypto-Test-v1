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
   var coins: [Coin] { get }
}

class CoinsViewModel: CoinsViewModelProtocol {
   
   
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
   
   let coins: [Coin] = [
      Coin(data: DataClass(name: "btc",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10))),
      Coin(data: DataClass(name: "eth",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10))),
      Coin(data: DataClass(name: "dot",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10))),
      Coin(data: DataClass(name: "xrp",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10))),
      Coin(data: DataClass(name: "ada",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10)))
   ]
   
   
   
}
