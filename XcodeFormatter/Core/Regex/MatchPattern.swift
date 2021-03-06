//
//  MatchPattern.swift
//  Swinter
//
//  Created by Vijaya Prakash Kandel on 9/27/16.
//  Copyright © 2016 Vijaya Prakash Kandel. All rights reserved.
//

import Foundation

/// Try it on www.regex101.com
/// Capture Groups are important. They are used as index 
/// in MatchCorrectionRule. That index starts from 1. Not 0.
enum MatchPattern: String {
    
    /// Space matcher patterns
    /// capture groups 1 , 2 , 3 matches lhs space, identifier  and rhs space 
    /// Example: let i :  Int
    /// CP1 = ` `  CP2 = `:` CP3 = `  `
    ///
    case colon = "[\\S]([ ]*)(:)([ ]*)(?=[\\S])"
    case comma = "[\\S]([ ]*)(,)([ ]*)(?=[\\S])"
    case functionReturnArrow = "[\\S]([ ]*)(->)([ ]*)(?=[\\S])"
    case trailingCurlyBracket = "([^ \\.\\(\\[])([ ]*)\\{$"
    
    
    /// Ternary Operator pattern
    /// capture groups 1,2,3,4 matches the space inbetween from left to right
    /// Example:  true ?  1   :    0
    /// CP1 = ` ` CP2 = `  ` CP3 = `   ` CP4 = `    `
    ///
    /// This wont match
    /// [someOpt?.map{ $0 } : "xyz"]
    /// let dict = [(model as? AModelType) ?? AModelType : BModelType ]
    ///
    case ternaryOperator = "[^\\?](?<! as)([\\s]*)(?:\\?)([\\s]*)(?:[^\\s:.\\[]+)([\\s]*)(?::)([\\s]*)[\\S]"
    
    
    // Mathces all occurances of \" but not \\", \\\"
    case stringQuote = "([^\\\\]\\\")|(^\\\")"
    case singleLineComment = "//"
    
    case fileComment = "^(\\/\\/\\n)\\/\\/.*.swift\\n\\/\\/.*\\n\\/\\/\\n\\/\\/.*\\n(\\/\\/.*\\n\\/\\/\n)"
    
    
    var regex: NSRegularExpression? {
        return NSRegularExpression.regexFrom(pattern: self.rawValue)
    }
    
}
