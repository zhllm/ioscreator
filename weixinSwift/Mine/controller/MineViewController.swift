//
//  MineViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class MineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableViewCR: UITableView?
    
    let cellIdentify = "cellIdentify"
    
    var data = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCR = UITableView(frame: self.view.bounds, style: .plain)
        self.tableViewCR?.delegate = self
        self.tableViewCR?.dataSource = self
        self.view.addSubview(tableViewCR!)
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.barTintColor = UIColor.blue

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
                // 自定义view设置title
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        titleLabel.text = "网易新闻"
        titleLabel.textColor = UIColor.white
        let navigationItem = self.navigationController?.navigationItem
        self.navigationController?.navigationItem.titleView = titleLabel
        // 图片
        let imageView = UIImageView(image: UIImage(named : "contentview_imagebg_logo"))
        navigationItem?.titleView = imageView
        /***
         设置导航栏左右按钮
         ***/
        //文字
        let leftBarButtonItem = UIBarButtonItem(title: "leftButton", style: .plain, target: self, action: #selector(self.leftClick))
        let rightBarButtonItem = UIBarButtonItem(title: "rightButton", style: .plain, target: self, action: #selector(self.rightClick))

        navigationItem?.leftBarButtonItem = leftBarButtonItem
        navigationItem?.rightBarButtonItem = rightBarButtonItem
        // 图片
        navigationItem?.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "fog"), style: .plain, target: self, action: #selector(self.leftClick))
        navigationItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "fog"), style: .plain, target: self, action: #selector(self.rightClick))
        // 自定义
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        leftButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        rightButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        leftButton.setTitle("leftButton", for: UIControl.State.normal)
        rightButton.setTitle("rightButton", for: UIControl.State.normal)
        leftButton.addTarget(self, action: #selector(leftClick), for: UIControl.Event.touchUpInside)
        rightButton.addTarget(self, action: #selector(rightClick), for: UIControl.Event.touchUpInside)
        navigationItem?.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem?.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
    }
    
    @objc func leftClick(){
        
    }
    
    @objc func rightClick(){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: WXTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentify) as? WXTableViewCell
        
        if cell == nil {
            cell = WXTableViewCell(style: .subtitle, reuseIdentifier: cellIdentify)
        }
        
//        cell?.textLabel?.text = "第一次"
//        cell?.detailTextLabel?.text = "看文档写的咯"
//        // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
//        cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: false)
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark{
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
    }

}
