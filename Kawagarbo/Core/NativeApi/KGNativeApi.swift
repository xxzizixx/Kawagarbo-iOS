//
//  KGNativeApiDelegate.swift
//  KawagarboExample
//
//  Created by 温一鸿 on 2018/9/26.
//  Copyright © 2018年 Moirig. All rights reserved.
//

import Foundation

public protocol KGNativeApiDelegate: NSObjectProtocol {
    
    var webViewController: KGWebViewController? { get set }
    
    var path: String { get }
    
    func perform(with parameters: [String: Any]?, complete: KGNativeApiResponseClosure)
    
}

extension KGNativeApiDelegate where Self: KGNativeApi {
    
    func regist() {
        KGNativeApiManager.addNativeApi(self)
    }
    
}

public class KGNativeApi: NSObject {
    
    public weak var webViewController: KGWebViewController?
    
    public static func regist() {
        KGSetNavigationBarTitleApi().regist()
    }
    
}
