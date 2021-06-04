//
//  ViewController.swift
//  ImageDownloader
//
//  Created by Prachi Bile on 03/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var downloadedImageView: UIImageView!
    
    var imageDownloaderObj: ImageDownloadManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeImageViewRounded()
        createObjects()
    }
    
    func makeImageViewRounded() {
        let radius = downloadedImageView.frame.width/2.0
        downloadedImageView.layer.cornerRadius = radius
        downloadedImageView.layer.masksToBounds = true
        downloadedImageView.contentMode = .scaleToFill
    }
    
    func createObjects(){
        imageDownloaderObj = ImageDownloadManager()
    }
    
    @IBAction func downloadBtnClicked(_ sender: Any) {
        let urlStr = "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/rottweiler-card-small.jpg?bust=1535568036"
        
        imageDownloaderObj.getImage(from: urlStr) { imageData in
            DispatchQueue.main.async {
                self.downloadedImageView.image = UIImage(data: imageData!)
            }
        }
    }
}

