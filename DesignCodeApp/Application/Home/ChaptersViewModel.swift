//
//  ChaptersViewModel.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 2/27/19.
//  Copyright © 2019 Alfredo Villagomez. All rights reserved.
//

import Foundation

struct Chapter: Codable {
    let title: String
    let caption: String
    let body: String
    let image: String
}

class ChaptersViewModel {
    
    private var items: [Chapter] {
        if let path = Bundle.main.path(forResource: "chapters", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let chapters = try JSONDecoder().decode([Chapter].self, from: data)
                return chapters
                
            } catch let error as NSError{
                print(error.localizedDescription)
                return []
            }
        }
        return []
    }
    
    var numberOfItems: Int {
        return items.count
    }
    
    func item(indexPath: IndexPath) -> ChapterViewModel {
        return ChapterViewModel(chapter: items[indexPath.row])
    }
    
}

class ChapterViewModel {
    private var chapter: Chapter
    
    var title: String {
        return chapter.title
    }
    
    var caption: String {
        return chapter.caption
    }
    
    var body: String {
        return chapter.body
    }
    
    var imageName: String {
        return chapter.image
    }
    
    init(chapter: Chapter) {
        self.chapter = chapter
    }
}
