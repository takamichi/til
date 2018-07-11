//
//  SampleModel.swift
//  SampleBrowser
//
//  Created by Takamichi URATA on 2018/07/11.
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import Foundation

struct SampleModel: Codable {
    var title: SampleTitleModel = SampleTitleModel()
    var link: String = "" /// 記事URL
    var date: String = "" /// 記事公開日

    struct SampleTitleModel: Codable {
        var rendered: String = ""
    }
}
