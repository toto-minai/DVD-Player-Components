//
//  ContentView.swift
//  DVD Player
//
//  Created by Toto Minai on 2020/12/1.
//

import SwiftUI

let horizontalSpacing: CGFloat = 12
let verticalSpacing: CGFloat = 16

struct ContentView: View {
    @State private var showsDrawer: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            SecondaryAdjusters()
            
            HStack(spacing: 0) {
                Drawer(showsDrawer: $showsDrawer)
                
                DrawerBar(showsDrawer: $showsDrawer)
            }
            .frame(width: 20 + (showsDrawer ? 175 : 0), alignment: .leading)
            .zIndex(-1)
        }
        .frame(height: 170)
        .padding(10)
        .foregroundColor(.white)
    }
}

struct SecondaryAdjusters: View {
    
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            VStack(spacing: 0) {
                ActionBtn(text: "Menu")
                
                Spacer()
                
                ActionBtn(text: "Title")
                
                Spacer()
                
                ActionBtn(text: "Eject")
            }
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(hex: "424242"), Color(hex: "5F5F5F")]),
                                       startPoint: .top, endPoint: .bottom)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color(hex: "666666"), lineWidth: 0.8))
                
                VStack {
                    Image(systemName: "airplayvideo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(3)
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .frame(width: 23, height: 23)
                    
                    Spacer()
                    
                    Text("75%")
                        .font(.system(size: 10, weight: .medium, design: .rounded))
                }
                .padding(8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        }
        .padding(.horizontal, horizontalSpacing)
        .padding(.vertical, verticalSpacing)
        .frame(width: 150)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "CFCFCF"), Color(hex: "979797")]),
                           startPoint: .top, endPoint: .bottom).shadow(radius: 6))
    }
}

struct Drawer: View {
    @Binding var showsDrawer: Bool
    
    var body: some View {
        DrawerContent()
            .frame(height: 160)
            .frame(maxWidth: showsDrawer ? 175 : 0, alignment: .trailing)
            .clipped()
            .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "828282"), Color(hex: "3B3B3B")]),
                                       startPoint: .top, endPoint: .bottom))
    }
}

struct DrawerContent: View {
    var body: some View {
        VStack {
            HStack(spacing: 3) {
                Text("Settings")
                    .font(.system(size: 14, weight: .medium, design: .default))
                
                Spacer()
                
                Group {
                    Text("AUDIO")
                    Image(systemName: "play.fill")
                        .foregroundColor(Color(hex: "828282"))
                }
                    .font(.system(size: 10, weight: .medium, design: .default))
            }
            .padding(.horizontal, horizontalSpacing)
                .frame(height: 36)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(hex: "090909"), Color(hex: "1B1B1B")]),
                                   startPoint: .top, endPoint: .bottom)
                )
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            
            Spacer()
            
            HStack {
                DrawerBtn(name: "magnifyingglass")
                
                Spacer()
                
                DrawerBtn(name: "record.circle")
            }
            
            Spacer()
            
            HStack {
                DrawerBtn(name: "captions.bubble")
                
                Spacer()
                
                DrawerBtn(name: "list.bullet")
            }
        }
            .padding(horizontalSpacing + 2)
            .frame(width: 177)
    }
}

struct DrawerBtn: View {
    let name: String
    
    var body: some View {
        Image(systemName: name)
            .font(.system(size: 18, weight: .semibold, design: .default))
            .frame(width: 75, height: 36)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: "1F1F1F"), Color(hex: "313131")]),
                               startPoint: .top, endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color(hex: "050505"), lineWidth: 0.8))
    }
}

struct ActionBtn: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color(hex: "313131"))
            .font(.system(size: 14, weight: .medium, design: .default))
            .frame(width: 75, height: 40)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: "F0F0F0"), Color(hex: "CDCDCD")]),
                               startPoint: .top, endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color(hex: "666666"), lineWidth: 0.8))
    }
}

struct DrawerBar: View {
    @Binding var showsDrawer: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(hex: "CFCFCF"), Color(hex: "979797")]),
                                       startPoint: .top, endPoint: .bottom))
                
                Rectangle()
                    .frame(width: 30)
                    .foregroundColor(.clear)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(hex: "CFCFCF"), Color(hex: "979797")]),
                                       startPoint: .top, endPoint: .bottom))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    
                    .frame(width: 15, alignment: .trailing)
            }
            
            HStack(spacing: 1.8) {
                RoundedRectangle(cornerRadius: 1.2)
                    .foregroundColor(Color(hex: "313131"))
                    .frame(width: 2.4, height: 20)
                
                RoundedRectangle(cornerRadius: 1.2)
                    .foregroundColor(Color(hex: "313131"))
                    .frame(width: 2.4, height: 20)
            }
        }
        .frame(width: 20)
        .clipped()
        .shadow(radius: 6)
        .onTapGesture {
            withAnimation(Animation.timingCurve(0.68, -0.55, 0.265, 1.55, duration: 0.4)) {
                showsDrawer.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
