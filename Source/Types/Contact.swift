//
// Contact.swift
//
// Copyright (c) 2015 Andrey Fidrya
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import SwiftyJSON

/// Represents a phone contact.
public class Contact {

    /// Contact's phone number.
    public var phoneNumber: String
    
    /// Contact's first name.
    public var firstName: String
    
    /// *Optional.* Contact's last name.
    public var lastName: String?
    
    /// *Optional.* Contact's user identifier in Telegram.
    public var userId: String?
    
    /// Create an empty instance.
    public init() {
        phoneNumber = ""
        firstName = ""
    }
    
    public convenience init?(json: JSON) {
        self.init()
        
        if json.isNullOrUnknown { return nil }
        
        guard let phoneNumber = json["phone_number"].string else { return nil }
        self.phoneNumber = phoneNumber
        
        guard let firstName = json["first_name"].string else { return nil }
        self.firstName = firstName
        
        lastName = json["last_name"].string
        userId = json["user_id"].string
    }
    
    public var prettyPrint: String {
        var result = "Contact(" +
            "  phoneNumber: \(phoneNumber)" +
            "  firstName: \(firstName)"
        if let lastName = lastName {
            result += "  lastName: \(lastName)"
        }
        if let userId = userId {
            result += "  userId: \(userId)"
        }
        result += ")"
        return result
    }
}

extension Contact: CustomDebugStringConvertible {
    // MARK: CustomDebugStringConvertible
    public var debugDescription: String {
        return "Contact(phoneNumber: \(phoneNumber), firstName: \(firstName), " +
            "lastName: \(lastName.unwrapAndPrint), userId: \(userId.unwrapAndPrint))"
    }
}

