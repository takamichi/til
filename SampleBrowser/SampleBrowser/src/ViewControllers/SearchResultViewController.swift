//
//  SearchResultViewController.swift
//  SampleBrowser
//
//  Created by Takamichi URATA on 2018/07/20.
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import UIKit
import SafariServices

class SearchResultViewController: UITableViewController, UISearchBarDelegate {

    var dataList: [SampleModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // カスタムセルの使用を設定
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // セクション数:1 で固定
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // データ数
        return dataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell

        // セルに日付・タイトルを設定
        let data = dataList[indexPath.row]
        cell.dateLabel.text = data.dateString
        cell.titleLabel.text = data.title.rendered

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択したセルを非選択状態に戻す
        tableView.deselectRow(at: indexPath, animated: true)

        // 記事ページの表示
        let data = dataList[indexPath.row]
        if let url = URL(string: data.link) {
            let controller: SFSafariViewController = SFSafariViewController(url: url)
            self.present(controller, animated: true, completion: nil)
        }
    }

    // 検索欄の文字入力のたびに呼び出される
    func updateSearchResults(for searchController: UISearchController) {
        // 検索窓の文字列でデータ取得
        if let text = searchController.searchBar.text {
            self.reloadListDatas(text)
        }
    }

    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn shouldChangeTextInrange: NSRange, replacementText text: String) -> Bool {
        self.dataList = []
        self.tableView.reloadData()
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        reloadListDatas(searchBar.text!)
    }

    func reloadListDatas(_ text: String) {
        // 空文字列のときは処理を受け付けない
        if text.isEmpty {
            return;
        }

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        // 検索URLの組み立て
        let urlString = "https://demo.wp-api.org/wp-json/wp/v2/posts/" + "?search=" + text
        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!

        let task = session.dataTask(with: url) { (data, response, error) in
            // エラー発生時のアラート表示
            if error != nil {
                let controller: UIAlertController = UIAlertController(title: nil, message: "エラーが発生しました。", preferredStyle: UIAlertControllerStyle.alert)
                controller.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(controller, animated: true, completion: nil)

                return
            }

            // JSON形式にデータ変換
            guard let jsonData: Data = data else {
                let controller: UIAlertController = UIAlertController(title: nil, message: "エラーが発生しました。", preferredStyle: UIAlertControllerStyle.alert)
                controller.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(controller, animated: true, completion: nil)

                return
            }

            self.dataList = try! JSONDecoder().decode([SampleModel].self, from: jsonData)

            DispatchQueue.main.async {
                // 検索結果0件ならアラート表示
                if self.dataList.isEmpty {
                    let controller: UIAlertController = UIAlertController(title: nil, message: "検索結果がありませんでした", preferredStyle: .alert)
                    controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(controller, animated: true, completion: nil)

                    return
                }

                // データ更新
                self.tableView.reloadData()
            }
        }

        task.resume()
    }
}
