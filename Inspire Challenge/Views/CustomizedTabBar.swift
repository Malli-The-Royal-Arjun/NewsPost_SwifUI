//
//  CustomizedTabBar.swift
//  Inspire Challenge
//
//  Created by Mupparaju Rao on 24/10/23.
//

import SwiftUI

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    @Binding var postsCount : Int
    var body: some View {
        HStack(spacing: 20) {
            TabBarButton(text: "Posts (\(postsCount))", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            //            TabBarButton(text: "", isSelected: .constant(tabIndex == 1))
            //                .onTapGesture { onButtonTapped(index: 1) }
            Spacer()
        }
        .border(width: 1, edges: [.bottom], color: Color("Grey2"))
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.custom("Avenir", size: 16))
            .padding(.bottom, 10)
            .foregroundColor(Color("GradientTop"))
            .border(width: isSelected ? 2 : 1, edges: [.bottom], color: Color("GradientTop"))
    }
}

struct EdgeBorder: Shape {
    
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }
            
            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }
            
            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }
            
            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: SwiftUI.Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
