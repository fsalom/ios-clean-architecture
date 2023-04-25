//
//  UImageView.swift
//  clean
//
//  Created by Fernando Salom Carratala on 15/11/22.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        self.image = nil
        let tag = self.tag + 1
        self.tag = tag

        DispatchQueue.global().async { [weak self] in
            let backupURL = url
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if self?.tag == tag && url == backupURL {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
