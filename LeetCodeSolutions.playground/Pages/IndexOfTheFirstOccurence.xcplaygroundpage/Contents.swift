import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty { return 0 }
    
    let arrayHaystack = Array(haystack)
    let arrayNeedle = Array(needle)
    
    if arrayHaystack.count < arrayNeedle.count { return -1 }
    
    // Sadece kontrol edeceğimiz noktaya kadar
    for i in 0...(arrayHaystack.count - arrayNeedle.count) {
        var isMatch = true
        // Needle uzunluğu kadar harf harf kontrol et
        for j in 0..<arrayNeedle.count {
            if arrayHaystack[i + j] != arrayNeedle[j] {
                isMatch = false
                break
            }
        }
        if isMatch {
            return i
        }
    }
    
    return -1
}

//Alternatif

func strStr2(_ haystack: String, _ needle: String) -> Int {
    guard needle.count <= haystack.count else { return -1 }
    guard let first = needle.first else { return -1 }
    
    for (index, value) in haystack.enumerated() where value == first {
        let sub = haystack.dropFirst(index).prefix(needle.count)
        if sub == needle {
            return index
        }
    }
    
    return -1
}

print(strStr("Ankaram", "kara")) // Çıktı: 2
print(strStr2("Ankaram", "kara")) // Çıktı: 2
