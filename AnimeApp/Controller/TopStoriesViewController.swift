//
//  AnimeViewController.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//


import UIKit
import Kingfisher


class TopStoriesViewController: UIViewController, UISearchBarDelegate {
    
//    MARK: - Variables Global
        var topStories = [TopStoriesViewModel]()
        var allBooks = [BookListsViewModel]()
    //   MARK: - SearchBar Message to the data not appareance
        fileprivate let searchController = UISearchController(searchResultsController: nil)
        fileprivate let enterSearchTermLabel: UILabel = {
                let label = UILabel()
                label.text  = "Please enter your movie Search"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
    
//    MARK: - IBoutlets
    
    @IBOutlet weak var TopStoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var BooksCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResponse()
        fetchListBooks()
    
        
//        TopStoriesCollectionView
        TopStoriesCollectionView.delegate = self
        TopStoriesCollectionView.dataSource = self
        
//       BooksCollectionView
        BooksCollectionView.delegate = self
        BooksCollectionView.dataSource = self
        
        registerNibsCells()
    
        
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
    
    private func registerNibsCells() {
        TopStoriesCollectionView.register(UINib(nibName: TopStoriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopStoriesCollectionViewCell.identifier)
        BooksCollectionView.register(UINib(nibName: BookListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BookListCollectionViewCell.identifier)
    }
    
    func fetchResponse() {
        NetworkServicesModel.shared.fetchTopstories { resp, error in
       
                self.topStories = resp.map({return TopStoriesViewModel(top: $0)})
                DispatchQueue.main.async {
                self.TopStoriesCollectionView.reloadData()
                }
        }
    }
    
    func fetchListBooks() {
        NetworkServicesModel.shared.fetchListBooks { resp, error in
          
            self.allBooks = resp.map({ return BookListsViewModel(book: $0)})
            
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
            return topStories.count
        case BooksCollectionView:
            return allBooks.count
        default:
            return 0
        }
    }
    
    //    MARK: - Changes NumberOfItemsInSections of cell depends of section of cell
    func collectionViewcellForItemAt(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case TopStoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopStoriesCollectionViewCell.identifier, for: indexPath) as! TopStoriesCollectionViewCell
                cell.setupTopAnimes(top: topStories[indexPath.item])
            return cell
        case BooksCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookListCollectionViewCell.identifier, for: indexPath) as! BookListCollectionViewCell
            cell.setupBooks(book:  allBooks[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
//    MARK: - IBAction
    
    @IBAction func searchActionBtn(_ sender: Any) {
        setupSearchBar()
    }
    
}

extension TopStoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewNumberOfItemsInSection(collectionView)
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopStoriesCollectionViewCell.identifier, for: indexPath) as! TopStoriesCollectionViewCell
//
//
//        cell.setupTopAnimes(top: topStories[indexPath.item])
//
//        return cell
        
        return collectionViewcellForItemAt(collectionView, cellForItemAt: indexPath)
    }
}
