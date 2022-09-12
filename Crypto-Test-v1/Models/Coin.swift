//
//  Coin.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import Foundation

//#fixed (согласен, данные не отправляем)
//#error("можно просто декодебл протокол")

struct Coin: Decodable {
   let data: DataClass
}

struct DataClass: Decodable {
   let name: String
   let marketData: MarketData
   let marketcap: Marketcap
   let allTimeHigh: AllTimeHigh
   
   enum CodingKeys: String, CodingKey {
      case name
      case marketData = "market_data"
      case marketcap
      case allTimeHigh = "all_time_high"
   }
}

struct MarketData: Decodable {
   let priceUsd: Double
   let volumeLast24Hours: Double
   let percents: Double
   
   enum CodingKeys: String, CodingKey {
      case priceUsd = "price_usd"
      case volumeLast24Hours = "volume_last_24_hours"
      case percents = "percent_change_usd_last_24_hours"
   }
}

struct Marketcap: Decodable {
   let rank: Int
   
   enum CodingKeys: String, CodingKey {
      case rank
   }
}

struct AllTimeHigh: Decodable {
   let price: Double
}

