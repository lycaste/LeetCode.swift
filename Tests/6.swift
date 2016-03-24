//
//  ZigZagConversion.swift
//  ZigZagConversion
//
//  Created by Lex Tang on 4/16/15.
//  Copyright (c) 2015 Lex Tang. All rights reserved.
//

/*
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R

And then read line by line: "PAHNAPLSIIGYIR"
Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);
convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
*/

import Foundation
import XCTest

class ZigZagConversion {

    /**
    This Swift method is imitated from the C++ method found here:
    https://github.com/haoel/leetcode/blob/master/algorithms/zigZagConversion/zigZagConversion.cpp

    - parameter text: Source text
    - parameter rows: Number of rows

    - returns: The result ZigZag text
    */
    class func convert0(text: String, _ rows: Int) -> String {
        if rows <= 1 || rows > text.characters.count {
            return text
        }

        var r = [String]()
        var row = 0
        var step = 1
        for (_, char) in text.characters.enumerate() {
            if row == rows - 1 {
                step = -1
            }
            if row == 0 {
                step = 1
            }
            if row > r.count - 1 {
                r.append("\(char)")
            } else {
                r[row].append(char)
            }
            row += step
        }

        var result = ""
        var i = 0

        while i < rows {
            result.appendContentsOf(r[i])
            i += 1
        }

        return result
    }

}

extension ZigZagConversion {

    /**
    O (N)
    This solution is copied from here:
    https://github.com/diwu/LeetCode-Solutions-in-Swift/blob/master/Solutions/Solutions/Easy/Easy_006_ZigZag_Conversion.swift

    - parameter text: Source text
    - parameter rows: Number of rows

    - returns: The result ZigZag text
    */
    class func convert1(text: String, _ rows: Int) -> String {
        var array = Array<String>(count: rows, repeatedValue: String())
        var i = 0, length = text.characters.count
        while i < length {
            for var index = 0; index < rows && i < length; index += 1 {
                array[index].append(text[i]!)
                i += 1
            }
            for var index = rows - 2; index > 0 && i < length; index -= 1 {
                array[index].append(text[i]!)
                i += 1
            }
        }
        var result = ""
        for i in 0 ..< rows {
            result.appendContentsOf(array[i])
        }
        return result
    }

}


class ZigZagConversionTest: XCTestCase {

    func testZigZagConvert() {
        XCTAssertEqual(ZigZagConversion.convert0("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR", "")
        XCTAssertEqual(ZigZagConversion.convert1("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR", "")
    }

}
