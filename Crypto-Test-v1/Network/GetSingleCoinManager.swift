//
//  GetSingleCoinManager.swift
//  Crypto-Test-v1
//
//  Created by Александр on 12.09.2022.
//

import Foundation

class GetSingleCoinManager {
   
//   #fixed
//   #error("вынеси урл отдельтно")

   let stringURL = "https://data.messari.io/api/v1/assets/"
   
   private func getCoinData(coin: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
      guard let url = URL(string: stringURL + "\(coin)/metrics") else { return }
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   
   func getCoin(coin: String,
                        completion: @escaping (Result<Coin,Error>) -> Void) {
      getCoinData(coin: coin) { data, response, error in
         //#fixed
         //#error("нет обработки")
         guard let data = data, error == nil else {
            completion(.failure(error!))
            return }
         do {
            let coin = try JSONDecoder().decode(Coin.self, from: data)
            completion(.success(coin))
         } catch let jsonError {
            completion(.failure(jsonError))
         }
      }
   }
}
