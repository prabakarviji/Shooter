//
//  ShareViewController.swift
//  ShooterExt
//
//  Created by Spritle Mac on 01/08/17.
//  Copyright © 2017 Spritle Mac. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {
    
     private var url: NSURL?

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpModal()
        getURL()

    }
    
    private func setUpModal() {
        let imageView = UIImageView(image: UIImage(named: "vurb-icon-rounded"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        navigationController?.navigationBar.topItem?.titleView = imageView
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(red:0.08, green:0.86, blue:0.61, alpha:1.0)
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
    private func getURL() {
        let extensionItem = extensionContext?.inputItems.first as! NSExtensionItem
        let itemProvider = extensionItem.attachments?.first as! NSItemProvider
        let propertyList = String(kUTTypePropertyList)
        if itemProvider.hasItemConformingToTypeIdentifier(propertyList) {
            itemProvider.loadItem(forTypeIdentifier: propertyList, options: nil, completionHandler: { (item, error) -> Void in
            guard let dictionary = item as? NSDictionary else { return }
            OperationQueue.main.addOperation {
                if let results = dictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary,
                    let urlString = results["URL"] as? String,
                    let url = NSURL(string: urlString) {
                        print("URL retrieved: \(urlString)")
                        //self.url = url
                        let defaults = UserDefaults(suiteName: "group.com.spritle.Shooter")
                        defaults?.set(urlString, forKey: "linkList")
                        defaults?.synchronize()
                    }
                }
            })
        } else {
        print("error")
        }
    }

}
