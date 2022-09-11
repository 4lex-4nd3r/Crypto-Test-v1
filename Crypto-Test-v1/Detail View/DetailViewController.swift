//
//  DetailViewController.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import UIKit

class DetailViewController : UIViewController {
   
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
   
   private let athLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private let volumeLabel: UILabel = {
      let label = UILabel()
      label.adjustsFontSizeToFitWidth = true
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private let rankLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   private var detailStack = UIStackView()
   
   weak var viewModel: DetailViewModelProtocol? {
      didSet {
         guard let viewModel = viewModel else { return }
         nameLabel.text = viewModel.name
         priceLabel.text = viewModel.price
         changeLabel.text = viewModel.change
         athLabel.text = viewModel.ath
         volumeLabel.text = viewModel.volume
         rankLabel.text = viewModel.rank
      }
   }

   
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
                                                   rankLabel])
      detailStack.axis = .vertical
      detailStack.spacing = 20
      detailStack.distribution = .fillEqually
      detailStack.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(detailStack)
   }

   //MARK: - Constraints
   
   private func setConstraints() {
      
      NSLayoutConstraint.activate([
         detailStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         detailStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
         detailStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
      ])
   }
}
