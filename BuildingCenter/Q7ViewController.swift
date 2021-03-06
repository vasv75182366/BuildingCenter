//
//  Q7ViewController.swift
//  BuildingCenter
//
//  Created by wen on 2017/8/16.
//  Copyright © 2017年 uscc. All rights reserved.
//

import UIKit

class Q7ViewController: UIViewController {

    @IBOutlet var navbar: UINavigationBar!
    @IBOutlet var navItem: UINavigationItem!
    @IBOutlet var questionTitle: UILabel!
    @IBOutlet var buttomHint: UILabel!
    
    //struct survey
    var survey = NSMutableDictionary()
    
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var btn6: UIButton!
    @IBOutlet var btnSkip: UIBarButtonItem!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setText(selectLanguage: BeginViewController.selectedLanguage)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLayout() {
        // set navigation bar background image
        let navBackgroundImage:UIImage! = UIImage(named: "header_blank.png")
        self.navbar.setBackgroundImage(navBackgroundImage.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .stretch), for: .default)
    }
    
    func setText(selectLanguage: String) {
        // according to language set text
        navItem.title = "survey_title".localized(language: selectLanguage)
        questionTitle.text = "survey07_residence".localized(language: selectLanguage)
        buttomHint.text = "txt_privacy".localized(language: selectLanguage)
        
        btn1.setTitle("survey_residence_north".localized(language: selectLanguage), for: .normal)
        btn2.setTitle("survey_residence_middle".localized(language: selectLanguage), for: .normal)
        btn3.setTitle("survey_residence_south".localized(language: selectLanguage), for: .normal)
        btn4.setTitle("survey_residence_east".localized(language: selectLanguage), for: .normal)
        btn5.setTitle("survey_residence_outside".localized(language: selectLanguage), for: .normal)
        btn6.setTitle("survey_other".localized(language: selectLanguage), for: .normal)
        btnSkip.title = "skip".localized(language: selectLanguage)
        
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: false);
    }
    @IBAction func clkPass(_ sender: Any) {
        self.performSegue(withIdentifier: "Q7toQ8", sender: self);
    }
    
    @IBAction func clk1(_ sender: Any) {
        self.survey["location"] = 1
        self.performSegue(withIdentifier: "Q7toQ8", sender: self);
    }
    @IBAction func clk2(_ sender: Any) {
        self.survey["location"] = 2
        self.performSegue(withIdentifier: "Q7toQ8", sender: self);
    }
    @IBAction func clk3(_ sender: Any) {
        self.survey["location"] = 3
        self.performSegue(withIdentifier: "Q7toQ8", sender: self);
    }
    @IBAction func clk4(_ sender: Any) {
        self.survey["location"] = 4
        self.performSegue(withIdentifier: "Q7toQ8", sender: self);
    }
    @IBAction func clk5(_ sender: Any) {
        self.survey["location"] = 5
        self.performSegue(withIdentifier: "Q7toQ8", sender: self);
    }
    
    @IBAction func clk6(_ sender: Any) {
        self.survey["location"] = 6
        self.performSegue(withIdentifier: "Q7toQ8", sender: self);
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let q8 : Q8ViewController = segue.destination as? Q8ViewController{
            q8.survey = self.survey
        }
    }
    

}
