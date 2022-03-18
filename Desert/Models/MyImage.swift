//
//  MyImage.swift
//  Desert
//
//  Created by Artem Kutasevich on 13.03.22.
//

import SwiftUI

struct MyImage: Identifiable, Codable {
    var id = UUID()
    
    var image: UIImage {
        do {
            return try FileManager().readImage(with: id)
        } catch {
            return UIImage(systemName: "photo.fill")!
        }
    }
}
