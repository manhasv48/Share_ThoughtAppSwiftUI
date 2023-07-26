//
//  DateExtension.swift
//  ShareThought
//
//  Created by Vishal M on 23/07/23.
//

import Foundation
extension Date{
    func toString() ->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let result = dateFormatter.string(from: self)
        return result
    }
}
extension String{
    func isValidEmail() -> Bool {
        // Regular expression pattern for basic email validation
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    func isPasswordValid() -> Bool   {
        return count >= 6
    }
}
