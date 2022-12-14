//
//  ContentView.swift
//  ImageGeneratorRobot
//
//  Created by sefer zeynalli on 14/12/2022.
//

import OpenAIKit
import SwiftUI

struct ContentView: View {
    
    @ObservedObject  var vm = viewModel()
    @State var text = ""
    @State var image : UIImage?
    
    var body: some View {
        NavigationView {
            VStack() {
                Spacer()
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                }
                else {
                    let _ = print("Type prompt to generate image!")
                }
                Spacer()
                
                TextField("Type prompt here...", text: $text)
                    .padding()
                Button("Generate!") {
                    if !text.trimmingCharacters(in: .whitespaces).isEmpty {
                        Task {
                            let result = await vm.generateImage(prompt: text)
                            if result == nil {
                                print("Failed  to get image!")
                            }
                            self.image = result
                        }
                    }
                }
                
            }
            .navigationTitle("Image Generator Robot")
            .onAppear{
                vm.setup()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

