//
//  ViewController.swift
//  NavigationBarItems
//
//  Created by Vladimir Gutierrez on 22/05/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bar Items"
        view.backgroundColor = .red
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("Go ti view 2", for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside)
        
        configureItems()
    }

    private func configureItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
        
        self.navigationItem.leftBarButtonItem =
            UIBarButtonItem(
                barButtonSystemItem: .camera,
                target: self,
                action: #selector(openCameraRoll)
            )
    }
    
    @objc func openCameraRoll(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func didTapButton(){
        let vc = UIViewController()
        vc.title = "View 2"
        vc.view.backgroundColor = .systemPink
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

