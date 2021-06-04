//
//  ImageDownloader.swift
//  ImageDownloader
//
//  Created by Prachi Bile on 03/06/21.
//

import Foundation

class ImageDownloadManager {
    
    func getImage(from url: String, completionHandler: @escaping( _ data: Data?) -> Void) {
        let imageUrl = URL(string: url)
        let session = URLSession.shared
        let task = session.downloadTask(with: imageUrl!) { tempFileUrl, response, error in
            do{
                let imageData = try Data(contentsOf: tempFileUrl!)
                completionHandler(imageData)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
