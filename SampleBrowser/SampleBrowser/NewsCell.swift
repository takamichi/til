//
//  NewsCell.swift
//  SampleBrowser
//
//  Created by Takamichi URATA on 2018/07/10.
//  Copyright © 2018年 Takamichi URATA. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
