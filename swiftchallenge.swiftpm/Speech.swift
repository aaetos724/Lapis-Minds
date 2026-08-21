//
//  Speech.swift
//  swiftchallenge
//
//  Created by Elisa Torres on 27/02/26.
//
import AVFoundation

class StorySpeaker {
    @MainActor static let shared = StorySpeaker()
    private let synthesizer = AVSpeechSynthesizer()
    
    
    func readBiography(nameEn: String, bioEn: String, nameFa: String, bioFa: String) {
        
        
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
            return
        }
        
        let utterNameEn = AVSpeechUtterance(string: nameEn)
        utterNameEn.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterNameEn.rate = 0.5
        utterNameEn.pitchMultiplier = 1.1
        utterNameEn.postUtteranceDelay = 0.2
        
        
        let utterBioEn = AVSpeechUtterance(string: bioEn)
        utterBioEn.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterBioEn.rate = 0.5
        utterBioEn.postUtteranceDelay = 0.8
        
        
        
        
        let utterNameFa = AVSpeechUtterance(string: nameFa)
        utterNameFa.voice = AVSpeechSynthesisVoice(language: "fa-IR")
        utterNameFa.rate = 0.45
        utterNameFa.postUtteranceDelay = 0.2
        
        
        let utterBioFa = AVSpeechUtterance(string: bioFa)
        utterBioFa.voice = AVSpeechSynthesisVoice(language: "fa-IR")
        utterBioFa.rate = 0.45
        
       
        synthesizer.speak(utterNameEn)
        synthesizer.speak(utterBioEn)
        synthesizer.speak(utterNameFa)
        synthesizer.speak(utterBioFa)
    }
    
    func stop() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
    }
}
