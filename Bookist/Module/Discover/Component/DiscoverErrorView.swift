//
//  DiscoverErrorView.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 03/04/23.
//

import UIKit

protocol DiscoverErrorViewDelegate {
    func handleOnReloadButtonSelected()
}

class DiscoverErrorView: UIView {
    
    var delegate: DiscoverErrorViewDelegate?
    
    private lazy var stackContainerView: UIStackView = {
        let stackContainerView = UIStackView()
        stackContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackContainerView.axis = .vertical
        stackContainerView.alignment = .fill
        stackContainerView.distribution = .fillProportionally
        stackContainerView.spacing = 10
        
        return stackContainerView
    }()
    
    private lazy var errorImageView: UIImageView = {
        let errorImageView = UIImageView()
        
        errorImageView.image = UIImage(systemName: "xmark.circle.fill")
        errorImageView.tintColor = .red
        errorImageView.contentMode = .scaleAspectFit
        errorImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        return errorImageView
    }()
    
    private lazy var errorDetailTextView: UITextView = {
        let errorDetailTextView = UITextView()
        
        errorDetailTextView.isScrollEnabled = false
        errorDetailTextView.isSelectable = false
        errorDetailTextView.isEditable = false
        errorDetailTextView.textAlignment = .center
        errorDetailTextView.font = .systemFont(ofSize: 14)
        
        errorDetailTextView.setContentHuggingPriority(.required, for: .vertical)
        errorDetailTextView.setContentCompressionResistancePriority(.required, for: .vertical)
        
        
        return errorDetailTextView
    }()
    
    private lazy var errorReloadButton: UIButton = {
        let errorReloadButton = UIButton(type: .system)
        
        errorReloadButton.setTitle("Reload Again", for: .normal)
        errorReloadButton.addTarget(self, action: #selector(onReloadButtonSelected), for: .touchUpInside)
        
        errorReloadButton.setContentHuggingPriority(.required, for: .vertical)
        errorReloadButton.setContentCompressionResistancePriority(.required, for: .vertical)
        
        return errorReloadButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setComponentsConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setComponentsConstraints()
    }
    
    func setErrorMessage(_ errorMessage: String) {
        errorDetailTextView.text = errorMessage
    }
    
    private func addSubviews() {
        self.addSubview(stackContainerView)
        stackContainerView.addArrangedSubview(errorImageView)
        stackContainerView.addArrangedSubview(errorDetailTextView)
        stackContainerView.addArrangedSubview(errorReloadButton)
    }
    
    private func setComponentsConstraints() {
        NSLayoutConstraint.activate([
            stackContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            stackContainerView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackContainerView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    @objc func onReloadButtonSelected(_ sender: UIButton) {
        delegate?.handleOnReloadButtonSelected()
    }
}
