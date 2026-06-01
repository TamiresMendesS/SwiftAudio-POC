//
//  FuncSound.swift
//  POCAudio
//
//  Created by Tamires Mendes da Silva on 22/10/25.
//

import SwiftUI
import AVFoundation

struct FuncSound {
    @State var playingSound: AVAudioPlayer?
    
    func playSound(named notes: String) {
        
        guard let path = Bundle.main.path(forResource: "do", ofType: "mp3") else {
            print("path not created")
            return
        }
        
        let url = URL(filePath: path)
        
        do {
            playingSound = try AVAudioPlayer(contentsOf: url)
            playingSound?.volume = 0.1
            playingSound?.play()
        }
        catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
        
    }
}
