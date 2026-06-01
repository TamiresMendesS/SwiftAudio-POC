//
//  FileSoundAV.swift
//  POCAudio
//
//  Created by Tamires Mendes da Silva on 09/10/25.
//

import SwiftUI
import AVFoundation

struct GridSoundButtons: View {
    @State var playingSound: AVAudioPlayer?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var musicalNotes: [String] = ["do", "re", "mi", "fa", "sol", "la", "si"]
    
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
        LazyVGrid(columns: columns){
            ForEach(musicalNotes, id: \.self) { note in
                Button {
                    playSound(named: note)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 120, height: 120)
                            .foregroundStyle(.pink)
                        Text(note)
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    GridSoundButtons()
}
