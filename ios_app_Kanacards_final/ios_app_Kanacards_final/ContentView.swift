//
//  ContentView.swift
//  ios_app_Kanacards_final
//
//  Created by Nacho on 19/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var valor: Int = 0
    @State var contador: [Int] = [0,0]
    @State var miKanas = Kanas(valor: 0)
    @State var miNumero = numeroAleatirio()
    @Environment(\.verticalSizeClass) var sizeClass
    
    var body: some View {
        
        VStack() {
            
            if sizeClass == .regular {
        
                Spacer()
                
                Picker(selection: $valor, label: Text("seleccion")) {
                    Text("Hirigana")
                        .tag(0)
                    Text("Katakana")
                        .tag(1)
                }
                .onChange(of: valor) { nuevoValor in
                                miKanas = Kanas(valor: valor)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .font(.system(size: 60))
                .padding()
                
                Spacer()
                
                Text(miKanas.0[miNumero])
                    .font(.system(size: 200))

                Spacer()
                
                HStack() {
                
                    Button(miKanas.1[0]) {
                        contador = aciertosFallos(numBoton: 0, numAleatorio: miNumero, aciertos: contador[0], fallos: contador[1])
                    
                        miKanas = Kanas(valor: valor)
                        miNumero = numeroAleatirio()
                    }
                    .font(.system(size: 50))
                    .padding()
                
                    Button(miKanas.1[1]) {
                        contador = aciertosFallos(numBoton: 1, numAleatorio: miNumero, aciertos: contador[0], fallos: contador[1])
                    
                        miKanas = Kanas(valor: valor)
                        miNumero = numeroAleatirio()
                    }
                    .font(.system(size: 50))
                    .padding()
            
                    Button(miKanas.1[2]) {
                        contador = aciertosFallos(numBoton: 2, numAleatorio: miNumero, aciertos: contador[0], fallos: contador[1])
                    
                        miKanas = Kanas(valor: valor)
                        miNumero = numeroAleatirio()
                    }
                    .font(.system(size: 50))
                    .padding()
                }
                
                HStack() {
                
                    Label("\(contador[0])", systemImage:"")
                        .font(.system(size: 40))
                        .foregroundColor(.green)
                        .padding()
                
                    Label("\(contador[1])", systemImage: "")
                        .font(.system(size: 40))
                        .foregroundColor(.red)
                        .padding()
                }
                
            } else if sizeClass == .compact {
        
                Picker(selection: $valor, label: Text("seleccion")) {
                    Text("Hirigana")
                        .tag(0)
                    Text("Katakana")
                        .tag(1)
                }
                .onChange(of: valor) { nuevoValor in
                                miKanas = Kanas(valor: valor)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .font(.system(size: 30))
                    .padding(.init(top: 80, leading: 10, bottom: 0, trailing: 40))

                Text(miKanas.0[miNumero])
                    .font(.system(size: 120))
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 40))
                
                HStack() {
                    
                    Button(miKanas.1[0]) {
                            contador = aciertosFallos(numBoton: 0, numAleatorio: miNumero, aciertos: contador[0], fallos: contador[1])
                        
                        miKanas = Kanas(valor: valor)
                        miNumero = numeroAleatirio()
                    }
                    .font(.system(size: 50))
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 40))
                    
                    Button(miKanas.1[1]) {
                            contador = aciertosFallos(numBoton: 1, numAleatorio: miNumero, aciertos: contador[0], fallos: contador[1])
                        
                        miKanas = Kanas(valor: valor)
                        miNumero = numeroAleatirio()
                    }
                    .font(.system(size: 50))
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 40))
                
                    Button(miKanas.1[2]) {
                            contador = aciertosFallos(numBoton: 2, numAleatorio: miNumero, aciertos: contador[0], fallos: contador[1])
                        
                        miKanas = Kanas(valor: valor)
                        miNumero = numeroAleatirio()
                    }
                    .font(.system(size: 50))
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 40))
                    
                }
                .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 40))
                   
                HStack() {
                    
                    Label("\(contador[0])", systemImage:"")
                        .font(.system(size: 40))
                        .foregroundColor(.green)
                        .padding(.init(top: 0, leading: 10, bottom: 20, trailing: 40))
                
                    Label("\(contador[1])", systemImage: "")
                        .font(.system(size: 40))
                        .foregroundColor(.red)
                        .padding(.init(top: 0, leading: 10, bottom: 20, trailing: 40))
                }
                .padding(.init(top: 0, leading: 10, bottom: 40, trailing: 40))
            }
        }
    }
}

func Kanas (valor: Int) -> ([String], [String]) {
    var rom: [String] = []
    let kan = romaji(aleatorios: 3, valor)
    
    for r in 0..<kan.count {
        rom.append(convertir(romaji: kan[r], silabarioActual(opcion: valor)))
    }
   
    return (kan, rom)
}

func numeroAleatirio() -> Int {
    return Int.random(in: 0...2)
}

func aciertosFallos(numBoton: Int, numAleatorio: Int, aciertos: Int, fallos: Int) -> [Int]{
    
    var miContador: [Int] = []
  
    if numBoton == numAleatorio {
        miContador.append(aciertos + 1)
        miContador.append(fallos)

    } else {
        miContador.append(aciertos)
        miContador.append(fallos + 1)
    }

    return miContador
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
