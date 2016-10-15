//
//  ViewController.swift
//  testing1
//
//  Created by Rohan Lokesh Sharma on 15/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//


/*
 
 idea is to play tricks here, 
 define a first cell that has height greater than the others and keep that transparent
 the tableview still scrolls and because the first cell is clear it gives an impression that 
 header is hiding
 
 
 
 
 
 
 */


import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var myTableView:UITableView!
    @IBOutlet var myImageView:UIImageView!
    

    var blurView:UIVisualEffectView!
    
    var initial:CGFloat!
    

    
    override func viewDidLoad() {
        
 
        
      //  let frame = CGRect(x: 0, y: 0, width: 375, height: 230)
      //  myImageView = UIImageView(frame: frame)
      //  myImageView.image = UIImage(named: "tvf")
        
      //  self.view.addSubview(myImageView)
        
        myImageView.contentMode = .scaleToFill
        initial = myImageView.bounds.height
        
        
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.backgroundColor = .clear
        
        
        let effect = UIBlurEffect(style: .light)
         blurView = UIVisualEffectView(effect: effect)
        blurView.frame = self.myImageView.frame
        myImageView.addSubview(blurView)
        blurView.alpha = 0.0
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(section==0)
        {
            return 1;
            
        }
        else
        {
            return 50;
        }
    }
        
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if(indexPath.section == 0)
        {
            cell?.backgroundColor = .clear
            cell?.textLabel?.text = "rohan";
            
            
        }
        else
        {
            
            cell?.textLabel?.text = "Rohan sharma"
            cell?.detailTextLabel?.text  = "\(indexPath.row + 1)"
            cell?.backgroundColor = .white
            
        }
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0)
        {
            return myImageView.bounds.height - 20;
            
        }
        else
        {
            return 40
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y
        
        
       //  print(scrollView.contentOffset.y)
        if(y>0)
        {
            
            //blurView.isHidden = true
            self.myImageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width + y * (self.view.frame.width/initial), height: initial + y)
            myImageView.center = CGPoint(x: self.view.center.x, y: self.myImageView.center.y)
        }
        else{
            
           
            
            let some = abs(y)
            
            blurView.alpha = some/(initial - 20.0)
            
            
            
        }
        
    }
    
   


}

