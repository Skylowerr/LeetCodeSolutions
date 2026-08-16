import Foundation

//MARK: 1. YOL
func longestCommonPrefixSorted(_ strs: [String]) -> String {
    guard !strs.isEmpty else {return ""}
    let newList = strs.sorted() //Birbirine en az benzeyen kelimeler en baştaki ve en sondakidir. O ikisini kıyaslasak yeter
    let ilkKelime = newList[0]
    let sonKelime = newList[newList.count - 1]
    var ortaklar = ""
    
    //zip ile iki kelimedeki her harfi sırayla kıyaslıyorum
    for (char1,char2) in zip(ilkKelime,sonKelime){
        if char1 == char2
            {
            ortaklar.append(char1)
        }
        else
            {
            break
        }
    }
    return ortaklar
    
}

//MARK: 2.YOL
func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 1 else { return strs.first! }
    let collection = strs.map { Array($0) } //String el. karaktere çeviriyorum ki indexlerine ulaşayım
    let shortest = collection.min(by: { $0.count < $1.count })! //Kısa olana göre işlem yapıcaz
    
    for i in 0 ..< shortest.count {
        for str in collection {
            if str[i] != shortest[i] {
                 return String(shortest[..<i])
            }
        }
    }
    return String(shortest) //Char dizisini tekrar Stringe çeviriyoruz
}


let test = ["flower", "flow", "flight"]
print(longestCommonPrefixSorted(test))
print(longestCommonPrefix(test))
