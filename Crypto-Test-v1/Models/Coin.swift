//
//  Coin.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import Foundation

struct Coin: Codable {
   let data: DataClass
}

struct DataClass: Codable {
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

struct MarketData: Codable {
   let priceUsd: Double
   let volumeLast24Hours: Double
   let percentChangeUsdLast24Hours: Double
   
   enum CodingKeys: String, CodingKey {
      case priceUsd = "price_usd"
      case volumeLast24Hours = "volume_last_24_hours"
      case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
   }
}

struct Marketcap: Codable {
   let rank: Int
   
   enum CodingKeys: String, CodingKey {
      case rank
   }
}

struct AllTimeHigh: Codable {
   let price: Double
}

