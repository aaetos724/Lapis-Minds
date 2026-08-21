//
//  PuzzleGameView.swift
//  swiftchallenge
//
import SwiftUI

struct PuzzleGameView: View {
    let hero: Scholar

    @State private var pieces: [PuzzlePiece] = []
    @State private var shuffledPositions: [Int] = []
    @State private var hasWon = false
    @State private var flipAngle: Double = 0.0

    
    private let boardSize: CGFloat = 620
    private let spacing: CGFloat = 4
    private let lightHaptic = UIImpactFeedbackGenerator(style: .light)

    var body: some View {
        ZStack {
            
            backgroundLayer
            VStack(spacing: 20) {
                Spacer()

                if !pieces.isEmpty {
                    ZStack {
                            PuzzleBoardView(
                            hero: hero,
                            boardSize: boardSize,
                            spacing: spacing,
                            pieces: $pieces,
                            shuffledPositions: $shuffledPositions,
                            hasWon: $hasWon
                        )
                        .opacity(flipAngle < 90 ? 1 : 0)

                        
                        CardBackBioView(hero: hero)
                            .frame(width: boardSize, height: boardSize)
                            .opacity(flipAngle >= 90 ? 1 : 0)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    }
                    .rotation3DEffect(.degrees(flipAngle), axis: (x: 0, y: 1, z: 0))
                    
                } else {
                    ProgressView("Carving pieces...").tint(.white)
                }

                
                flipButton
                    .padding(.bottom, 20)

                Spacer()
            }

            
            VStack {
                HStack {
                    NavigationLink(destination: GalleryView()) {
                        HStack(spacing: 12) {
                            Image(systemName: "chevron.left")
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Gallery")
                                Text("گالری").environment(\.layoutDirection, .rightToLeft)
                            }
                        }
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1))
                    }
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.leading, 24)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            setupGame()
        }
    }

    
    var backgroundLayer: some View {
        GeometryReader { geo in
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
                .blur(radius: 15)
                .ignoresSafeArea()
            
            Color.black.opacity(0.6).ignoresSafeArea()
        }
    }

   
    var flipButton: some View {
        Button(action: {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                flipAngle = (flipAngle == 0) ? 180 : 0
            }
            lightHaptic.impactOccurred()
            if flipAngle == 0 { StorySpeaker.shared.stop() }
        }) {
            HStack(spacing: 15) {
                Image(systemName: flipAngle < 90 ? "book.fill" : "puzzlepiece.fill")
                    .font(.title2)
                VStack(alignment: .leading, spacing: 4) {
                    Text(flipAngle < 90 ? "Read her Story" : "Back to Puzzle")
                        .font(.headline)
                    Text(flipAngle < 90 ? "داستان او را بخوانید" : "بازگشت به پازل")
                        .font(.headline)
                        .environment(\.layoutDirection, .rightToLeft)
                }
            }
            .foregroundColor(.white)
            .padding(.vertical, 14)
            .padding(.horizontal, 35)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(25)
            .shadow(radius: 10)
        }
    }

    func setupGame() {
        if let uiImage = UIImage(named: hero.imageName) {
            self.pieces = PuzzleEngine.createPuzzle(from: uiImage, difficulty: hero.difficulty)
            self.shuffledPositions = Array(0..<pieces.count).shuffled()
        }
    }
}
