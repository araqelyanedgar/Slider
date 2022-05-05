//
//  ViewController.swift
//  Slider
//
//  Created by Edgar Arakelyan on 05.05.22.
//

import UIKit

class ViewController: UIViewController {
    var textLabel: UILabel!
    var stackView: UIStackView!
    var sizeSlider: SliderView!
    var redColorSlider: SliderView!
    var greenColorSlider: SliderView!
    var blueColorSlider: SliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTextLabel()
        initVerticalStackView()
        initSlideViews()
        addViews()
        activateConstraints()
        
        sizeSlider.slider.addTarget(
            self,
            action: #selector(self.sizeSliderValueDidChange(_:)),
            for: .valueChanged)
        redColorSlider.slider.addTarget(
            self,
            action: #selector(colorSliderValueDidChange(_:)),
            for: .valueChanged)
        greenColorSlider.slider.addTarget(
            self,
            action: #selector(colorSliderValueDidChange(_:)),
            for: .valueChanged)
        blueColorSlider.slider.addTarget(
            self,
            action: #selector(colorSliderValueDidChange(_:)),
            for: .valueChanged)
    }
    
    @objc func sizeSliderValueDidChange(_ sender:UISlider!) {
        textLabel.font = .systemFont(ofSize: CGFloat(sizeSlider.slider.value))
    }
    
    @objc func colorSliderValueDidChange(_ sender:UISlider!) {
        textLabel.textColor = UIColor(
            red: CGFloat(redColorSlider.slider.value),
            green: CGFloat(greenColorSlider.slider.value),
            blue: CGFloat(blueColorSlider.slider.value),
            alpha: 1
        )
    }
}

extension ViewController {
    fileprivate func initSlideViews() {
        sizeSlider = SliderView()
        sizeSlider.set(text: "Font Size", color: .systemGray)
        sizeSlider.slider.minimumValue = 20
        sizeSlider.slider.maximumValue = 80
        
        redColorSlider = SliderView()
        redColorSlider.set(text: "Red", color: .systemRed)
        
        greenColorSlider = SliderView()
        greenColorSlider.set(text: "Green", color: .systemGreen)
        
        blueColorSlider = SliderView()
        blueColorSlider.set(text: "Blue", color: .systemBlue)
    }
    
    fileprivate func initTextLabel() {
        textLabel = UILabel()
        textLabel.text = "Title"
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initVerticalStackView() {
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func addViews() {
        view.addSubview(textLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(sizeSlider)
        stackView.addArrangedSubview(redColorSlider)
        stackView.addArrangedSubview(greenColorSlider)
        stackView.addArrangedSubview(blueColorSlider)
    }
    
    fileprivate func activateConstraints() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
