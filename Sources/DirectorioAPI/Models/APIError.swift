//
//  Created by Pablo González de la Parra on 28/03/25.
//

import Foundation

public enum APIError: CustomNSError {
    
    case invalidURL
    case invalidResponseType
    case httpStatusCodeFailed(statusCode: Int, error: String?)
    
    public static var errorDomain: String {
        "DirectorioAPI"
    }
    
    public var errorCode: Int {
        switch self {
        case .invalidURL:
            return 0
        case .invalidResponseType:
            return 1
        case .httpStatusCodeFailed: return 2
        }
    }
    
    public var errorUserInfo: [String : Any] {
        let text: String
        
        switch self {
        case .invalidURL:
            text = "La URL proporcionada es inválida."
        case .invalidResponseType:
            text = "El tipo de respuesta es inválido."
        case let
                .httpStatusCodeFailed(statusCode, error):
            if let error = error {
                text = "El servidor respondió con un código de estado \(statusCode): \(error)."
            } else {
                text = "El servidor respondió con un código de estado \(statusCode)."
            }
        }
        
        return[NSLocalizedDescriptionKey : text]
    }
    
}
