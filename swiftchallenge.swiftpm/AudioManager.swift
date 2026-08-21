//
//  AudioManager.swift
//  swiftchallenge
//
//  Created by Elisa Torres on 18/02/26.
//
import Foundation
import AVFoundation

final class AudioManager {
    @MainActor static let shared = AudioManager()
    private var audioPlayer: AVAudioPlayer?
    
    private init() { }
    
    func playBackgroundMusic(filename: String = "Tula", fileExtension: String = "mp3") {
        let bundlePath = Bundle.main.bundlePath
            print("Bundle path: \(bundlePath)")
            
            let fileManager = FileManager.default
            if let files = try? fileManager.contentsOfDirectory(atPath: bundlePath) {
                print("📂 Archivos en bundle:")
                files.forEach { print("   - \($0)") }
            }
        if let player = audioPlayer, player.isPlaying { return }
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            print("No se encontró: \(filename).\(fileExtension)")
            return
        }
        
        print("Archivo encontrado: \(url)")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.volume = 1.0
            audioPlayer?.prepareToPlay()
            let success = audioPlayer?.play()
            print("▶️ play() retornó: \(String(describing: success))")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func stopBackgroundMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
        try? AVAudioSession.sharedInstance().setActive(false)
    }
}
