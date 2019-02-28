//
//  TestimonialsViewModel.swift
//  DesignCodeApp
//
//  Created by Alfredo Villagomez on 2/28/19.
//  Copyright © 2019 Alfredo Villagomez. All rights reserved.
//

import Foundation

struct Testimonial: Codable {
    var text: String
    var name: String
    var avatar: String
    var job: String
}

class TestimonialsViewModel {
    private var items: [Testimonial] {
        if let path = Bundle.main.path(forResource: "testimonials", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let chapters = try JSONDecoder().decode([Testimonial].self, from: data)
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
    
    func item(indexPath: IndexPath) -> TestimonialViewModel {
        return TestimonialViewModel(testimonial: items[indexPath.row])
    }
}

struct TestimonialViewModel {
    private var testimonial: Testimonial
    
    var description: String {
        return testimonial.text
    }
    
    var fullName: String {
        return testimonial.name
    }
    
    var avatarFileName: String {
        return testimonial.avatar
    }
    
    var job: String {
        return testimonial.job
    }
    
    init(testimonial: Testimonial) {
        self.testimonial = testimonial
    }
}
