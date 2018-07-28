//
//  SearchViewController.swift
//  SampleBrowser
//
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchResultViewController: SearchResultViewController = SearchResultViewController()
        searchController = UISearchController(searchResultsController: searchResultViewController)

        // このクラスを表示の起点に設定
        self.definesPresentationContext = true
        // ナビゲーションバーに検索窓設定
        self.navigationItem.searchController = searchController

        self.title = "検索"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic

        // 検索処理クラスを設定
        searchController.searchBar.delegate = searchResultViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
