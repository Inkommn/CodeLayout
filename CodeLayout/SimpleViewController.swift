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
    private var simpleSwitch = UISwitch()
    
    private var statusLabel = UILabel()

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
    
    @objc
    private func changeBackgroundColor() {
        if simpleSwitch.isOn {
            view.backgroundColor = .systemPink
            statusLabel.text = "ON"
        } else {
            view.backgroundColor = .systemCyan
            statusLabel.text = "OFF"
        }
    }
    
}

// MARK: - Setting View
extension SimpleViewController {
    func setupView() {
        view.backgroundColor = .gray
        
        addSubViews()
        addActions()
        
        setupLabels()
        setupSimpleButton()
        
        setupLayout()
    }
}

// MARK: - Setting
extension SimpleViewController {
    func addSubViews() {
        view.addSubview(simpleLabel)
        view.addSubview(simpleButton)
        view.addSubview(simpleSwitch)
        view.addSubview(statusLabel)
    }
        
    func addActions() {
        simpleButton.addTarget(
            self,
            action: #selector(changeLabel),
            for: .touchUpInside
        )
        
        simpleSwitch.addTarget(
            self,
            action: #selector(changeBackgroundColor),
            for: .touchUpInside
        )
    }
    
    func setupLabels() {
        simpleLabel.text = "Hi"
        simpleLabel.textColor = .white
        simpleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        
        statusLabel.text = "OFF"
        statusLabel.textColor = .white
        statusLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
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
        
        [simpleLabel, simpleButton, simpleSwitch, statusLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            simpleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            simpleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            simpleButton.topAnchor.constraint(equalTo: simpleLabel.topAnchor, constant: 200),
            simpleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            simpleButton.widthAnchor.constraint(equalToConstant: 200),
            simpleButton.heightAnchor.constraint(equalToConstant: 70),
            
            simpleSwitch.topAnchor.constraint(equalTo: simpleButton.bottomAnchor, constant: 100),
            simpleSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: simpleButton.topAnchor, constant: 100),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
