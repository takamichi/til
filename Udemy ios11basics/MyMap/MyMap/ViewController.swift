//
//  ViewController.swift
//  MyMap
//
//  Created by Takamichi URATA on 2018/07/30.
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var dispayMap: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        inputText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()

        let keyword = textField.text;
        print(keyword!)

        // キーワードから緯度・経度の検索し、結果のピンを表示する
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(
            keyword!,
            completionHandler: {
                (placemarks: [CLPlacemark]?, error: Error?) in
                if let placemark = placemarks?[0] {
                    if let targetCordinate = placemark.location?.coordinate {
                        print(targetCordinate)

                        // ピンを作成
                        let pin = MKPointAnnotation()
                        pin.coordinate = targetCordinate
                        pin.title = keyword

                        // ピンの追加と表示範囲の調整
                        self.dispayMap.addAnnotation(pin)
                        self.dispayMap.region = MKCoordinateRegionMakeWithDistance(targetCordinate, 500.0, 500.0)
                    }
                }
            }
        )

        return true
    }
}
