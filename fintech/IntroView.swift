//
//  IntroView.swift
//  fintech
//
//  Created by Jerry Polyansky on 09.07.2022.
//

import SwiftUI
import Magnetic

public struct NewMagneticView_SwiftUI: UIViewRepresentable {
    @Binding var nodes: [Node]
    
    public func makeUIView(context: Context) -> MagneticView {
        let view = MagneticView.init(frame: .init(x: 0, y: 0, width: 600, height: 600))
        view.magnetic.view?.showsNodeCount = true
        
        return view
    }
    public func updateUIView(_ uiView: MagneticView, context: Context) {
        
        nodes.forEach { node in
            uiView.magnetic.addChild(node)
        }
    }
}

struct IntroView: View {
    
    @State var showAlert = false
    @State var newCategoryName = ""
    
    var body: some View {
        NavigationView {
            VStack {
//                Rectangle() //
                MagneticSubview()
                HStack (alignment: .center)  {
                    Spacer()
                    
                    Button ("Добавить категорию") {
                        showAlert = true
                    }.alert("Новая категория", isPresented: $showAlert, actions:  {
                        TextField("Имя категории", text: $newCategoryName)
                        
                        Button("Добавить", action: {})
                        Button("Отмена", role: .cancel, action: {})
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: SettingsView(rows: SettingsRow.settings())) {
                        Text("Готово")
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            .navigationTitle("Категории трат")
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

struct MagneticSubview: View {
    @State var nodes: [Node] = []
    
    var size = 45.0
    
    var body: some View {
        NewMagneticView_SwiftUI.init(nodes: $nodes)
            .onAppear() {
                nodes = [.init(text: "Уход за собой",
                               image: nil,
                               color: .fromRGB(0xFFD7E8),
                               radius: size),
                         .init(text: "Животные",
                               image: nil,
                               color: .fromRGB(0xF08A51),
                               radius: size),
                         .init(text: "Продукты",
                               image: nil,
                               color: .fromRGB(0x82CC25),
                               radius: size),
                         .init(text: "Товары для дома",
                               image: nil,
                               color: .fromRGB(0x7E9DEE),
                               radius: size),
                         .init(text: "Аптеки",
                               image: nil,
                               color: .fromRGB(0x319581),
                               radius: size),
                         .init(text: "Одежда",
                               image: nil,
                               color: .fromRGB(0xAF3762),
                               radius: size),
                         .init(text: "Игры",
                               image: nil,
                               color: .fromRGB(0xAF2CFF),
                               radius: size),
                         .init(text: "Автомобили",
                               image: nil,
                               color: .fromRGB(0xC20000),
                               radius: size),
                         .init(text: "Электроника",
                               image: nil,
                               color: .fromRGB(0x1611FF),
                               radius: size),
                         .init(text: "Еда",
                               image: nil,
                               color: .fromRGB(0xFFE600),
                               radius: size),
                         .init(text: "Косметика",
                               image: nil,
                               color: .fromRGB(0xFF7898),
                               radius: size)
                ]
            }
    }
}

extension UIColor {
    static func fromRGB(_ rgbValue: Int) -> UIColor! {
        return UIColor(
            red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
            green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
            blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
            alpha: 1.0)
    }
}

