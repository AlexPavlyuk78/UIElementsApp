//
//  ViewController.swift
//  UIElementsApp
//
//  Created by brubru on 04.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var dataPicker: UIDatePicker!
    
    @IBOutlet var switchLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        setupSlider()
        setupMainLabel()
    }

    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The  third segment is selected"
            mainLabel.textColor = .yellow
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your name")
            return
        }
        mainLabel.text = textField.text
    }
    
    @IBAction func dataPickerAction() {
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .long
        mainLabel.text = dataFormatter.string(from: dataPicker.date)
    }
    
    
    @IBAction func swithcAction(_ sender: UISwitch) {
        dataPicker.isHidden = !sender.isOn
        switchLabel.text = sender.isOn ? "Hide Date Picker" : "Show Date Picker"
    }
    
    // MARK: - Private Methods
    private func setupMainLabel() {
        mainLabel.text = String(slider.value)
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
    }
}

// MARK: - UIAlertController
extension ViewController {
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.textField.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
