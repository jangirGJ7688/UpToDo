//
//  TabbarViewModel.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 10/05/24.
//

import Foundation

final class TabbarViewModel: ObservableObject {
    
    let tabItems = [
        TabItemModel(tabname: "Index", imagename: "house"),
        TabItemModel(tabname: "Calendar", imagename: "calendar"),
        TabItemModel(tabname: "Focus", imagename: "clock"),
        TabItemModel(tabname: "Profile", imagename: "person.crop.circle")
    ]
    
    func addItem() {
        print("Add item button click...")
    }
}
