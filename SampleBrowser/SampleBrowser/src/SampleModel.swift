//
//  SampleModel.swift
//  SampleBrowser
//
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import Foundation

struct SampleModel: Codable {
    var title: SampleTitleModel = SampleTitleModel()
    var link: String = "" /// 記事URL
    var date: String = "" /// 記事公開日

    var dateString: String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        if let date = formatter.date(from: date) {
            // 表示フォーマットの設定
            formatter.dateFormat = "yyyy/MM/dd HH:mm"

            let str = formatter.string(from: date)
            return str
        }

        return date
    }

    struct SampleTitleModel: Codable {
        var rendered: String = ""
    }
}
