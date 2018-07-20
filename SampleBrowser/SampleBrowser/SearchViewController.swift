//
//  SearchViewController.swift
//  SampleBrowser
//
//  Created by Takamichi URATA on 2018/07/20.
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
        searchController.searchResultsUpdater = searchResultViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
