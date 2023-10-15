//
//  ServiceReportScreen.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 04/07/23.
//

import UIKit

class ServiceReportScreen: UIViewController, UISearchBarDelegate {
    
    var filterData: [String]!
    var isSearching = false
    
    @IBOutlet weak var serRepTableView: UITableView!
    @IBAction func backToServiceCallBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func openSearchBarBtnAction(_ sender: Any) {
        
      let searchController = UISearchController(searchResultsController: nil)

            searchController.hidesNavigationBarDuringPresentation = false
            searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBar(_  searchBar: UISearchBar, textDidChange searchText: String){
        
        filterData = reportNumber.filter({$0.lowercased().contains(searchText.lowercased())})
        isSearching = !searchText.isEmpty
        self.serRepTableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        filterData = reportNumber
        
    }
    
    func setUpUI(){
        serRepTableView.register(UINib(nibName: "ServiceReportTVCell", bundle: nil), forCellReuseIdentifier: "ServiceReportTVCell")
        serRepTableView.delegate = self
        serRepTableView.dataSource = self
        
    }
}

// MARK: - TableView Methods

extension ServiceReportScreen: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return filterData.count
        }
        return reportNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceReportTVCell", for: indexPath) as? ServiceReportTVCell
        if isSearching{
            cell?.reportNumberLbl.text = filterData[indexPath.row]
        }else{
            cell?.reportNumberLbl.text = reportNumber[indexPath.row]
        }
        cell?.dateLbl.text = serviceCallDate[indexPath.row]
        cell?.serviceCallNumberLbl.text = serviceCallNo[indexPath.row]
        
        cell?.serviceEngineerNameLbl.text = serviceEngineerName[indexPath.row]
        return cell!
    }
    
}
