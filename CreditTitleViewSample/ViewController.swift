//
//  ViewController.swift
//  CreditTitleViewSample
//
//  Created by Ryota Iwai on 2016/01/27.
//  Copyright © 2016年 Ryota Iwai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradationView: UIView!
    @IBOutlet weak var textView: UITextView!

    private var layoutSetup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !self.layoutSetup &&
            self.view.frame.width == UIScreen.mainScreen().bounds.width &&
            self.view.frame.height == UIScreen.mainScreen().bounds.height {
                self.setupGradaionView()
                self.setupTextView()
                
                self.layoutSetup = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let textViewH = self.textView.frame.height
        self.textView.setContentOffset(CGPoint(x: 0, y: -textViewH), animated: false)
        UIView.animateWithDuration(0.2, delay: 0.1, options: .CurveEaseOut, animations: { () -> Void in
            self.textView.alpha = 1
            }) { (finish) -> Void in
                self.scrollTextView()
        }
    }
    
    private func scrollTextView() {
        let offsetY = self.textView.contentOffset.y
        UIView.animateWithDuration(1.5, delay: 0, options: .CurveLinear, animations: { () -> Void in
            self.textView.setContentOffset(CGPoint(x: 0, y: offsetY + 100), animated: false)
            }, completion: { (finish) -> Void in
                if self.textView.contentOffset.y < self.textView.contentSize.height {
                    self.scrollTextView()
                } else {
                    let textViewH = self.textView.frame.height
                    self.textView.setContentOffset(CGPoint(x: 0, y: -textViewH), animated: false)
                    self.scrollTextView()
                }
        })
    }

    private func setupGradaionView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.blackColor().colorWithAlphaComponent(0.95).CGColor,
            UIColor.clearColor().CGColor]
        gradientLayer.frame = CGRect(origin: CGPoint.zero, size: self.gradationView.frame.size)
        self.gradationView.layer.insertSublayer(gradientLayer, atIndex: 0)
    }

    private func setupTextView() {
        
        self.textView.text = "Apple Inc. Executive Profiles\n\nCEO\nTim Cook\n\nSenior Vice President\nRetail and Online Stores\nAngela Ahrendts\n\nSenior Vice President\nInternet Software and Services\nEddy Cue\n\nSenior Vice President\nSoftware Engineering\nCraig Federighi\n\nChief Design Officer\nJonathan Ive\n\n\nSenior Vice President and Chief Financial Officer\nLuca Maestri\n\nSenior Vice President\nHardware Engineering\nDan Riccio\n\nSenior Vice President\nWorldwide Marketing\nPhilip W. Schiller\n\nSenior Vice President and General Counsel\nBruce Sewell\n\nSenior Vice President\nHardware Technologies\nJohny Srouji\n\nChief Operating Officer\nJeff Williams\n\nVice President\nSpecial Projects\nPaul Deneve\n\nVice President\nUser Interface Design\nAlan Dye\n\nVice President\nCommunications\nSteve Dowling\n\nVice President\nIndustrial Design\nRichard Howarth\n\nVice President\nEnvironment, Policy and Social Initiatives\nLisa Jackson\n\nVice President\nDean, Apple University\nJoel Podolny\n\nVice President\nWorldwide Human Resources\nDenise Young Smith\n\n"

        let textViewH = self.textView.frame.height
        self.textView.textColor = UIColor.whiteColor()
        self.textView.textAlignment = .Center
        self.textView.contentInset = UIEdgeInsets(top: textViewH, left: 0, bottom: textViewH, right: 0)
    }
}

