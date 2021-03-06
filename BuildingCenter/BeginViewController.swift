//
//  DownloadViewController.swift
//  BuildingCenter
//
//  Created by uscc on 2017/7/17.
//  Copyright © 2017年 uscc. All rights reserved.
//

import UIKit
import AVFoundation

class BeginViewController: UIViewController {
    
    var myPlayer :AVAudioPlayer?
    
    static let defaults = UserDefaults.standard
    static var selectedLanguage: String = "zh-Hant";
    static var isEnglish: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //setAudio()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickChinese(_ sender: UIButton) {
        //myPlayer?.play()
        // Set Language zh-Hant(Chinese).
        BeginViewController.selectedLanguage = "zh-Hant"
        BeginViewController.isEnglish = false
        performSegue(withIdentifier: "BeginToAboutOne", sender: self)
    }
    @IBAction func onClickEnglish(_ sender: UIButton) {
        //myPlayer?.play()
        // Set Set Language en(English).
        BeginViewController.selectedLanguage = "en"
        BeginViewController.isEnglish = true
        performSegue(withIdentifier: "BeginToAboutOne", sender: self)
    }
    func setAudio(){
        let soundPath = Bundle.main.path(
            forResource: "button", ofType: "mp3")
        do {
            myPlayer = try AVAudioPlayer(contentsOf: NSURL.fileURL(withPath: soundPath!))
            //self.myPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(filename, ofType: Globals.SOUND_TYPE)!))
            myPlayer?.prepareToPlay()
            myPlayer?.numberOfLoops = 0
        }
        catch{
            print("Create audioplayer failed")
        }
       
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
