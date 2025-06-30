//
//  ViewController.swift
//  com.jakehao.testurl
//
//  Created by jake on 2025/6/30.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        _ = testConversion()
    }

    func testConversion() -> URL? {
        let bundlePath = "file:///var/mobile/mypath"
        let result = URL(fileURLWithPath: bundlePath)
        result.absoluteString

        print("result: \(result)")

        // Xcode 16.4, on iOS 18 or iOS 26: warning, url works as expected
        // API MISUSE: URL(filePath:) called with a "file:" scheme. Input must only contain a path. Dropping "file:" scheme.
        // result: file:///var/mobile/mypath

        // Xcode 26 + on iOS 18 or iOS 26: get a mal-formed URL, notice the file:/// prefix is not dropped automatically anymore.
        // result: file%3A///var/mobile/mypath -- file:///

        return result
    }
}
