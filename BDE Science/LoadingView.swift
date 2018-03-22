//
//  LoadingView.swift
//  Thibs v2
//
//  Created by Adrien Audouard on 08/03/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

// pod 'SWActivityIndicatorView'

import UIKit

class LoadingView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _vc: UIViewController!
    private var _bgView: UIView!
    
    var vc: UIViewController{
        get {
            return self._vc
        } set {
            self._vc = newValue
        }
    }
    
    static func loadFromNib(vc: UIViewController, text: String = "Chargement en cours...") -> LoadingView {
        
        
        let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! LoadingView
        
        view.titleLabel.text = text
        
        view.center = CGPoint(x: vc.view.frame.size.width / 2 , y: vc.view.frame.size.height / 2 )
        
        view.vc = vc
        view.clipsToBounds = true
        view.layer.cornerRadius = 7
        
        view._bgView = UIView()
        view._bgView.frame = vc.view.frame
        
        view._bgView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        return view
    }
    
    func hide(){
        self._bgView.removeFromSuperview()
        self.removeFromSuperview()
    }
    
    func show(){
        self._vc.view.addSubview(self._bgView)
        self._vc.view.addSubview(self)
    }

}
