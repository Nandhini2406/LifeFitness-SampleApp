//
//  HomeViewController.swift
//  SampleLifeFitness
//
//  Created by DoodleBlue on 16/06/23.
//

import UIKit

class HomeScreen : UIViewController{

    // MARK: - IBOutlets and variables
    
    var filterProuducts: [String]!
    var isSearching = false
    
    @IBOutlet weak var topImgCV: UICollectionView!
    @IBOutlet weak var bottomImgCV: UICollectionView!
    @IBOutlet weak var imgPageControl: UIPageControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        registerNIB()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Setup UI
    func setUpUI(){
        
        topImgCV.delegate = self
        topImgCV.dataSource = self
        
        bottomImgCV.delegate = self
        bottomImgCV.dataSource = self
        bottomImgCV.collectionViewLayout = UICollectionViewFlowLayout()
        
        filterProuducts = productNames
        self.searchBar.delegate = self
        
        self.view.addSubview(topImgCV)
        self.view.addSubview(bottomImgCV)
    }
    
    func registerNIB(){
        
        topImgCV.register(UINib(nibName: "topImgCell", bundle: nil), forCellWithReuseIdentifier: "topImgCell")
        bottomImgCV.register(UINib(nibName: "bottomImgCell", bundle: nil), forCellWithReuseIdentifier: "bottomImgCell")
    }
}

// MARK: - CollectionView Methods

extension HomeScreen: UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topImgCV {
                return 4
        } else if isSearching {
            return filterProuducts.count
        }
        return productNames.count
        }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.topImgCV {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "topImgCell", for: indexPath) as? topImgCell
                return cellA!
            }

            else {
                let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomImgCell", for: indexPath) as? bottomImgCell
                if isSearching{
                    cellB?.productNameLbl.text = filterProuducts[indexPath.item]
                }else {
                    cellB?.productNameLbl.text = productNames[indexPath.item]
                }
              
                cellB?.serialNumberLbl.text = serialNo[indexPath.item]
                cellB?.validDateLbl.text = validDate[indexPath.item]
                return cellB!
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = bottomImgCV.bounds.width
        let cellWidth = (collectionViewWidth - 20) / 2
        
//        let cellHeight = bottomImgCV.bounds.height
//        let cellWidth = (collectionViewWidth - 120)
        
        return CGSize(width: cellWidth , height: 310)

    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.imgPageControl.currentPage = indexPath.row
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: uicollectionelem, withReuseIdentifier: serachBar, for: indexPath)
//        return searchView
//    }
}


// MARK: - SearchBar Delegates

extension HomeScreen: UISearchBarDelegate{
    
    func searchBar(_  searchBar: UISearchBar, textDidChange searchText: String){
        
        filterProuducts = productNames.filter({$0.lowercased().contains(searchText.lowercased())})
        isSearching = !searchText.isEmpty
        self.bottomImgCV.reloadData()
    }
}
    

