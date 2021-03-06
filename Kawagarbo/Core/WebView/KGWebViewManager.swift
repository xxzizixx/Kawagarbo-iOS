//
//  KGWebViewManager.swift
//  KawagarboExample
//
//  Created by 温一鸿 on 2018/9/21.
//  Copyright © 2018年 Moirig. All rights reserved.
//

import UIKit

public class KGWebViewManager: NSObject {
    
    static let manager: KGWebViewManager = KGWebViewManager()
    
    lazy var webViewStack: [KGWKWebView] = {
        let stack = [KGWKWebView]()
        return stack
    }()
    
    var emptyWebView: KGWKWebView?
    
    static var createWebView: KGWKWebView {
        if KGWebViewManager.manager.emptyWebView == nil {
            createEmptyWebView()
        }
        
        let webview = KGWebViewManager.manager.emptyWebView!
        KGWebViewManager.manager.webViewStack.append(webview)
        createEmptyWebView()
        return webview
    }
    
    static var currentWebView: KGWKWebView? {
        return KGWebViewManager.manager.webViewStack.last
    }

    public static func preloadWebView() {
        let webView = getWebView
        webView.loadHTMLString("", baseURL: nil)
        KGWebViewManager.manager.emptyWebView = webView
    }
    
    static func createEmptyWebView() {
        KGWebViewManager.manager.emptyWebView = getWebView
    }
    
    static var getWebView: KGWKWebView {
        let configuration = KGWKWebView.defaultConfiguration
        let userContentController = NativeApiManager.userContentController
        configuration.userContentController = userContentController
        return KGWKWebView(frame: CGRect.zero, configuration: configuration)
    }
    
    static func removeCurrentWebView() {
        KGWebViewManager.manager.webViewStack.removeLast()
    }

}
