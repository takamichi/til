//
//  NewsViewController.swift
//  SampleBrowser
//
//  Created by Takamichi URATA on 2018/07/09.
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func reloadListDatas() {
        // セッション用のデフォルト設定
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://demo.wp-api.org/wp-json/wp/v2/posts/")
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                // エラーアラートの表示
                let controller: UIAlertController = UIAlertController(title: nil, message: "エラーが発生しました。", preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(controller, animated: true, completion: nil)

                return
            }
        }

        task.resume()
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
