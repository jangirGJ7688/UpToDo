//
//  TabbarViewModel.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 10/05/24.
//

import Foundation

final class TabbarViewModel: ObservableObject {
    
    let tabItems = [
        TabItem(tabname: "Index", imagename: "house"),
        TabItem(tabname: "Calendar", imagename: "calendar"),
        TabItem(tabname: "Focus", imagename: "clock"),
        TabItem(tabname: "Profile", imagename: "person.crop.circle")
    ]
    
    func addItem() {
        print("Add item button click...")
    }
}
