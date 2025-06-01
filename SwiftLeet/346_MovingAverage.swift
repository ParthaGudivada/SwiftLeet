//
//  346_MovingAverage.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation
import Collections

class MovingAverage {
    private var deque = Deque<Int>()
    private var winSum = 0
    private var size: Int

    init(_ size: Int) {
        self.size = size
    }

    func next(_ val: Int) -> Double {
        deque.append(val)
        winSum += val

        if deque.count > size {
            winSum -= deque.removeFirst()
        }

        return Double(winSum) / Double(deque.count)
    }
}

class MovingAverageVariant {
    private var winSum = 0
    private var deque = Deque<Int>()

    private let size: Int

    init(_ size: Int) {
        self.size = size
    }

    func next(_ val: Int) -> Int  {
        deque.append(val)
        winSum += val

        if deque.count > size {
            winSum -= deque.removeFirst()
        }

        return deque.count == size ? winSum / size : 0
    }
}




final class MovingAverageSolution {

}
