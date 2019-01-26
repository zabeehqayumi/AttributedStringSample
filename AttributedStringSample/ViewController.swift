//
//  ViewController.swift
//  AttributedStringSample
//
//  Created by Zabeehullah Qayumi on 1/21/19.
//  Copyright © 2019 Zabeehullah Qayumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var attLabel: UILabel!
    @IBOutlet weak var textView1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        attLabel.attributedText = attConverter(for: str)
        textView1.attributedText = attConverter(for: str)
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
    
    
    func attConverter(for text: String) -> NSMutableAttributedString {
        
        let attString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font
            : UIFont.boldSystemFont(ofSize: 14)])
        let nsStringRange = (text as NSString!)?.range(of: "but also the leap into electronic typesetting")
        attString.addAttribute(NSAttributedString.Key.underlineStyle, value: 2, range: nsStringRange!)
        
        
    // 1 - change the background color of "Dummy" words to yellow.
        
        let changeBackgroundColorOfDummyWords = (text as NSString!)?.range(of: "dummy")
        
        attString.addAttribute(.backgroundColor, value: UIColor.yellow, range: changeBackgroundColorOfDummyWords!)
        
    // 2 - after the "Lorem" word next ten characters should be superscripted(error handling).
        
         //let superscriptWord = (text as NSString!)?.range(of: "Ipsum")
        
         let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
        
        attString.addAttributes([.font : fontSuper!, .baselineOffset:6], range: NSRange(location: 6, length: 10))
        
        
    // 3 - "release" word should be hyperlinked and should navigate to apple.com
        
        let findReleaseWord = (text as NSString!)?.range(of: "release")
        
        attString.addAttribute(.link, value: "https://www.apple.com", range: findReleaseWord!)

    //  4 - last but not least hide/delete some characters/integers
        
        let findLorem = (text as NSString!)?.range(of: "1960s")
        
        attString.deleteCharacters(in: findLorem!)

        return attString
    }

}


// home work
// work on weekend

/*
 1 - change the background color of "Dummy" words to yellow.
 2 - after the "Lorem" word next ten characters should be superscripted(error handling).
 3 - "release" word should be hyperlinked and should navigate to apple.com
 4 - last but not least hide some characters "integers"
 */

