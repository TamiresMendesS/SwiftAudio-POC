//
//  FileSound.swift
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
  - parameter soundURL: Recebe o nome do aúdio e o tipo de arquivo
  - parameter nsurl: Recebe o parâmetro com o path, neste caso, o soundURL
 
 
 # Notes: #
 1. AudioToolBox só aceita arquivos .caf, .aif e .wav
 2. Não há um controle de volume
 3. Não toca áudios simultaneamente
 4. Não toca mais de 30 segundos
 */

struct FileSoundButton: View {
    var body: some View {
        HStack {
            Text("File Sound")
            Button {
                var soundId: SystemSoundID = 0
                let soundURL = Bundle.main.path(forResource: "do", ofType: "mp3")
                let nsurl = NSURL.fileURL(withPath: soundURL!)
                AudioServicesCreateSystemSoundID(nsurl as CFURL, &soundId)
                AudioServicesPlaySystemSound(soundId)
            } label: {
                Text("Play Audio")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(.black))
            }
        }
    }
}

#Preview {
    FileSoundButton()
}
