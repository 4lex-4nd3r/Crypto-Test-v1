//
//  NetworkManager.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import Foundation

class NetworkManager {
   
   let dispatchGroup = DispatchGroup()
   var coins = [Coin]()
   
   private func getCoinData(coin: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
      
      let stringURL = "https://data.messari.io/api/v1/assets/\(coin)/metrics"
      guard let url = URL(string: stringURL) else { return }
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   
   private func getCoin(coin: String) {
      getCoinData(coin: coin) { [weak self] data, response, error in
         guard let data = data, error == nil, let self = self else { return }
         do {
            let coin = try JSONDecoder().decode(Coin.self, from: data)
            self.coins.append(coin)
         } catch let jsonError {
            print(jsonError.localizedDescription)
         }
         self.dispatchGroup.leave()
      }
   }
   
   func getAllCoins(completion: @escaping ([Coin]) -> Void) {
      let listOfCoins = ListOfCoins.coins
      for coin in listOfCoins {
         dispatchGroup.enter()
         getCoin(coin: coin)
      }
      
      dispatchGroup.notify(queue: .main) {
         completion(self.coins)
      }
   }
}
