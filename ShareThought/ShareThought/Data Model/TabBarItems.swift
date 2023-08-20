//
//  Enums.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//


enum TabbedItems: Int, CaseIterable{
    case home = 0
//    case note
//    case profile
   
    
    var title: String{
        switch self {
        case .home:
            return "Home"
//        case .profile:
//            return "Profile"
//        case .note:
//            return "Note"
            
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "icons8-home"
//        case .profile:
//            return "profile_icon"
//        case .note:
//            return "icons8-open-book-50"
        }
    }
}

