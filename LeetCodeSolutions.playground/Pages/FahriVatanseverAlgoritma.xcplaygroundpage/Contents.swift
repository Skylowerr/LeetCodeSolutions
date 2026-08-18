import Foundation

//MARK: Girilen harften kaç tane var

//TODO: 1.yol

 func harfSay(cumle: String, aranacakHarf: Character) {
     // Harfleri filtreleyip sayıyoruz
     let adet = cumle.filter { $0 == aranacakHarf }.count
     
     print("Girdiğiniz cümlede '\(aranacakHarf)' karakterinden \(adet) tane bulunuyor.")
 }


 //let testCumlesi = "EmirhaaaAAn"
 //let aranacakKarakter: Character = "a"

 //harfSay(cumle: testCumlesi, aranacakHarf: aranacakKarakter)
 

//TODO: 2.yol

 func harfSay2(cumle: String, aranacakHarf: Character) {
     
     var sayac = 0
     
     for karakter in cumle {
         
         if karakter == aranacakHarf {
             sayac += 1
         }
     }
     
     print("Girdiğiniz cümlede '\(aranacakHarf)' karakterinden \(sayac) tane bulunuyor.")
 }
 //let testCumlesi = "Swift"
 //let aranacakKarakter: Character = "a"

 //harfSay2(cumle: testCumlesi, aranacakHarf: aranacakKarakter)




//MARK: Girilen bir cümleyi tersten yazdır
func tersYazdir(cumle : String){
    let yeniCumle = String(cumle.reversed()) // reversed() returns a ReversedCollection; wrap with String to create a concrete String
    print(yeniCumle)
}

//tersYazdir(cumle: "Ankara")

func tersYazdir2(cumle: String){
    guard !cumle.isEmpty else {
        print("")
        return
    }

    var sonuc = ""
    let harfler = Array(cumle) //Swift dilinde metinlerin (String) içinden harfleri diğer dillerdeki gibi cumle[i] şeklinde tam sayılarla doğrudan alamayız.
    
    //Swift range for counting down is `stride(from:through:by:)` or using indices.
    let lastIndex = cumle.count - 1
    for i in stride(from: lastIndex, through: 0, by: -1) {
        sonuc.append(harfler[i])
    }
    print(sonuc)
}

//tersYazdir2(cumle: "Ankara")



//MARK: Rastgele büyüklükte harfle girilen kelimenin harflerinini büyüklüklerinin tersini al. Büyük-> Küçük, Küçük->Büyük
//İstanbul -> i̇STANBUL
func harflerinTersiniAl(kelime: String) -> String {
    var sonuc = ""
    
    for harf in kelime{
        harf.isUppercase ? sonuc.append(harf.lowercased()) : sonuc.append(harf.uppercased())
    }
    return sonuc
}

let kelime = "İstanbul"
//print(harflerinTersiniAl(kelime: kelime))

func harflerinTersiniAl2(kelime : String) -> String{
    return String(kelime.map { $0.isUppercase ? Character($0.lowercased()) : Character($0.uppercased()) })
}

let kelime3 = "Kedi"
let buyukHarfler = kelime3.map { $0.uppercased() }
let sonucMetni = kelime3.map { $0.uppercased() }.joined()
//print((buyukHarfler))
//print(sonucMetni)


//MARK: Örnek- 7.39 Klavyeden küçük harflerle girilen bir kelimenin sırasıyla sesli harflerinden k1, sessiz harflerinden k2 kelimesini oluştur

//TODO: Set(Küme) ile yaptığım için O(1)
func ikiKelimeOlustur(cumle: String) {
    let sesliHarfler: Set<Character> = ["a", "e", "ı", "i", "o", "ö", "u", "ü"]
    var k1 = ""
    var k2 = ""
    
    for letter in cumle.lowercased() {
        if sesliHarfler.contains(letter) {
            k1.append(letter)
        } else if letter.isLetter {
            k2.append(letter)
        }
    }
    print(k1)
    print(k2)
}
//print(ikiKelimeOlustur(cumle: "Ankara"))


//MARK: 7.52 : Verilen bir dizinin küçükten büyüğe doğru sıralı olup olmadığını test eden fonksiyon
//Bundan daha hızlısı yok çünkü sıralı olup olmadığını anlamak için dizideki her elemana en az bir kez bakmak lazım

func siraliMi<T: Comparable>(dizi : [T]) -> Bool {
    guard dizi.count > 1 else {return true}
    
    for i in 1..<dizi.count{
        if dizi[i-1] > dizi[i]{
            return false
        }
    }
    return true
    
}

//print(siraliMi(dizi: [105,6,7,8]))
//print(siraliMi(dizi: ["Ahmet","Mehmet","Emirhan"]))


//MARK: 2D ARRAYS
var grid : [[Int]] = [] //Boş 2 boyutlu dizi

var matrix = Array(repeating: Array(repeating: 0, count: 4), count: 3)

//print(matrix) // [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

var board : [[String]] = [
    ["x","o","x"],
    ["x","x","o"],
    ["o","x","x"]
]
//print(board[0][1])


//MARK: 12.2  : n elemanlı a dizisini küçükten büyüğe sıralayan algoritma

func kucuktenBuyugeBubbleSort(elemanlar: [Int]) -> [Int] {
    var siraliDizi = elemanlar
    
    for i in 0..<siraliDizi.count {
        for j in 0..<siraliDizi.count - 1 - i {
            if siraliDizi[j] > siraliDizi[j+1] {
                let temp = siraliDizi[j]
                siraliDizi[j] = siraliDizi[j+1]
                siraliDizi[j+1] = temp
            }
        }
    }
    return siraliDizi
}

print(kucuktenBuyugeBubbleSort(elemanlar: [5, 11, 8,-1]))
// [5, 8, 11]



//MARK: 12.6 : n elemanlı A dizisini küçükten büyüğe Insertion Sort
func kucuktenBuyugeInsertionSort(elemanlar: [Int]) -> [Int] {
    var siraliDizi = elemanlar
    
    for i in 1..<siraliDizi.count {
        let mevcutEleman = siraliDizi[i]
        var j = i - 1
        
        // Soldaki eleman sağındakinden büyükse
        while j >= 0 && siraliDizi[j] > mevcutEleman {
            siraliDizi[j + 1] = siraliDizi[j]
            j -= 1
        }
        
        // mevcutEleman'ı doğru boşluğa yerleştir
        siraliDizi[j + 1] = mevcutEleman
    }
    
    return siraliDizi
}

print(kucuktenBuyugeInsertionSort(elemanlar: [5, 11, 8,-1]))
// [5, 8, 11]


//MARK: 13.1 : LINEAR SEARCH
//n elemanlı A dizisi içinindeki istenen degeri Linear Search ile bul

func linearSearch(dizi : [Int],istenenSayi : Int)->Bool{
    var bulunduMu : Bool = false
    
    for i in 0..<dizi.count{
        if istenenSayi == dizi[i]{
            bulunduMu = true
            break
        }
    }
    return bulunduMu
}

print(linearSearch(dizi: [5,11,2,6,2,8], istenenSayi: 2))

//MARK: 13.3 BINARY SEARCH
//n elemanlı A dizisi içinindeki istenen degeri Binary Search ile bul(indexini)

func binarySearch(dizi: [Int], aranan: Int) -> Int {
    var sol = 0
    var sag = dizi.count - 1
    
    while sol <= sag {
        let orta = (sol + sag) / 2
        
        if dizi[orta] == aranan {
            return orta //index'i döndür
        } else if dizi[orta] < aranan {
            sol = orta + 1 // aranan sağ yarıda
        } else {
            sag = orta - 1 // aranan sol yarıda
        }
    }
    
    return -1 // bulunamadı
    
}
let siraliDizi = [2, 5, 8, 11, 17, 23, 38, 45]
print(binarySearch(dizi: siraliDizi, aranan: 23)) // Indexini döndürf
