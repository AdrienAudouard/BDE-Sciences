//
//  CalendarVC.swift
//  BDE Science
//
//  Created by Adrien Audouard on 26/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lienLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(URLRequest(url: URL(string: "http://bdesciences.com/nolaj/?dir")!))
        webView.delegate = self
        lienLabel.adjustsFontSizeToFitWidth = true
        self.navigationController?.setNavigationBarHidden(false , animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func forwardButtonPressed(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.url?.absoluteString.range(of: ".pdf") != nil || request.url?.absoluteString.range(of: ".ppt") != nil
            || request.url?.absoluteString.range(of: ".doc") != nil || request.url?.absoluteString.range(of: ".docx") != nil
            {
            UIApplication.shared.openURL(request.url!)
            return false
        } else {
            urlLabel.text = request.url?.absoluteString
            return true
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
