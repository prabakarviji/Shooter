// LoadingView.swift
// Created by Spritle on 03/08/17.
import UIKit
import NVActivityIndicatorView
class Helper: NSObject
{
    
    class func createLoaderView(_ view : UIView) -> NVActivityIndicatorView
    {
        var ViewFrame : CGRect!
        
        ViewFrame =  CGRect(x: 0, y: 0, width: 60 , height: 60)
        let center = CGPoint(x: (view.frame).midX, y: (view.frame).midY)
        
        let activityIndicatorView =  NVActivityIndicatorView(frame: ViewFrame, type: .ballSpinFadeLoader , color: UIColor(red: 200/255, green: 58/255, blue: 60/255, alpha:1.0), padding: CGFloat(0))
        
        activityIndicatorView.center = center
        
        activityIndicatorView.startAnimating()
        
        return activityIndicatorView
    }
    
    class func removeLoaderView(_ activityIndicatorView : NVActivityIndicatorView)
    {
        activityIndicatorView.stopAnimating()
    }
    
    class func addBlurView(_ inView : UIView, y : CGFloat) -> UIView
    {
        var ViewFrame : CGRect!
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        ViewFrame = CGRect(x: 0, y: y, width: screenWidth, height: screenHeight-y)
        let loadView = UIView(frame:ViewFrame)
        loadView.backgroundColor = UIColor.white
        return loadView
    }
}
