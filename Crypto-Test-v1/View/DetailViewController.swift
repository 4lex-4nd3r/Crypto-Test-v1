//
//  DetailViewController.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import UIKit

class DetailViewController : UIViewController {
   
   // MARK: - Properties
   
   var coin: Coin? {
      didSet {
         setupLabels()
      }
   }
   
   private let nameLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private let priceLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private let changeLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private let athLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private let volumeLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private let marketcapLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private let rankLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private var detailStack = UIStackView()

   
   // MARK: - Lifecycle
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupViews()
      setConstraints()
   }
   
   //MARK: - Setups
   
   private func setupViews() {
      view.backgroundColor = .systemBackground
      
      detailStack = UIStackView(arrangedSubviews: [nameLabel,
                                                   priceLabel,
                                                   changeLabel,
                                                   athLabel,
                                                   volumeLabel,
                                                   marketcapLabel,
                                                   rankLabel])
      detailStack.axis = .vertical
      detailStack.spacing = 20
      detailStack.distribution = .fillEqually
      detailStack.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(detailStack)
   }
   
   private func setupLabels() {
      
      guard let coin = coin else { return }
      
      let name = coin.data.name
      let price = String(format: "%.2f", coin.data.marketData.priceUsd)
      let change = String(format: "%.2f", coin.data.marketData.percentChangeUsdLast24Hours)
      let ath = String(format: "%.2f", coin.data.allTimeHigh.price)
      let volume = String(format: "%.2f", coin.data.marketData.volumeLast24Hours)
      let marketcap = String(format: "%.2f", coin.data.marketData.priceUsd)
      let rank = coin.data.marketcap.rank
      
      nameLabel.text = name
      priceLabel.text = "Price today - " + price + " usd"
      changeLabel.text = "Changes last 24 hours - " + change + " %"
      athLabel.text = "All time hight price - " + ath + " usd"
      volumeLabel.text = "Trade volume last 24 hours - " + volume + " usd"
      marketcapLabel.text = "Market capitalization - " + marketcap + " usd"
      rankLabel.text = "World rank by capitlization - " + "\(rank)"

   }
   
   //MARK: - Selectors
   
   
   //MARK: - Constraints
   
   private func setConstraints() {
      
      NSLayoutConstraint.activate([
         detailStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         detailStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
         detailStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
      ])
   }
}
