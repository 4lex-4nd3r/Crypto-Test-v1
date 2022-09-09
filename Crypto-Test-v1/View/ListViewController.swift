//
//  ListViewController.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import UIKit

class ListViewController : UIViewController {
   
   // MARK: - Properties
   
   
   let coins: [Coin] = [
      Coin(data: DataClass(name: "btc",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10))),
      Coin(data: DataClass(name: "eth",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10))),
      Coin(data: DataClass(name: "dot",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10))),
      Coin(data: DataClass(name: "xrp",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10))),
      Coin(data: DataClass(name: "ada",
                           marketData: MarketData(priceUsd: 100,
                                                  volumeLast24Hours: 100, percentChangeUsdLast24Hours: 100),
                           marketcap: Marketcap(rank: 1, currentMarketcapUsd: 100),
                           allTimeHigh: AllTimeHigh(price: 10)))
   ]
   
   private let tableView: UITableView = {
      let tv = UITableView()
      tv.translatesAutoresizingMaskIntoConstraints = false
      return tv
   }()
   
   private let listCell = ListCell()
   private let idListCell = "idPostsCell"
   
   
   // MARK: - Lifecycle
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupViews()
      setConstraints()
      setDelegates()
   }
   
   //MARK: - Setups
   
   private func setupViews() {
      view.backgroundColor = .systemBackground
      let logoutButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.xmark"), style: .done, target: self, action: #selector(logoutButtonTapped))
      navigationItem.leftBarButtonItem = logoutButton
      let sortButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down.square"), style: .done, target: self, action: #selector(sortButtonTapped))
      navigationItem.rightBarButtonItem = sortButton
      
      navigationItem.title = "Coins"

      view.addSubview(tableView)
      tableView.register(ListCell.self, forCellReuseIdentifier: idListCell)
   }
   
   private func setDelegates() {
      tableView.delegate = self
      tableView.dataSource = self
   }
   
   
   //MARK: - Selectors
   
   @objc private func logoutButtonTapped() {
      
      let defaults = UserDefaults.standard
      defaults.set(false, forKey: "isLogged")
      navigationController?.setViewControllers([LoginViewController()], animated: false)
   }
   
   @objc private func sortButtonTapped() {
      print("sortButtonTapped")
   }
   
   //MARK: - Constraints
   
   private func setConstraints() {
      NSLayoutConstraint.activate([
         tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
   }
}

//MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      50
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let coin = coins[indexPath.row]
      let detailVC = DetailViewController()
      detailVC.coin = coin
      navigationController?.pushViewController(detailVC, animated: true)
   }
}

//MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
   
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      coins.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: idListCell, for: indexPath) as? ListCell else { return UITableViewCell() }
      
      let coin = coins[indexPath.row]
      cell.configure(coin: coin)
      
      return cell
   }
}
