//
//  SliderView.swift
//  Slider
//
//  Created by Edgar Arakelyan on 05.05.22.
//

import Foundation
import UIKit

class SliderView: UIStackView {
    var sliderLabel: UILabel!
    var slider: UISlider!
    
    init() {
        super.init(frame: .zero)
            activateView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func activateView() {
        initSliderLable()
        initSlider()
        addViews()
        activateConstraints()
        
        self.axis = .horizontal
        self.spacing = 20
    }
    
    func set(text: String, color: UIColor) {
        sliderLabel.text = text
        slider.tintColor = color
    }
}

extension SliderView {
    fileprivate func initSliderLable() {
        sliderLabel = UILabel()
        sliderLabel.textColor = .black
        sliderLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initSlider() {
        slider = UISlider()
        slider.tintColor = UIColor.systemBlue
        slider.isContinuous = true
        slider.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func addViews() {
        addArrangedSubview(sliderLabel)
        addArrangedSubview(slider)
    }
    
    fileprivate func activateConstraints() {
        NSLayoutConstraint.activate([
            sliderLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            slider.trailingAnchor.constraint(equalTo: trailingAnchor),
            slider.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
