
//  OnboardingView.swift
//  swiftchallenge
//  Created by Elisa Torres on 18/02/26.
//
import SwiftUI

struct OnboardingView: View {
    @State private var textToDisplay: String = ""
    @State private var showButton = false
    
    // Frase onboard
    let dedicationEN = "Dedicated to my sisters in Afghanistan.\nWith love."
    let dedicationFA = "\n\nتقدیم به خواهرانم در افغانستان\nبا عشق"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                
                VStack {
                    Spacer()
                    
                    Text(textToDisplay)
                        .font(.custom("Courier", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                        .lineSpacing(15)
                    
                    Spacer()
                }
                
                // Botón de continue
                if showButton {
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            NavigationLink(destination: GalleryView()) {
                                                HStack(spacing: 15) {
                                                    Image(systemName: "arrow.right.circle.fill")
                                                        .font(.system(size: 28, weight: .bold))
                                                    VStack(alignment: .leading, spacing: 4) {
                                                        Text("Continue")
                                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                                        
                                                        Text("ادامه")
                                                            .font(.system(size: 18, weight: .bold))
                                                            .environment(\.layoutDirection, .rightToLeft)
                                                    }
                                                }
                                                .foregroundColor(.white)
                                                .padding(.vertical, 14)
                                                .padding(.horizontal, 30)
                                                .background(
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [Color(red: 0.2, green: 0.4, blue: 0.9), Color(red: 0.4, green: 0.2, blue: 0.8)]),
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    )
                                                )
                                                .cornerRadius(25)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 25)
                                                        .stroke(Color.white.opacity(0.6), lineWidth: 2)
                                                )
                                                .shadow(color: Color.blue.opacity(0.5), radius: 10, x: 0, y: 5)
                                            }
                                            .padding(.trailing, 40)
                                            .padding(.bottom, 40)
                                        }
                                    }
                                    .transition(.opacity.animation(.easeIn(duration: 1.0)))
                                }
                            }
                            .onAppear {
                
                textToDisplay = ""
                showButton = false
                typeWriterEffect(fullText: dedicationEN + dedicationFA)
            }
        }
    }

    func typeWriterEffect(fullText: String, at position: Int = 0) {
        if position < fullText.count {
            let index = fullText.index(fullText.startIndex, offsetBy: position)
            textToDisplay.append(fullText[index])
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                typeWriterEffect(fullText: fullText, at: position + 1)
            }
        } else {
            withAnimation {
                showButton = true
            }
        }
    }
}
