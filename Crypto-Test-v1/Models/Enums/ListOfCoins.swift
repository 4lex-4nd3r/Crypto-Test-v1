//
//  ListOfCoins.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import Foundation

//#fixed
//#error("ты правильно сделал что вынес отдельной сущностью, но лучше энумом")

//struct ListOfCoins {
//   static let coins = [
//      "btc", "eth", "tron", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"
//   ]
//}

enum ListOfCoins: String, CaseIterable {
   case btc = "btc"
   case eth = "eth"
//   case tron = "tron"
//   case polkadot = "polkadot"
//   case dogecoin = "dogecoin"
//   case tether = "tether"
//   case stellar = "stellar"
//   case cardano = "cardano"
//   case xrp = "xrp"
}
