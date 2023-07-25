//
//  HomeScreenViewController.swift
//  FireBase Demo
//
//  Created by DB-MM-002 on 21/07/23.
//

import UIKit

class HomeScreenViewController: UIViewController {
    // MARK: - IB Declarations
        @IBAction func btnToOpenMap(_ sender: UIButton) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "MapViewController") as? MapViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
     
        @IBAction func btnToSignIn(_ sender: UIButton) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SignInViewController") as? SignInViewController
            navigationController?.pushViewController(vc!, animated: true)
            print("Button tapped for sign in process")
        }
    //MARK: - LifeCycle Methods
        override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.isNavigationBarHidden = true
        }
        override func viewDidLoad() {
            super.viewDidLoad()
        }

}
