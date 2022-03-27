//
//  Image.swift
//  camptools
//  
//  Created by  on 2022/03/27
//  
//

import UIKit
class FileImage: NSObject {
    private let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    public static func saveImage(image: UIImage) -> String {
        let fileName = "\(NSUUID().uuidString).png"
        let path = getdocumentsDirectory().appendingPathComponent(fileName)
        
        let pngImageData = image.pngData()
        do {
            try pngImageData!.write(to: path)
        } catch let err {
            print("Error: \(err.localizedDescription)")
        }
        return fileName
    }
    
    public static func getUIImageFromDocumentsDirectory(fileName: String) -> UIImage? {
        let path = getdocumentsDirectory().appendingPathComponent(fileName)
        let image = UIImage(contentsOfFile: path.path)
        return image
    }
    
    private static func getdocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

}
