//  CardBackBioView.swift
//  swiftchallenge
//  Created by Elisa Torres on 27/02/26.
//
import SwiftUI
struct CardBackBioView: View {
    let hero: Scholar
    @State private var isReading = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            // 1. NOMBRES
            VStack(spacing: 2) {
                Text(hero.name)
                    .font(.system(size: 32, weight: .heavy, design: .rounded))
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                
                Text(hero.nameFarsi)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                    .environment(\.layoutDirection, .rightToLeft)
            }
            .padding(.top, 20)
            
            
            // 2. BOTÓN DE AUDIO
            Button(action: {
                isReading.toggle()
                if isReading {
                    StorySpeaker.shared.readBiography(
                                            nameEn: hero.name,
                                            bioEn: hero.bioEn,
                                            nameFa: hero.nameFarsi,
                                            bioFa: hero.bioFarsi
                                        )
                } else {
                    StorySpeaker.shared.stop()
                }
            }) {
                HStack(spacing: 8) {
                    Image(systemName: isReading ? "stop.circle.fill" : "speaker.wave.2.circle.fill")
                        .font(.system(size: 24))
                    
                    Text(isReading ? "Stop" : "Listen")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                }
                .foregroundColor(.black)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color(red: 1.0, green: 0.85, blue: 0.3)) // Dorado
                .cornerRadius(20)
            }
            .padding(.bottom, 5)
            
            
            // 3. ÁREA
            Text(hero.area)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.white.opacity(0.9))
            
            Divider()
                .background(Color.white.opacity(0.4))
                .padding(.horizontal, 40)
            
            // 4. BIOGRAFÍA
            HStack(alignment: .top, spacing: 20) {
                // Columna Inglés
                VStack(alignment: .leading, spacing: 8) {
                    Text("Her Story")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                        .textCase(.uppercase)
                    
                    Text(hero.bioEn)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .lineSpacing(4)
                        .minimumScaleFactor(0.8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Columna Farsi
                VStack(alignment: .trailing, spacing: 8) {
                    Text("داستان او")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                    
                    Text(hero.bioFarsi)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(4)
                        .minimumScaleFactor(0.8)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .environment(\.layoutDirection, .rightToLeft)
            }
            .padding(.horizontal, 30)
            
            Spacer(minLength: 5)
            
            // 5. ICONO
            Image("black icon")
                .resizable()
                .scaledToFit()
                .frame(height: 135)
                .padding(.bottom, 20)
                .opacity(0.8)
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.black.opacity(0.95))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.8), lineWidth: 3)
        )
        .shadow(color: .black.opacity(0.6), radius: 25, x: 0, y: 10)
        .onDisappear {
            StorySpeaker.shared.stop()
            isReading = false
        }
    }
}

