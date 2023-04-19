//
//  File.swift
//  
//
//  Created by Marta Michelle Caliendo on 16/04/23.
//

import Foundation
import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    private var player: AVAudioPlayer?
    
    
    func play(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: ".mp3") else {return}
        do {
          player = try AVAudioPlayer(contentsOf: url)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            player?.play()
        } catch let error {
            print("Error playing \(error.localizedDescription)")
        }
    }
    func stop() {
        player?.stop()
    }
}
