//
//  ViewController.swift
//  SwiftWkWebView
//
//  Created by Takamichi URATA on 2019/03/23.
//  Copyright © 2019 Takamichi URATA. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!

    var urlString:String = "https://youtube.com"
    var indicator:UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setIndicator()

        guard let url = URL(string: self.urlString) else {
            return
        }

        let req = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 100)
        webView.navigationDelegate = self

        self.webView.load(req)
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }

    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }

    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }

    func setIndicator() {
        indicator = UIActivityIndicatorView()
        
        indicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicator.center = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height / 2)
        indicator.hidesWhenStopped = true
        indicator.style = .gray

        self.webView.addSubview(indicator)
        webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // 通信開始でインディケーター開始
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 通信終了でインディケーター停止
        indicator.stopAnimating()
    }
}

