//
//  NewsViewController.swift
//  SampleBrowser
//
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let refreshControl: UIRefreshControl = UIRefreshControl()
    var dataList: [SampleModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.title = "最新記事"
            self.navigationItem.largeTitleDisplayMode = .automatic
        }

        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsCell")

        refreshControl.addTarget(self, action: #selector(refreshReload(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl

        reloadListDatas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onNotificationButtonTapped(_ sender: UIBarButtonItem) {
        // 通知設定画面に遷移
        performSegue(withIdentifier: "MoveNotificationSettingView", sender: nil)
    }

    @objc func refreshReload(_ sender: UIRefreshControl) {
        self.reloadListDatas()
    }

    func reloadListDatas() {
        // セッション用のデフォルト設定
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://demo.wp-api.org/wp-json/wp/v2/posts/")
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    if self.refreshControl.isRefreshing {
                        // 引っ張って更新をしていたら、UIの更新表示を元に戻す
                        self.refreshControl.endRefreshing()
                    }

                    // エラーアラートの表示
                    let controller: UIAlertController = UIAlertController(title: nil, message: "エラーが発生しました。", preferredStyle: .alert)
                    controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(controller, animated: true, completion: nil)
                }

                return
            }

            guard let jsonData: Data = data else {
                DispatchQueue.main.async {
                    if self.refreshControl.isRefreshing {
                        // 引っ張って更新をしていたら、UIの更新表示を元に戻す
                        self.refreshControl.endRefreshing()
                    }

                    let controller: UIAlertController = UIAlertController(title: nil, message: "エラーが発生しました。", preferredStyle: .alert)
                    controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(controller, animated: true, completion: nil)
                }

                return
            }

            self.dataList = try! JSONDecoder().decode([SampleModel].self, from: jsonData)

            DispatchQueue.main.async {
                if self.refreshControl.isRefreshing {
                    // 引っ張って更新をしていたら、UIの更新表示を元に戻す
                    self.refreshControl.endRefreshing()
                }

                // 最新のデータに更新
                self.tableView.reloadData()
            }
        }

        task.resume()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // 1セクション
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 取得データ数のセル表示
        return dataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        let data = dataList[indexPath.row]

        cell.dateLabel.text = data.dateString
        cell.titleLabel.text = data.title.rendered

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)

        let data = dataList[indexPath.row]

        if let url = URL(string: data.link) {
            let controller: SFSafariViewController = SFSafariViewController(url: url)
            // 次の画面に遷移
            self.present(controller, animated: true, completion: nil)
        }
    }
}
