//
//  ListCell.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import UIKit

class ListCell: UITableViewCell {
   
   
   // MARK: - Properties
   
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
   
   
   // MARK: - Init
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupViews()
      setConstraints()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   // MARK: - Setups
   
   private func setupViews() {
      backgroundColor = .clear
      selectionStyle = .none
     addSubview(nameLabel)
      addSubview(priceLabel)
      addSubview(changeLabel)
   }
   
   func configure(coin: Coin) {

      let name = coin.data.name
      let price = String(format: "%.2f", coin.data.marketData.priceUsd)
      let change = String(format: "%.2f", coin.data.marketData.percentChangeUsdLast24Hours)
      
      nameLabel.text = name
      priceLabel.text = price + " usd"
      changeLabel.text = change + " %"
   }
   
   // MARK: - Constraints
   
   private func setConstraints() {
      
      NSLayoutConstraint.activate([
         nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
         nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
      ])
      
      NSLayoutConstraint.activate([
         priceLabel.trailingAnchor.constraint(equalTo: changeLabel.leadingAnchor, constant: -20),
         priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
      ])
      
      NSLayoutConstraint.activate([
         changeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
         changeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
      ])
   }
}
