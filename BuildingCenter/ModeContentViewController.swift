//
//  ModeContentViewController.swift
//  BuildingCenter
//
//  Created by 李佳穎 on 19/07/2017.
//  Copyright © 2017 uscc. All rights reserved.
//

import UIKit

class ModeContentViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    @IBOutlet weak var thumbButton: UIBarButtonItem!
    // test scroller button
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var containerView: UIView!
    
    let notificationEnterModeContent = Notification.Name("enterModeContentNoti")
    let notificationExitModeContent = Notification.Name("exitModeContentNoti")
    
    var modeItem: ModeItem!
    
    var buttons = [UIButton]()
    var selectedNumber: Int = 0
    var selectedButton: UIButton!
    var pageViewController: PageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setLayout()
        setText()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let isModeContentLaunchBefore = defaults.bool(forKey: "isModeContentLaunchBefore")
        
        if (!isModeContentLaunchBefore) {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ModeContentHint"){
                //show(vc, sender: self)
                present(vc, animated: true)
                
            }
            defaults.set(true, forKey: "isModeContentLaunchBefore")
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: notificationEnterModeContent, object: nil, userInfo: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: notificationExitModeContent, object: nil, userInfo: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerViewSegue" {
            pageViewController = segue.destination as! PageViewController
            pageViewController.mainViewController = self
            pageViewController.modeItem = modeItem
        }
    }
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onThumbClick(_ sender: UIBarButtonItem) {
        thumbButton.image = UIImage(named: "thumbup_orange.png")
        thumbButton.tintColor = UIColor.orange
    }
    
    func setLayout() {
        let navBackgroundImage:UIImage! = UIImage(named: "header_blank.png")
        self.navBar.setBackgroundImage(navBackgroundImage.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .stretch), for: .default)
        
        let size = scrollView.bounds.size
        scrollView.contentSize = CGSize(
            width: CGFloat(size.width * 0.25) * CGFloat((modeItem.devices?.count)!),
            height: size.height
        )
        for index in 0 ... (modeItem.devices?.count)!-1 {
            print(index)
            let button = UIButton()
            button.frame = CGRect(x: CGFloat(index) * size.width * 0.25, y: 0,
                width: size.width * 0.25, height: size.height)
            button.tag = index
            button.addTarget(self, action: #selector(showPage), for: .touchUpInside)
            button.setTitle("equip".localized(language: BeginViewController.selectedLanguage)+" \(index+1)", for: .normal)
            button.setTitleColor(UIColor.black, for: .selected)
            button.setTitleColor(UIColor.lightGray, for: .normal)
            button.isSelected = false
            scrollView.addSubview(button)
            buttons.append(button)
        }
        // init select
        selectedNumber = 0
        selectedButton = buttons[selectedNumber]
        changeTab(to: selectedButton)
        
    }
    func setText() {
        if BeginViewController.isEnglish {
            navBarTitle.title = modeItem.name_en
        }else {
            navBarTitle.title = modeItem.name
        }
    }
    func showPage(sender: UIButton) {
        changeTab(to: buttons[sender.tag])
        pageViewController.showPage(byIndex: sender.tag)
    }
    
    func changeTab(byIndex index: Int) {
        changeTab(to: buttons[index])
    }
    func changeTab(to newButton: UIButton) {
        // 先利用 tintColor 取得 Button 預設的文字顏色
        // 將目前選取的按鈕改成未選取的顏色
        selectedButton.backgroundColor = UIColor.white
        selectedButton.isSelected = false
        // 將參數傳來的新按鈕改成選取的顏色
        newButton.backgroundColor = UIColor.lightGray
        newButton.isSelected = true
        // 將目前選取的按鈕改為新的按鈕
        selectedButton = newButton
    }
}
