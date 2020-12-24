//
//  ViewController.swift
//  MyInAppPurchases
//
//  Created by Ngo Dang tan on 24/12/2020.
//

import UIKit
import StoreFrontKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
    func createButton(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemGreen
        button.setTitle("Upgrade", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        let imageView = UIImageView(image: UIImage(named: "header"))
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        header.clipsToBounds = true
        header.addSubview(imageView)
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        let label = UILabel(frame: footer.bounds)
        footer.addSubview(label)
        label.text = "I am a cool footer"
        label.textAlignment = .center
        
        let vc = SFKMultiNonConsumableViewController(with: [
            .nonConsumable(productID: "com.example.premium", viewModel: StoreFrontProductViewModel(icon: UIImage(systemName: "crown"),iconTintColor: .systemPink)),
            .nonConsumable(productID: "com.example.vip", viewModel: StoreFrontProductViewModel(icon: UIImage(systemName: "star"),iconTintColor: .systemBlue))
        ], header: header
        ,footer: footer
        ) { result in
            switch result{
            case .success(let productID): print(productID)
            case .failure(let error): break
            }
        }
        vc.title = "Upgrade"
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

