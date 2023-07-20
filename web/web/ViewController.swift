//
//  ViewController.swift
//  web
//
//  Created by yanju on 2023/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActiviryIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.navigationDelegate = self
        loadWebPage("http://2sam.net")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActiviryIndicator.startAnimating()
        myActiviryIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActiviryIndicator.stopAnimating()
        myActiviryIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActiviryIndicator.stopAnimating()
        myActiviryIndicator.isHidden = true
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1>HTML String</h1><p>String 변수를 이용한 웹 페이지</p><a href=\"http://2sam.net\">2sam</a>으로 이동"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}

