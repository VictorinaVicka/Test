//
//  ImageView.swift
//  TestAvito
//
//  Created by Виктория Воробьева on 10.01.2021.
//

import UIKit

extension UIImageView {
    public final func parserImage(from url: String){
        DispatchQueue.global().async {
            guard let url = URL(string: url) else {
                print("No image.")
                return
            }
            let session = URLSession.shared
            
            session.dataTask(with: url) { (data, response, err) in
                if let _ = err {
                    print("No image")
                }
                if let data = data {
                    let loaded = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.image = loaded
                    }
                }
            }.resume()
        }
    }
}
