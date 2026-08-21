//GalleryView.swift
//  swiftchallenge
//  Created by Elisa Torres on 18/02/26.
import SwiftUI

struct GalleryView: View {
    let lapisBlue = Color(red: 0.0, green: 0.2, blue: 0.6)
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                Color.black.opacity(0.5).ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Spacer().frame(height: 40)
                    
                    // Galería
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 30) {
                            ForEach(afghanHeroes) { hero in
                                
                                // DISEÑO DE LA TARJETA
                                VStack(spacing: 15) {
                                    Image(hero.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 280, height: 350)
                                        .clipped()
                                        .cornerRadius(15)
                                        .drawingGroup()
                                    
                                    VStack(spacing: 5) {
                                        Text(hero.name)
                                            .font(.custom("Courier", size: 24))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        
                                        
                                        Text(hero.nameFarsi)
                                            .font(.system(size: 26, weight: .bold))
                                            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                                            .environment(\.layoutDirection, .rightToLeft)
                                        
                                        Text(hero.area)
                                            .font(.custom("Courier", size: 18))
                                            .foregroundColor(.white.opacity(0.7))
                                            .padding(.top, 4)
                                        
                                        HStack {
                                            ForEach(0..<hero.difficulty, id: \.self) { _ in
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                                    .font(.system(size: 14))
                                            }
                                        }
                                        .padding(.top, 4)
                                    }
                                    
                                    
                                    
                                    NavigationLink(destination: PuzzleGameView(hero: hero)) {
                                        HStack(spacing: 12) {
                                            Image(systemName: "puzzlepiece.fill")
                                                .font(.system(size: 24, weight: .bold))
                                            
                                            VStack(alignment: .leading, spacing: 2) {
                                                Text("Solve Puzzle")
                                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                                
                                                Text("حل پازل")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .environment(\.layoutDirection, .rightToLeft)
                                            }
                                        }
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 25)
                                        .background(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color(red: 0.2, green: 0.4, blue: 0.9), Color(red: 0.4, green: 0.2, blue: 0.8)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.6), lineWidth: 2)
                                        )
                                        .shadow(color: Color.blue.opacity(0.5), radius: 8, x: 0, y: 4)
                                    }
                                }
                                .padding(20)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                            }
                        }
                        .padding(.horizontal, 40)
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                Task {
                    AudioManager.shared.playBackgroundMusic(filename: "Tula", fileExtension: "mp3")
                }
            }
        }
    }
}
