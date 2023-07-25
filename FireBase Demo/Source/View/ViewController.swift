//
//  ViewController.swift
//  FireBase Demo
//
//  Created by DB-MM-002 on 19/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationController?.delegate = self
          logoImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

        }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.5, animations: {
                    self.logoImageView.transform = .identity
                }) { (_) in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.logoImageView.transform = CGAffineTransform(translationX: 1.5, y: -self.view.safeAreaInsets.top - 160)
                    }) { (_) in
                        DispatchQueue.main.asyncAfter(deadline: .now() ) {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                            self.navigationController?.pushViewController(vc, animated: true) }
                    }
                }
    }
}
extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return FadeAnimator()
        }
        return nil
    }
}
class FadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else { return }
        toView.alpha = 0
        transitionContext.containerView.addSubview(toView)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

