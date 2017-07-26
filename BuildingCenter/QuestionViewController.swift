//
//  QuestionViewController.swift
//  BuildingCenter
//
//  Created by 李佳穎 on 18/07/2017.
//  Copyright © 2017 uscc. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet var surveyPop: UIView!
    
    @IBOutlet weak var indexText: UILabel!
    @IBOutlet weak var questiontitle: UILabel!
    @IBOutlet weak var buttomalert: UILabel!
    
    @IBOutlet weak var question2view: UIView!
    
    
    var indexofquestion: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBackgroundImage:UIImage! = UIImage(named: "header_blank.png")
        self.navbar.setBackgroundImage(navBackgroundImage.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .stretch), for: .default)
        
    }
    


    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        self.view.addSubview(surveyPop)
        surveyPop.center = self.view.center
        
        
        
            }
    
    @IBAction func dismissSurvey(_ sender: Any) {
        
        surveyPop.removeFromSuperview()
        
    }
    @IBAction func showquestion2(_ sender: Any) {
        
        //let bottomConstrain:NSLayoutConstraint = NSLayoutConstraint(item: question2view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: bottomLayoutGuide, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        //self.view.addConstraint(bottomConstrain)
        
        var initalConstraint = [NSLayoutConstraint]()
        
        question2view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(question2view)
        
        let leadingConstraint = question2view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = question2view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let topConstraint = question2view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130)
        let bottomConstraint = question2view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        initalConstraint.append(contentsOf: [leadingConstraint,trailingConstraint,topConstraint,bottomConstraint])
        
        NSLayoutConstraint.activate(initalConstraint)
        
        questiontitle.text = "年齡"
        
        indexText.text = "\(indexofquestion+1)/12"
        self.view.addSubview(questiontitle)
        
        self.view.addSubview(buttomalert)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
