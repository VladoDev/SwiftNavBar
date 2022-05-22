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
        view.backgroundColor = .lightGray
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("GO TO CAMERA ROLL", for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside)
        view.addSubview(button)
        
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
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("OPEN CAMERA ROLL", for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(
            self,
            action: #selector(openCameraRoll),
            for: .touchUpInside)
        
        let vc = UIViewController()
        vc.title = "CAMERA ROLL"
        vc.view.backgroundColor = .lightGray
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign out",
            style: .done,
            target: self,
            action: nil)
        vc.view.addSubview(button)
        navigationController?.pushViewController(vc, animated: true)
    }
}

