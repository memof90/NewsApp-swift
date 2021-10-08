//
//  AnimeViewController.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//


import UIKit
import Kingfisher


class TopStoriesViewController: UIViewController, UISearchBarDelegate{

    
    
//    MARK: - Variables Global
//        ViewDidModelTopStories
        var topStoriesViewModel = [TopStoriesViewModel]()
//    varible to save data to execute filter in the search
        var filteredDataTop : [TopStoriesViewModel] = []
//     Varible to filter data when filter and when not filter
        var filter = false
//    Varible to ViewModelBooklist
        var allBooksViewModel = [BookListsViewModel]()
        
    //   MARK: - SearchBar Message to the data not appareance
        fileprivate let searchController = UISearchController(searchResultsController: nil)
        fileprivate let enterSearchTermLabel: UILabel = {
                let label = UILabel()
                label.text  = "Please enter your search"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
//     MARK: - UILabel message  TO RESULTS  value Nil
    fileprivate let notResults: UILabel = {
        let label = UILabel()
        label.text = "Not reuslts"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
//    MARK: - IBoutlets
    
    @IBOutlet weak var TopStoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var BooksCollectionView: UICollectionView!
    
    @IBOutlet weak var activityIndicatorTop: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NetworkServices Fuctions
        fetchTopStories()
        fetchListBooks()
    
        
//        TopStoriesCollectionView Protocols
        TopStoriesCollectionView.delegate = self
        TopStoriesCollectionView.dataSource = self
        
//       BooksCollectionView Protocols
        BooksCollectionView.delegate = self
        BooksCollectionView.dataSource = self
        
//        Register NibsCells
        registerNibsCells()
               
//        present search animation
        TopStoriesCollectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
//        activity indicator when te data loading
        activityIndicatorTop.startAnimating()
        activityIndicatorTop.isHidden = false
        
    }
    
//    MARK: - Fuctions
    //    MARK: - setupSearchBar
        fileprivate func setupSearchBar() {
            definesPresentationContext = true
            navigationItem.searchController = self.searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.delegate = self
        }
    
    // MARK: - filter data to search and array
    ///   variable to timer
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         print(searchText)

        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.filterContentForSearchText(searchText: searchText)
            DispatchQueue.main.async {
                self.TopStoriesCollectionView.reloadData()
            }
           
        })

    }
    
 
/// filter data to array to each item
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        if searchText != "" {
            filteredDataTop = topStoriesViewModel.filter { name in
                return name.title.lowercased().contains(searchText.lowercased())
            }
        } else {
            self.filteredDataTop = self.topStoriesViewModel
        }
    }
    
    
    
//    MARK: - RegisterNibsCells
    private func registerNibsCells() {
        TopStoriesCollectionView.register(UINib(nibName: TopStoriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopStoriesCollectionViewCell.identifier)
        BooksCollectionView.register(UINib(nibName: BookListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BookListCollectionViewCell.identifier)
    }
   
// MARK: - NetWorkServices
    ///save data to array and save data to viewModel and reload collectionView
    func fetchTopStories() {
        NetworkServicesModel.shared.fetchTopstories { resp, error in
       
                self.topStoriesViewModel = resp.map({return TopStoriesViewModel(top: $0)})
                DispatchQueue.main.async {
                self.TopStoriesCollectionView.reloadData()
                }
        }
    }
    ///save data to array and save data to viewModel and reload collectionView
    func fetchListBooks() {
        NetworkServicesModel.shared.fetchListBooks { resp, error in
          
            self.allBooksViewModel = resp.map({ return BookListsViewModel(book: $0)})
            
            DispatchQueue.main.async {
                self.BooksCollectionView.reloadData()
            }

        }
        
        
    }
    
        

    
    
    //    MARK: - Changes numberItems of cell depends of section of cell
        /// function to pass number to items depends of cells and
        /// collectionView_👉  Return collectionView numberItems
    func collectionViewNumberOfItemsInSection(_ collectionView: UICollectionView) -> Int {
        switch collectionView {
        case TopStoriesCollectionView:
            enterSearchTermLabel.isHidden = filter ? topStoriesViewModel.count != 0 : filteredDataTop.count != 0
            return filter ?  topStoriesViewModel.count : filteredDataTop.count
        case BooksCollectionView:
            return allBooksViewModel.count
        default:
            return 0
        }
    }
    
    //    MARK: - Changes NumberOfItemsInSections of cell depends of section of cell
    /// custom fuctions to pass diferents data to cell and diferents identifier
    func collectionViewcellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case TopStoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopStoriesCollectionViewCell.identifier, for: indexPath) as! TopStoriesCollectionViewCell
            cell.setupTopAnimes(top: filter ?  topStoriesViewModel[indexPath.item] : filteredDataTop[indexPath.item])
            return cell
        case BooksCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookListCollectionViewCell.identifier, for: indexPath) as! BookListCollectionViewCell
            cell.setupBooks(book:  allBooksViewModel[indexPath.item])
            activityIndicatorTop.stopAnimating()
            activityIndicatorTop.isHidden = true
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    //    MARK: - Changes NumberOfItemsInSections of cell depends of section of cell
    /// custom fuctions to pass diferents data to didSeelectItemAt

    func collectionViewDidSelectItemAt(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> () {
        switch collectionView {
        case TopStoriesCollectionView:
            let top = filter ? topStoriesViewModel[indexPath.item] : filteredDataTop[indexPath.item]
            let controller = DetailTopViewController.instance()
            controller.navigationItem.title = top.title
            controller.top = filter ? topStoriesViewModel[indexPath.item] : filteredDataTop[indexPath.item]
            navigationController?.pushViewController(controller, animated: true)
        case BooksCollectionView:
            let books = allBooksViewModel[indexPath.item]
            let controller = DetailBookController.instance()
            controller.navigationItem.title = books.title
            controller.book = allBooksViewModel[indexPath.item]
            navigationController?.pushViewController(controller, animated: true)
        default :
            return ()
        }
    }
    
//    MARK: - IBAction
    
    @IBAction func searchActionBtn(_ sender: Any) {
//            MARK: - function to see searchbar
            setupSearchBar()
    }
    
}

// MARK: - Extension to TopStories to pass Protocols numberOfItemsInSection, cellForItemAt, didSelectItemAt

extension TopStoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewNumberOfItemsInSection(collectionView)
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionViewcellForItemAt(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionViewDidSelectItemAt(collectionView, didSelectItemAt: indexPath)
    }
}
