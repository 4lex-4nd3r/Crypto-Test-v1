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
   
   var viewModel: DetailViewModelProtocol
   
   // MARK: - Lifecycle
   
//   #fixed
   required init(viewModel: DetailViewModelProtocol) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupViews()
      setConstraints()
      setValues()
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
   
   private func setValues() {
//      #fixed
      viewModel.viewModelDidChange = { viewModel in
         //код для выполнения при изменении во viewModel
      }
      nameLabel.text = viewModel.name
      priceLabel.text = viewModel.price
      changeLabel.text = viewModel.change
      athLabel.text = viewModel.ath
      volumeLabel.text = viewModel.volume
      rankLabel.text = viewModel.rank
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
