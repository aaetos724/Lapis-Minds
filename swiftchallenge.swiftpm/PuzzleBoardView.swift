
//  PuzzleBoardView.swift
//  swiftchallenge
//  Created by Elisa Torres on 27/02/26.
//
import SwiftUI


struct DragState {
    var draggedIndex: Int? = nil
    var offset: CGSize = .zero
}

struct PuzzleBoardView: View {
    let hero: Scholar
    let boardSize: CGFloat
    let spacing: CGFloat
    
    
    @Binding var pieces: [PuzzlePiece]
    @Binding var shuffledPositions: [Int]
    @Binding var hasWon: Bool
    
    
    @State private var dragState = DragState()
    @State private var cellSize: CGFloat = 0
    
    
    private let lightHaptic = UIImpactFeedbackGenerator(style: .light)
    private let mediumHaptic = UIImpactFeedbackGenerator(style: .medium)

    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: spacing), count: hero.difficulty)
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                // LA REJILLA
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach(0..<shuffledPositions.count, id: \.self) { gridIndex in
                        let pieceIndex = shuffledPositions[gridIndex]
                        let isDragged = dragState.draggedIndex == gridIndex

                        pieces[pieceIndex].image
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .opacity(isDragged ? 0 : 1.0)
                            // Gesto
                            .gesture(hasWon ? nil : makeDragGesture(for: gridIndex))
                    }
                }
                .onAppear {
                    
                    cellSize = (boardSize - spacing * CGFloat(hero.difficulty - 1)) / CGFloat(hero.difficulty)
                    lightHaptic.prepare()
                }

                
                if let draggedIdx = dragState.draggedIndex {
                    let pieceIndex = shuffledPositions[draggedIdx]
                    let cellOrigin = cellOriginInBoard(for: draggedIdx)
                    
                    pieces[pieceIndex].image
                        .resizable()
                        .frame(width: cellSize, height: cellSize)
                        .scaleEffect(1.05)
                        .shadow(radius: 10)
                        .offset(x: cellOrigin.x + dragState.offset.width, y: cellOrigin.y + dragState.offset.height)
                        .zIndex(1)
                }
            }
        }
        .frame(width: boardSize, height: boardSize)
        .background(Color.white.opacity(0.05))
        .cornerRadius(15)
        .shadow(radius: 30)
    }

    
    private func makeDragGesture(for gridIndex: Int) -> some Gesture {
        DragGesture(minimumDistance: 5, coordinateSpace: .local)
            .onChanged { value in
                if dragState.draggedIndex == nil {
                    dragState.draggedIndex = gridIndex
                    lightHaptic.impactOccurred()
                }
                guard dragState.draggedIndex == gridIndex else { return }
                dragState.offset = value.translation
            }
            .onEnded { value in
                let origin = cellOriginInBoard(for: gridIndex)
                let draggedCenter = CGPoint(x: origin.x + cellSize/2 + value.translation.width,
                                            y: origin.y + cellSize/2 + value.translation.height)
                
                var closest: Int? = nil
                var minInfo: CGFloat = .infinity
                
                for r in 0..<hero.difficulty {
                    for c in 0..<hero.difficulty {
                        let idx = r * hero.difficulty + c
                        if idx == gridIndex { continue }
                        let targetOrigin = cellOriginInBoard(for: idx)
                        let targetCenter = CGPoint(x: targetOrigin.x + cellSize/2, y: targetOrigin.y + cellSize/2)
                        let dist = hypot(draggedCenter.x - targetCenter.x, draggedCenter.y - targetCenter.y)
                        
                        
                        if dist < cellSize/1.5 && dist < minInfo {
                            minInfo = dist
                            closest = idx
                        }
                    }
                }
                
                if let target = closest {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        shuffledPositions.swapAt(gridIndex, target)
                    }
                    mediumHaptic.impactOccurred()
                    checkWinCondition()
                }
                
                withAnimation {
                    dragState.draggedIndex = nil
                    dragState.offset = .zero
                }
            }
    }

    private func cellOriginInBoard(for gridIndex: Int) -> CGPoint {
        let col = gridIndex % hero.difficulty
        let row = gridIndex / hero.difficulty
        return CGPoint(x: CGFloat(col) * (cellSize + spacing), y: CGFloat(row) * (cellSize + spacing))
    }
    
    private func checkWinCondition() {
        let currentOrder = shuffledPositions.map { pieces[$0].correctPosition }
        if currentOrder == Array(0..<pieces.count) {
            withAnimation { hasWon = true }
        }
    }
}
