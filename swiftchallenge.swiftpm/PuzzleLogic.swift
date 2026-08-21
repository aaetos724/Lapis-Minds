//  PuzzleLogic.swift
//  swiftchallenge
//  Created by Elisa Torres on 19/02/26.
//
import SwiftUI
import CoreGraphics


struct PuzzlePiece: Identifiable {
    let id = UUID()
    let image: Image
    let correctPosition: Int
}

class PuzzleEngine {
    
    
    static func createPuzzle(from uiImage: UIImage, difficulty: Int) -> [PuzzlePiece] {
        var pieces = [PuzzlePiece]()
        
        
        let rows = difficulty
        let cols = difficulty
        let cgImage = uiImage.cgImage!
        let width = cgImage.width / cols
        let height = cgImage.height / rows
        
        for row in 0..<rows {
            for col in 0..<cols {
                let rect = CGRect(
                    x: col * width,
                    y: row * height,
                    width: width,
                    height: height
                )
                
                
                if let croppedCgImage = cgImage.cropping(to: rect) {
                    let pieceImage = Image(uiImage: UIImage(cgImage: croppedCgImage))
    
                    let position = row * cols + col
                    
                    let piece = PuzzlePiece(image: pieceImage, correctPosition: position)
                    pieces.append(piece)
                }
            }
        }
        
        return pieces
    }
}
