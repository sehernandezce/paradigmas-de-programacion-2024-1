//mergesort

func elementsInRange<T : Comparable>(a: [T], start: Int, end: Int) -> ([T]) {
    var result = [T]()

    for x in start...end {
        result.append(a[x])
    }

    return result
}

func merge<T: Comparable>(a: [T], b: [T], mergeInto acc: [T]) -> [T] {
    if a == [] {
        return acc + b
    } else if b == [] {
        return acc + a
    }

    if a[0] < b[0] {
        return merge(a: elementsInRange(a: a,start: 1, end: a.count), b: b, mergeInto: acc + [a[0]])
    } else {
        return merge(a: a,b: elementsInRange(a: b,start: 1, end: b.count), mergeInto: acc + [b[0]])
    }
}

func mergesort<T: Comparable>(a: [T]) -> [T] {
    if a.count <= 1 {
        return a
    } else {
        let firstHalf = elementsInRange(a: a,start: 0,end: a.count/2)
        let secondHalf = elementsInRange(a: a,start: a.count/2,end: a.count)

        return merge(a: mergesort(a: firstHalf),b: mergesort(a: secondHalf), mergeInto: [])
    }
}
