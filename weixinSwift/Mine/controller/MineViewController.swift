//
//  MineViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class MineViewController: UIViewController, UITableViewDataSource{
    let reuseIdentifier = "reuseIdentifier"
    
    override func viewDidLoad() {
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        
        let tableView = UITableView(frame: tableRect)
        
        self.view.addSubview(tableView)
        tableView.register(WXTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: WXTableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? WXTableViewCell
        if (cell == nil) {
            cell = WXTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        }
        cell?.title?.text = "User Name"
        return cell!
    }
}
