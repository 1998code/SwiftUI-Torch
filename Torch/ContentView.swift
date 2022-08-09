//
//  ContentView.swift
//  Torch
//
//  Created by Ming on 9/8/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var torch = false
    
    var body: some View {
        ZStack {
            lightPath
            
            showMe
            
            VStack {
                Spacer()
                actionButton
            }
        }.padding()
    }
    
    var lightPath: some View {
        VStack {
            Spacer()
            Triangle()
                .fill(torch ? Color.yellow.opacity(0.5) : Color.clear)
                .rotationEffect(.degrees(180))
                .padding(.top, 165)
                .padding(.bottom, 25)
        }
    }
    
    var showMe: some View {
        VStack(spacing:0) {
            ZStack {
                Circle().fill(torch ? .yellow : Color.clear)
                Image(systemName: torch ? "figure.wave" : "figure.walk")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(torch ? .white : .primary)
                    .frame(width: 50)
            }
            Spacer()
        }
        .ignoresSafeArea(.all)
    }
    
    var actionButton: some View {
        Button(action: {
            torch.toggle()
            toggleTorch(on: torch)
        }) {
            ZStack {
                if torch {
                    Color.yellow
                    Image(systemName: "flashlight.on.fill").foregroundColor(.white)
                }
                else {
                    Color.blue.opacity(0.1)
                    Image(systemName: "flashlight.off.fill").foregroundColor(.secondary)
                }
            }.frame(maxWidth:50, maxHeight: 50)
            .cornerRadius(15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
