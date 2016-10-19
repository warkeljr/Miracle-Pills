//
//  ViewController.swift
//  Miracle Pills
//
//  Created by W.S. van Arkel jr. on 10-10-16.
//  Copyright © 2016 W.S. van Arkel jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var enterFullNameLbl: UITextField!
    @IBOutlet weak var adressLbl: UILabel!
    @IBOutlet weak var enterYourAdressLbl: UITextField!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var miraclePillImg: UIImageView!
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var tittleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var dividerLine: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet var succesView: UIView!
    
    let states = ["Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
    
    var effect: UIVisualEffect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        succesView.layer.cornerRadius = 5.0
        
        statePicker.dataSource = self
        statePicker.delegate = self
        configureAssets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        animateAssets()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        unHideLabels()
        view.backgroundColor = UIColor.white
    }
    
    @IBAction func stateButtonPressed(_ sender: AnyObject) {
        
        statePicker.isHidden = false
        hideLabels()
        view.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func buyNowPressed(_ sender: AnyObject) {
        animateIn()
    }


    
    @IBAction func dismissPopUp(_ sender: AnyObject) {
        
    }
    
    func configureAssets() {
        //self.miraclePillImg.alpha = 0.0
        self.buyNowBtn.center.y -= -25
    }
    
    func animateAssets() {
        buyNowBtn.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        buyNowBtn.alpha = 0.0
        miraclePillImg.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        miraclePillImg.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            
            self.buyNowBtn.transform = CGAffineTransform.identity
            self.buyNowBtn.alpha = 1.0
            self.miraclePillImg.transform = CGAffineTransform.identity
            self.miraclePillImg.alpha = 1.0
        })
    }
    
    func hideLabels() {
        fullNameLbl.isHidden = true
        enterFullNameLbl.isHidden = true
        adressLbl.isHidden = true
        enterYourAdressLbl.isHidden = true
        stateLbl.isHidden = true
        statePickerBtn.isHidden = true
        buyNowBtn.isHidden = true
    }
    
    func unHideLabels() {
        fullNameLbl.isHidden = false
        enterFullNameLbl.isHidden = false
        adressLbl.isHidden = false
        enterYourAdressLbl.isHidden = false
        stateLbl.isHidden = false
        statePickerBtn.isHidden = false
        buyNowBtn.isHidden = false
    }
    
    func animateIn() {
        self.view.addSubview(succesView)
        succesView.center = self.view.center
        
        succesView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        succesView.alpha = 0.0
        
        UIView.animate(withDuration: 0.4, animations: {
            self.visualEffectView.effect = self.effect
            self.succesView.alpha = 1.0
            self.succesView.transform = CGAffineTransform.identity
        })
    }


}

