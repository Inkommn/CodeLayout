//
//  SimpleViewController.swift
//  CodeLayout
//
//  Created by Shamkhan Mutuskhanov on 19.06.2023.
//

import UIKit

// MARK: - SimpleViewController
final class SimpleViewController: UIViewController {
    
    // MARK: - Private properties
    private var simpleLabel = UILabel()
    private var simpleButton = UIButton()
    

    // MARK: - Override UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private methods
    @objc
    private func changeLabel() {
        simpleLabel.text = "Hi Swift!"
        
    }
}

// MARK: - Setting View
extension SimpleViewController {
    func setupView() {
        view.backgroundColor = .systemPink
        
        addSubViews()
        addActions()
        
        setupSimpleLabel()
        setupSimpleButton()
        
        setupLayout()
    }
}

// MARK: - Setting
extension SimpleViewController {
    func addSubViews() {
        view.addSubview(simpleLabel)
        view.addSubview(simpleButton)
    }
        
    func addActions() {
        simpleButton.addTarget(
            self,
            action: #selector(changeLabel),
            for: .touchUpInside
        )
    }
    
    func setupSimpleLabel() {
        simpleLabel.text = "Hi"
        simpleLabel.textColor = .white
        simpleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
    }
    
    func setupSimpleButton() {
        simpleButton.setTitle("Show", for: .normal)
        simpleButton.setTitleColor(.black, for: .normal)
        simpleButton.layer.cornerRadius = 15
        simpleButton.backgroundColor = .white
        simpleButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        simpleButton.setImage(UIImage(systemName: "person"), for: .normal)
        simpleButton.tintColor = .red
    }
}

// MARK: - Layout
extension SimpleViewController {
    func setupLayout() {
        
        [simpleLabel, simpleButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            simpleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            simpleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            simpleButton.topAnchor.constraint(equalTo: simpleLabel.topAnchor, constant: 200),
            simpleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            simpleButton.widthAnchor.constraint(equalToConstant: 200),
            simpleButton.heightAnchor.constraint(equalToConstant: 70)
        
        ])
    }
}
