//
//  ListViewModel.swift
//  DemoProject
//
//  Created by sowmya P on 12/09/21.
//

import Foundation
class ListViewModel {
    var singleSize: String?
    var sizesArray = [String]()
    var httpResponse: HTTPURLResponse?
    var urlString = [
        "apple.com",
        "spacex.com",
        "dapi.co",
        "facebook.com",
        "microsoft.com",
        "amazon.com",
        "boomsupersonic.com",
        "twitter.com"
    ]
    var url = [
        "https://www.apple.com/",
        "https://www.spacex",
        "https://www.dapi.co",
        "https://www.facebook.com",
        "https://www.microsoft.com",
        "https://www.amazon.com",
        "https://www.boomsupersonic.com",
        "https://www.twitter.com"
    ]
    var images = [
        "Apple",
        "Spacex",
        "Dapi",
        "Facebook",
        "Microsoft",
        "Amazon",
        "Boomsupersonic",
        "Twitter"
    ]
    func getSize(data: Data) -> String {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB] // optional: restricts the units to MB only
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(data.count))
        print(string)
        return string
        
    }
    func getRowCount() -> Int {
        if self.sizesArray.count != 0 {
            return self.sizesArray.count + ((self.urlString.count - self.sizesArray.count) )
        }else {
        return  self.urlString.count
        }
    }
    
}
