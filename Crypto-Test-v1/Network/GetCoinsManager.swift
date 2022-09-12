//
//  GetCoinsManager.swift
//  Crypto-Test-v1
//
//  Created by Александр on 12.09.2022.
//

import Foundation

//#fixed
//#error("у тебя этот класс обрабатывает и запросы в сеть и получение монет. Будь 2/3/10 запросов все было бы в этом класе")

class GetCoinsManager {
   
   let getSingleCoinManager = GetSingleCoinManager()
   let dispatchGroup = DispatchGroup()
   var coins = [Coin]()
   
   func getAllCoins(completion: @escaping ([Coin]) -> Void) {
//#fixed enum iteration
      ListOfCoins.allCases.forEach {
         dispatchGroup.enter()
         getSingleCoinManager.getCoin(coin: $0.rawValue) { [weak self] result in
            switch result {
            case .success(let coin):
               self?.coins.append(coin)
            case .failure(let error):
               print(error.localizedDescription)
            }
            self?.dispatchGroup.leave()
         }
      }
      dispatchGroup.notify(queue: .main) {
         completion(self.coins)
      }
   }
}
