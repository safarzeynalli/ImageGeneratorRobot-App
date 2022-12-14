//
//  viewModel.swift
//  ImageGeneratorRobot
//
//  Created by sefer zeynalli on 14/12/2022.
//

import OpenAIKit
import SwiftUI

final class viewModel : ObservableObject {
    private var openai : OpenAI?
    
    func setup() {
            openai = OpenAI(Configuration(
            organization: "Safar Zeynalli Production",
            apiKey: "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"))
    }
    
    func generateImage(prompt: String) async -> UIImage? {
        guard let openai = openai else {
            return nil
        }
        do{
            let params = ImageParameters(
                prompt: prompt,
                resolution: .medium,
                responseFormat: .base64Json)
            let result = try await openai.createImage(
                parameters: params)
            let data = result.data[0].image
            let image = try openai.decodeBase64Image(data)
            return image
        } catch {
            print(String(describing: error))
            return nil
        }
    }
}
