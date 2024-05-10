//
//  TabbarView.swift
//  UpToDo
//
//  Created by Ganpat Jangir on 10/05/24.
//

import SwiftUI

struct TabbarView: View {
    
    @Binding var salectedTab : Int
    @StateObject var viewModel: TabbarViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom){
                ForEach(Array(viewModel.tabItems.enumerated()),id: \.element) { (index,tab) in
                    Spacer()
                    if index == 2 {
                        Spacer(minLength: 30)
                    }
                    VStack {
                        Image(systemName: tab.imagename)
                            .resizable()
                            .frame(width: 24,height: 24)
                            .scaleEffect(salectedTab == index ? 1.25 : 1)
                            .foregroundColor(salectedTab == index ? Color.accentColor : Color.gray)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    salectedTab = index
                                }
                            }
                        Text(tab.tabname)
                            .font(Fonts.latoRegularFont(12))
                            .foregroundColor(salectedTab == index ? Color.accentColor : Color.black)
                    }
                    Spacer()
                    if index == 1 {
                        Spacer(minLength: 30)
                    }
                }
            }
            .padding(.top,50)
            .overlay(alignment: .top) {
                Button {
                    handleAddItemClick()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .padding(23)
                        .frame(width: 64, height: 64)
                        .foregroundStyle(.white)
                        .background {
                            Circle()
                                .fill(Color.accentColor)
                                .shadow(radius: 3)
                        }
                }
            }
            .padding(.bottom,38)
            .background {
                TabBarShape()
                    .fill(.white)
                    .shadow(radius: 3)
            }
        }
        .ignoresSafeArea()
    }
    
    func handleAddItemClick() {
        viewModel.addItem()
    }
}

#Preview {
    TabbarView(salectedTab: .constant(0), viewModel: TabbarViewModel())
}

struct TabBarShape: Shape {
    static let buttonRadius: CGFloat = 32

    // Function to define the shape's path
    func path(in rect: CGRect) -> Path {
        var path = Path()

        var x = rect.minX
        var y = rect.maxY
        path.move(to: CGPoint(x: x, y: y))
        
        y = rect.minY + TabBarShape.buttonRadius
        path.addLine(to: CGPoint(x: x, y: y))
        
        x = rect.maxX
        path.addLine(to: CGPoint(x: x, y: y))
        
        x = rect.maxX
        y = rect.maxY
        path.addLine(to: CGPoint(x: x, y: y))

        // Close the path to complete the shape
        path.closeSubpath()
        return path
    }
}

