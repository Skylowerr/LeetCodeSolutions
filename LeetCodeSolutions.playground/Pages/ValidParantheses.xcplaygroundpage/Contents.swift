//: [Previous](@previous)

import Foundation

func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else { return false }
    var dizi : [Character] = [] //Beklediğimiz değerler
    
    for parantez in s{
        switch parantez {
        case "(":
            dizi.append(")") //( gelirse ) bekleriz
        case "[":
            dizi.append("]")
        case "{":
            dizi.append("}")
            
        default:
            //Kapatma parantezleri
            //Silinmiş elemani şu anki parantezden farklı mı?
            if dizi.isEmpty || dizi.removeLast() != parantez {
                return false
            }
        }
    }
    return dizi.isEmpty //Beklentiler karşılandıysa boşalır, true döner
}

print(isValid("({})"))
