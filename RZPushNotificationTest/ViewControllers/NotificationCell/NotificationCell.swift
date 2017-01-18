//
//  NotificationCell.swift
//  RZPushNotificationTest
//
//  Created by Ruslan Zinko on 18.01.17.
//  Copyright © 2017 Ruslan Zinko. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    @IBOutlet weak var heightOfSubtitleLabel: NSLayoutConstraint!
    @IBOutlet weak var topSpaceOfSubtitleLabel: NSLayoutConstraint!
    @IBOutlet weak var heightOfTitleLabel: NSLayoutConstraint!
    @IBOutlet weak var topSpaceOfTitleLable: NSLayoutConstraint!
   
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if titleLabel.text == nil {
            self.heightOfTitleLabel.constant = 0.0
            self.topSpaceOfTitleLable.constant = 0.0
        }
        
        if subtitleLabel.text == nil {
            self.topSpaceOfSubtitleLabel.constant = 0.0
            self.heightOfSubtitleLabel.constant = 0.0
        }

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
