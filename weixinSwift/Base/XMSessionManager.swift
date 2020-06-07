//
//  AFHTTPSessionManager.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/4/20.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit
import AFNetworking

class NetWork: AFHTTPSessionManager {
    static let sharedInstance: NetWork = {
        let baseUrl = NSURL(string: "http://localhost:3000")!
        let manager = NetWork.init(baseURL: baseUrl as URL, sessionConfiguration: URLSessionConfiguration.default)
        return manager
    }()
    
    class func get(urlString: String, parameter: AnyObject?, success: ((_ response: AnyObject?) -> Void)?, failure: ((_ error: NSError) -> Void)?) -> Void{
        NetWork.sharedInstance.get(urlString, parameters: parameter, progress: { (Progress) in }, success: { (task, responseObject) in
            
            if responseObject != nil {
                success!(responseObject as AnyObject)
            }
            
        }) { (task, error) in
            failure!(error as NSError)
        }
    }
    
    class func post(urlString: String, parameters: AnyObject?, success:((_ responseObject: AnyObject?) -> Void)?, failure:((_ error: NSError) -> Void)?) -> Void {
        NetWork.sharedInstance.post(urlString, parameters: parameters, progress: { (progress) in }, success: { (task, responseObject) in
                //如果responseObject不为空时
                if responseObject != nil {
                    success!(responseObject as AnyObject?)
                }
            }) { (task, error) in
                failure!(error as NSError)
            }
        }
}
