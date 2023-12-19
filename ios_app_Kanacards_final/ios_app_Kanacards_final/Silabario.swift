//
//  Silabario.swift
//  ios-app-Kanacards
//
//  Created by Inés Larrañaga Fernández de Pinedo on 3/11/23.
//

import Foundation

// REF: Kana chart: https://en.wikibooks.org/wiki/Japanese/Kana_chart
// REF: Silabarios: https://japonesca.com/hiragana-katakana-kanji-y-romaji/

let hiragana_basico = [
    "あ": "a", "い": "i", "う": "u", "え": "e", "お": "o",
    "か": "ka", "き": "ki", "く": "ku", "け": "ke", "こ": "ko",
    "さ": "sa", "し": "shi", "す": "su", "せ": "se", "そ": "so",
    "た": "ta", "ち": "chi", "つ": "tsu", "て": "te", "と": "to",
    "な": "na", "に": "ni", "ぬ": "nu", "ね": "ne", "の": "no",
    "は": "ha", "ひ": "hi", "ふ": "fu", "へ": "he", "ほ": "ho",
    "ま": "ma", "み": "mi", "む": "mu", "め": "me", "も": "mo",
    "や": "ya", "ゆ": "yu", "よ": "yo",
    "ら": "ra", "り": "ri", "る": "ru", "れ": "re", "ろ": "ro",
    "わ": "wa", "を": "wo",
    "ん": "n",
]

let katakana_basico = [
    "ア": "a", "イ": "i", "ウ": "u", "エ": "e", "オ": "o",
    "カ": "ka", "キ": "ki", "ク": "ku", "ケ": "ke", "コ": "ko",
    "サ": "sa", "シ": "shi", "ス": "su", "セ": "se", "ソ": "so",
    "タ": "ta", "チ": "chi", "ツ": "tsu", "テ": "te", "ト": "to",
    "ナ": "na", "ニ": "ni", "ヌ": "nu", "ネ": "ne", "ノ": "no",
    "ハ": "ha", "ヒ": "hi", "フ": "fu", "ヘ": "he", "ホ": "ho",
    "マ": "ma", "ミ": "mi", "ム": "mu", "メ": "me", "モ": "mo",
    "ヤ": "ya", "ユ": "yu", "ヨ": "yo",
    "ラ": "ra", "リ": "ri", "ル": "ru", "レ": "re", "ロ": "ro",
    "ワ": "wa", "ヲ": "wo",
    "ン": "n",
]


enum Silabario {
    case hiragana
    case katakana
}

func silabarioActual(opcion: Int) -> Silabario {

    if opcion == 0 {
        return .hiragana
    } else {
        return .katakana
    }
}

func convertir(romaji:String, _ silabario:Silabario)->String{
    switch silabario{
    case .katakana:
        return katakana_basico[romaji] ?? "?"
    case .hiragana:
        return hiragana_basico[romaji] ?? "?"
    }
}

func romaji(aleatorios:Int,_ silabario:Int)->[String]{
    var romaji:[String]=[]
    var temp=hiragana_basico
    switch silabario{
    case 0:
         temp = hiragana_basico
    case 1:
         temp = katakana_basico
    default:
        temp = hiragana_basico
    }
    
    for _ in 1...aleatorios{
        let aleatorio = temp.randomElement()!.key
        romaji.append(aleatorio)
        temp[aleatorio]=nil
    }
    return romaji
}
