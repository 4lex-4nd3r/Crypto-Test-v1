//
//  ListViewController.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import UIKit

class CoinsViewController : UIViewController {
   
   // MARK: - Properties
   
   private let tableView: UITableView = {
      let tv = UITableView()
      tv.translatesAutoresizingMaskIntoConstraints = false
      return tv
   }()
   
   private let activity: UIActivityIndicatorView = {
      let act = UIActivityIndicatorView()
      act.translatesAutoresizingMaskIntoConstraints = false
      act.startAnimating()
      return act
   }()
   
   private let coinCell = CoinCell()
   private let idCoinCell = "idCoinCell"
   
//   #fixed
   private var viewModel: CoinsViewModelProtocol! {
      didSet {
         viewModel.viewModelDidChange = { [weak self] viewModel in
            print("viewModelDidChange")
            guard let self = self else { return }
            self.tableView.reloadData()
         }
         
         viewModel.getCoins { [weak self] in
            guard let self = self else { return }
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
         }
      }
   }
   
   // MARK: - Lifecycle
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupViews()
      setConstraints()
      setDelegates()
      viewModel = CoinsViewModel()
   }
   
   //MARK: - Setups
   
   private func setupViews() {
      view.backgroundColor = .systemBackground
      let logoutButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.xmark"), style: .done, target: self, action: #selector(logoutButtonTapped))
      let sortButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down.square"), style: .done, target: self, action: #selector(sortButtonTapped))
      navigationItem.leftBarButtonItem = logoutButton
      navigationItem.rightBarButtonItem = sortButton
      navigationItem.title = "Coins"
      view.addSubview(tableView)
      tableView.register(CoinCell.self, forCellReuseIdentifier: idCoinCell)
      view.addSubview(activity)
   }
   
   private func setDelegates() {
      tableView.delegate = self
      tableView.dataSource = self
   }
//   #fixed - монеты загружаем сразу в классе CoinsViewModel
//   private func loadCoins() {
////      let getCoinsManager = GetCoinsManager()
////      getCoinsManager.getAllCoins { [weak self] coins in
////         guard let self = self else { return }
////         self.activity.stopAnimating()
////         self.activity.isHidden = true
////         self.viewModel = CoinsViewModel(coins: coins)
////         self.tableView.reloadData()
////      }
//   }
   
   
   //MARK: - Selectors
   
   @objc private func logoutButtonTapped() {
      
// #fixed
//      let defaults = UserDefaults.standard
//      defaults.set(false, forKey: "isLogged")
      UserDefaults.standard.set(Login.notLogin.rawValue, forKey: UserDefaultsKeys.loginKey.rawValue)
      navigationController?.setViewControllers([LoginViewController()], animated: false)
   }
   
   @objc private func sortButtonTapped() {
      viewModel.sortByPercents()
   }
   
   //MARK: - Constraints
   
   private func setConstraints() {
      
      NSLayoutConstraint.activate([
         activity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         activity.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ])
      
      NSLayoutConstraint.activate([
         tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
   }
}

//MARK: - UITableViewDelegate

extension CoinsViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      50
   }
   
   //MARK: - to fix
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
//       #error("лучше используй явную иньекцию. Те передавай viewModel через инициализатор ВК")
//      let detailVC = DetailViewController()
//      detailVC.viewModel = viewModel?.detailViewModel(for: indexPath)
      
// #fixed
      let viewModel = viewModel.detailViewModel(for: indexPath)
      let detailVC = DetailViewController(viewModel: viewModel)
      navigationController?.pushViewController(detailVC, animated: true)
   }
}

//MARK: - UITableViewDataSource

extension CoinsViewController: UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      viewModel.numberOfRows()
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: idCoinCell, for: indexPath) as? CoinCell else { return UITableViewCell() }

      cell.viewModel = viewModel.cellViewModel(for: indexPath)
      return cell
   }
}
