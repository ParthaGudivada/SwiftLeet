//
//  295_Median_Finder.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation
import HeapModule

final class MedianFinder {
    private var small: Heap<Int>
    private var large: Heap<Int>

    init() {
        small = Heap<Int>()
        large = Heap<Int>()
    }

    func addNum(_ num: Int) {
        small.insert(num)

        if let smallMax = small.max, let largeMin = large.min,
           smallMax > largeMin {
            large.insert(small.popMax()!)
        }

        if small.count > large.count + 1 {
            large.insert(small.popMax()!)
        } else if large.count > small.count + 1 {
            small.insert(large.popMin()!)
        }
    }

    func findMedian() -> Double {
        if small.count > large.count {
            Double(small.max!)
        } else if large.count > small.count {
            Double(large.min!)
        } else {
            Double( small.max! + large.min! ) / 2.0
        }
    }
}
