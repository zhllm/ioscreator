//
//  WXTableViewCell.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/27.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class WXTableViewCell: UITableViewCell {
    var iconImageView: UIImageView?
    var titleLabel: UILabel?
    var noteLabel: UILabel?
    var timeLabel: UILabel?
    var numberLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        self.iconImageView = UIImageView(frame: CGRect(x: 16, y: 8, width: 48, height: 48))
        self.iconImageView?.image = UIImage(named: "md")
        self.contentView.addSubview(iconImageView!)
        
        self.selectionStyle = .none
        
        self.titleLabel = UILabel(frame: CGRect(x: 72, y: 8, width: 240, height: 21))
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        self.titleLabel?.text = "hellohfsdhfksdjfkdsf"
        self.contentView.addSubview(titleLabel!)
        
        self.noteLabel = UILabel(frame: CGRect(x: 72, y: 32, width: 240, height: 21))
        self.noteLabel?.font = UIFont.systemFont(ofSize: 15.0)
        self.noteLabel?.textColor = UIColor.lightGray
        self.noteLabel?.text = "world!!!hellohfsdhfksdjfkdsfhellohfsdhfksdjfkdsf"
        self.contentView.addSubview(noteLabel!)
        
        self.timeLabel = UILabel(frame: CGRect(x: 326, y: 8, width: 42, height: 21))
        self.timeLabel?.font = UIFont.systemFont(ofSize: 12.0)
        self.timeLabel?.textColor = UIColor.lightGray
        self.timeLabel?.text = "8:24"
        self.numberLabel?.textAlignment = .right
        self.contentView.addSubview(timeLabel!)
        
        
        self.numberLabel = UILabel(frame: CGRect(x: 337, y: 32, width: 21.0, height: 21))
        self.numberLabel?.font = UIFont.systemFont(ofSize: 15.0)
        self.numberLabel?.textColor = UIColor.lightGray
        self.numberLabel?.text = "3"
        self.numberLabel?.layer.cornerRadius = 10
        self.numberLabel?.backgroundColor = UIColor.red
        self.numberLabel?.clipsToBounds = true
        self.numberLabel?.textAlignment = .center
        self.contentView.addSubview(numberLabel!)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
