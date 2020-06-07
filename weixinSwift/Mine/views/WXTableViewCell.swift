//
//  WXTableViewCell.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/27.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class WXTableViewCell: UITableViewCell {
    var thumbnail: UIImageView!
    var title: UILabel!
    var detail: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // self.selectionStyle = .none
        self.thumbnail = UIImageView(image: UIImage(named: "md"))
        self.thumbnail.frame = CGRect(x: 20, y: 10, width: 24, height: 24)
        
        self.title = UILabel(frame: CGRect(x: 80, y: 0, width: 120, height: 44))
        self.title.text = ""
        self.title.font = UIFont(name: "Arial", size: 15)
        
        
        self.detail = UIButton(frame: CGRect(x: 240, y: 12, width: 60, height: 20))
        self.detail.setTitle("Detail", for: .normal)
        self.detail.titleLabel?.font = UIFont(name: "Arial", size: 13)
        
        self.detail.backgroundColor = .orange
        self.detail.layer.cornerRadius = 10
        self.detail.addTarget(self, action: #selector(showDetail), for: UIControl.Event.touchUpInside)
        
        self.addSubview(thumbnail)
        self.addSubview(title)
        self.addSubview(detail)
        
    }
    
    
    @objc func showDetail(_ sender: UIButton){
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
