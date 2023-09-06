////
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

extension Array where Element: Equatable {

    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}

extension Array {
    /// returns the unique list of objects based on a given key
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }
        return arrayOrdered
    }

    //Generic function for applying ascending sort on an array based on a particular property
    mutating func ascendingSort<T: Comparable>(by property: (Element) -> T) {
        self.sort(by: { property($0) < property($1) })
    }

    //Returns a list sorted in ascending order
    func ascendingSort<T: Comparable>(_ property: (Element) -> T) -> [Element] {
        return sorted(by: {property($0) < property($1)})
    }

    //Generic function for applying descending sort on an array based on a particular property
    mutating func descendingSort<T: Comparable>(by property: (Element) -> T) {
        self.sort(by: { property($0) > property($1) })
    }

    //Returns a list sorted in descending order
    func descendingSort<T: Comparable>(_ property: (Element) -> T) -> [Element] {
        return sorted(by: { property($0) > property($1) })
    }

    /// This will be used to mutate the array and  move it from the given index to specified index in the array
    mutating func move(from oldIndex: Index, to newIndex: Index) {
        if oldIndex == newIndex { return }
        if abs(newIndex - oldIndex) == 1 { return self.swapAt(oldIndex, newIndex) }
        self.insert(self.remove(at: oldIndex), at: newIndex)
    }
}
