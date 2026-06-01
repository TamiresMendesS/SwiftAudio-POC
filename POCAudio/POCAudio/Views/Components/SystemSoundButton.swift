//
//  SystemSound.swift
//  POCAudio
//
//  Created by Tamires Mendes da Silva on 06/10/25.
//

import SwiftUI
import AudioToolbox

/**
 Code Documentation
 - Parameters:
  - parameter AudioToolbox: Import que permite tocar sons curtos e efeitos de vibração no iOS
  - parameter soundId: Recebe o ID do aúdio a ser tocado (do tipo SystemSoundID)
 
 # Notes: #
 1. AudioToolBox só aceita arquivos .caf, .aif e .wav
 2. Não há um controle de volume
 3. Não toca áudios simultaneamente
 4. Não toca mais de 30 segundos
 */

struct SystemSoundButton: View {
    var body: some View {
        HStack {
            Text("Audio System")
            Button {
                let soundId: SystemSoundID = 1322
                AudioServicesPlaySystemSound(soundId)
            } label: {
                Text("Play Audio")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(.pink))
            }
        }
    }
}

#Preview {
    SystemSoundButton()
}
