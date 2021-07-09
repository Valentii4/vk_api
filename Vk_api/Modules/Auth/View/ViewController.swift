//
//  ViewController.swift
//  Vk_api
//
//  Created by Valentin Mironov on 28.06.2021.
//

import UIKit
import WebKit

final class AuthViewController: UIViewController {

    //TODO: - Вроде как не особо правильно инитить тут, как лучше сделать?
    private let vm: AuthViewModel = AuthViewModelImpl()
    //MARK: - IBOutlet
    @IBOutlet private weak var authWkWebView: WKWebView!{
        didSet{
            authWkWebView.navigationDelegate = self
        }
    }
    
    //MARK: - LifeCircle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let request = vm.urlRequest else {
            return
        }
        authWkWebView.load(request)
    }


}

extension AuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        do{
            try vm.saveTokenAndUserId(navigationResponse.response.url)
            //TODO: - тут переход на другую view
            decisionHandler(.cancel)
        }catch{
            decisionHandler(.allow)
        }
    }
}
