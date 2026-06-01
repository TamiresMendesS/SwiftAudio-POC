//
//  SoundButton.swift
//  POCAudio
//
//  Created by Tamires Mendes da Silva on 22/10/25.
//

import SwiftUI
import AVFoundation

struct SoundButton: View {
    @State var playingSound: AVAudioPlayer?
    
    func playSound(named notes: String) {
        guard let path = Bundle.main.path(forResource: notes, ofType: "mp3") else {
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
    
    
    var body: some View {
        Button {
            playSound(named: "do")
            print("Botão acessado :)")
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(.purple, lineWidth: 3)
                    .frame(width: 260)
                Circle()
                    .frame(width: 232)
                    .foregroundStyle(.purple)
                Image(systemName: "speaker.wave.2.fill")
                    .resizable()
                    .frame(width: 130, height: 110)
                    .foregroundStyle(.white)
            }
        }
        .accessibilityRemoveTraits(.isButton)
    }
}

#Preview {
    SoundButton()
}
