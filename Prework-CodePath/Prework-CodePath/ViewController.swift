//
//  ViewController.swift
//  Prework-CodePath
//
//  Created by Florencia Doval on 1/31/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Added to change the bg color with the colorWell
        colorPalette.addTarget(self, action: #selector(colorWellChanged(_:)), for: .valueChanged)
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        let randomColor = changeColor()
            view.backgroundColor = randomColor
    }
    @IBOutlet weak var colorPalette: UIColorWell!
    @IBAction func changeFont(_ sender: UIButton) {
        changeFont(sender: sender)
    }
    func changeColor() -> UIColor{
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
    // Function to change the font of all labels and buttons (excluding the sender)
        func changeFont(sender: UIButton) {
            let fontNames = ["TimesNewRomanPSMT", "HelveticaNeue", "CourierNewPSMT", "ArialMT", "Georgia"]
            //To make every label change its font
            for subview in view.subviews {
                if let label = subview as? UILabel {
                    let randomFontName = fontNames.randomElement() ?? "HelveticaNeue"
                    let randomFontSize = CGFloat.random(in: 10...15)
                    label.font = UIFont(name: randomFontName, size: randomFontSize)
                } else if let button = subview as? UIButton {
                    if button != sender {
                        let randomFontName = fontNames.randomElement() ?? "HelveticaNeue"
                        let randomFontSize = CGFloat.random(in: 10...15)
                        button.titleLabel?.font = UIFont(name: randomFontName, size: randomFontSize)
                    }
                }
            }
        }
        //Using the colorwell for bg selection
    @objc func colorWellChanged(_ sender: UIColorWell){
        if let selectedColor = sender.selectedColor{
            view.backgroundColor = selectedColor
        }
    }
}
