import Foundation

public class SortingMethods {
  public init() {}
}

// heap sort
extension SortingMethods {
  
  private func heapify<T: Comparable>(array: inout [T], size: Int, index: Int) {
    
    /// First determine the indices of root, its left and right children
    let root = index
    let left = 2 * index + 1
    let right = 2 * index + 2
    
    // set largest index as root
    var largest = root
    
    // if left child is larger than root
    if left < size && array[left] > array[largest] {
      largest = left
    }
    
    // if right child is larger than root
    if right < size && array[right] > array[largest] {
      largest = right
    }
    
    // if largest is not root, a swap needs to happen
    if largest != root {
      array.swapAt(root, largest)
      heapify(array: &array, size: size, index: largest)
    }
  }
  
  public func heapSort<T: Comparable>(array: [T]) -> [T] {
    let size = array.count
    var arrayCopy = array
    
    for i in (0...(size/2)-1).reversed() {
      
      heapify(array: &arrayCopy, size: size, index: i)
    }
    
    for i in (1...size-1).reversed() {
      arrayCopy.swapAt(0, i)
      heapify(array: &arrayCopy, size: i, index: 0)
    }
    
    return arrayCopy
    
  }
}

// quick sort
extension SortingMethods {
  
  public func quickSort<T: Comparable>(array: [T]) -> [T] {
    guard array.count > 1 else {
      return array
    }
    
    let pivot = array[array.count/2]
    let lesser = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quickSort(array: lesser) + equal + quickSort(array: greater)
    
  }
  
}

