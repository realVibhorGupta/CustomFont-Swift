//
//  ViewController.swift
//  lettermodule
//
//  Created by Vibhor Gupta on 12/6/18.
//  Copyright © 2018 Vibhor Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white


        let word = "VibhorGupta"
        let path = UIBezierPath()
        let spacing: CGFloat = 50
        var i: CGFloat = 0

        for letter in word {
            let newPath = getPathForLetter(letter: letter)
            let actualPathRect = path.cgPath.boundingBox
            let transform = CGAffineTransform(translationX: (actualPathRect.width + min(i, 1) * spacing), y: 0)
            newPath.apply(transform)
            path.append(newPath)
            i = i + 1
        }




    }

    func getPathForLetter(letter: Character) -> UIBezierPath {
        var path = UIBezierPath()
        let font = CTFontCreateWithName("Zapfino" as CFString, 64, nil)
        var unichars = [UniChar]("\(letter)".utf16)
        var glyphs = [CGGlyph](repeating: 0, count: unichars.count)
        path.lineWidth = 5.0
        path.stroke()
        let gotGlyphs = CTFontGetGlyphsForCharacters(font, &unichars, &glyphs, unichars.count)
        if gotGlyphs {
            let cgpath = CTFontCreatePathForGlyph(font, glyphs[0], nil)
            path = UIBezierPath(cgPath: cgpath!)
        }

        return path
    }

}

