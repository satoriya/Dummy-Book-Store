//
//  UserTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 03/04/23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let identifier = "MenuTableViewCell"
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var menuTitleLabel: UILabel!
    @IBOutlet weak var chevronButton: UIButton!
    @IBOutlet weak var iconView: UIView!{
        didSet{
            iconView.layer.cornerRadius = 21
        }
    }
    
    var languageLabel: UILabel = {
       let ll = UILabel()
        ll.text = "English (US)"
        return ll
    }()
    
    func setLanguageLabel() {
        addSubview(languageLabel)
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            languageLabel.rightAnchor.constraint(equalTo: chevronButton.leftAnchor, constant: -5),
            languageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            languageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func setSwitchButton() {
        addSubview(switchButton)
        switchButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            switchButton.rightAnchor.constraint(equalTo: chevronButton.leftAnchor, constant: -5),
            switchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            switchButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    var switchButton: UISwitch = {
        let sb = UISwitch()
        return sb
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataMenu(data: Item){
        
        if data.itemName == "Logout" {
            chevronButton.tintColor = .clear
        }
        
        iconImage.image = UIImage(systemName: data.iconName)
        iconImage.tintColor = hexStringToUIColor(hex: data.iconTint)
        menuTitleLabel.text = data.itemName
        iconView.backgroundColor = hexStringToUIColor(hex: data.bgIconColor)
        menuTitleLabel.textColor = hexStringToUIColor(hex: data.textColor)
        
        if data.itemName == "Language" {
            setLanguageLabel()
        }
        
        if data.itemName == "Dark Mode" {
            setSwitchButton()
        }
        
        
    }
}
