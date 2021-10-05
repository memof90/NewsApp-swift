//
//  AnimeViewController.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//


import UIKit


class TopStoriesViewController: UIViewController, UISearchBarDelegate {
    
//    MARK: - Variables Global
        var topStories = [TopStoriesViewModel]()
        var bookList : BookListsViewModel?
    //   MARK: - SearchBar Message to the data not appareance
        fileprivate let searchController = UISearchController(searchResultsController: nil)
        fileprivate let enterSearchTermLabel: UILabel = {
                let label = UILabel()
                label.text  = "Please enter your movie Search"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResponse()
        fetchListBooks()
        
    }
    
    //    MARK: - setupSearchBar
        fileprivate func setupSearchBar() {
            definesPresentationContext = true
            navigationItem.searchController = self.searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.delegate = self
        }
    
    func fetchResponse() {
        NetworkServicesModel.shared.fetchTopstories { resp, error in
            
            self.topStories = resp.map({return TopStoriesViewModel(top: $0)})

//            self.topStories.forEach{print($0)}
            

            
        }
    }
    
    func fetchListBooks() {
        NetworkServicesModel.shared.fetchListBooks { resp, error in
          
            self.bookList = resp.map({ return BookListsViewModel(book: $0)})
           
        
    
            
        }
    }
    
//    MARK: - IBAction
    
    @IBAction func searchActionBtn(_ sender: Any) {
        setupSearchBar()
    }
    
}
