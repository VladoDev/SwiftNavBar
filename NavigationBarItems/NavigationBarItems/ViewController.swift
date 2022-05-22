//
//  ViewController.swift
//  NavigationBarItems
//
//  Created by Vladimir Gutierrez on 22/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bar Items"
        view.backgroundColor = .red
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("Go ti view 2", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        configureItems()
    }

    private func configureItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
    }
    
    @objc func didTapButton(){
        let vc = UIViewController()
        vc.title = "View 2"
        vc.view.backgroundColor = .systemPink
        navigationController?.pushViewController(vc, animated: true)
    }
}

