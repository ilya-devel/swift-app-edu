//
//  SetThemesView.swift
//  home_main
//
//  Created by Ильяс Альфатович on 17.01.2025.
//

import UIKit

protocol ThemeViewDelegate: AnyObject {
    func updateColor()
}

final class SetThemeView: UIView, ThemeViewDelegate {
    func updateColor() {
        backgroundColor = AppData.currentTheme.background
        titleSetChoice.textColor = AppData.currentTheme.fontColor
    }

    weak var delegate: ThemeViewDelegate?

    var titleSetChoice: UILabel = {
        let label = UILabel()
        label.textColor = AppData.currentTheme.fontColor
        label.text = "Choice Theme"
        return label
    }()

    var btnLightTheme: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = LightTheme().btnBackground
        btn.tag = 1
        btn.setTitle("Light Theme", for: .normal)
        btn.setTitleColor(LightTheme().fontColor, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()

    var btnDarkTheme: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = DarkTheme().btnBackground
        btn.tag = 2
        btn.setTitle("Dark Theme", for: .normal)
        btn.setTitleColor(DarkTheme().fontColor, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()

    var btnSepiaTheme: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = SepiaTheme().btnBackground
        btn.tag = 3
        btn.setTitle("Sepia Theme", for: .normal)
        btn.setTitleColor(SepiaTheme().fontColor, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()

    init() {
        super.init(frame: .zero)
        ColorsSchemeControl.addView(newView: self)
//        backgroundColor = AppData.currentTheme.background
//        backgroundColor = .red
        btnLightTheme.addTarget(self, action: #selector(setTheme), for: .touchUpInside)
        btnDarkTheme.addTarget(self, action: #selector(setTheme), for: .touchUpInside)
        btnSepiaTheme.addTarget(self, action: #selector(setTheme), for: .touchUpInside)
        setupView()
        self.delegate = self
    }

    func setupView() {
        addSubview(titleSetChoice)
        addSubview(btnLightTheme)
        addSubview(btnDarkTheme)
        addSubview(btnSepiaTheme)
        setupConstraints()
    }

    func setupConstraints() {
        titleSetChoice.translatesAutoresizingMaskIntoConstraints = false
        btnLightTheme.translatesAutoresizingMaskIntoConstraints = false
        btnDarkTheme.translatesAutoresizingMaskIntoConstraints = false
        btnSepiaTheme.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleSetChoice.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleSetChoice.centerYAnchor.constraint(equalTo: topAnchor, constant: 30),

            btnLightTheme.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnLightTheme.topAnchor.constraint(equalTo: titleSetChoice.bottomAnchor, constant: 10),
            btnLightTheme.widthAnchor.constraint(equalToConstant: 200),

            btnDarkTheme.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnDarkTheme.topAnchor.constraint(equalTo: btnLightTheme.bottomAnchor, constant: 5),
            btnDarkTheme.widthAnchor.constraint(equalToConstant: 200),

            btnSepiaTheme.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnSepiaTheme.topAnchor.constraint(equalTo: btnDarkTheme.bottomAnchor, constant: 5),
            btnSepiaTheme.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SetThemeView {
    @objc func setTheme(sender: UIButton) {
        print("update Setting...")
        let color: ColorsForTheme
        switch sender.tag {
        case 1: color = .light
        case 2: color = .dark
        case 3: color = .sepia
        default:
            return
        }
        AppData.setCurrentTheme(color: color)
//        delegate?.updateColor()
        ColorsSchemeControl.updateScheme()
        print("OK")
    }
}

// #Preview {
//    SetThemeView()
// }
