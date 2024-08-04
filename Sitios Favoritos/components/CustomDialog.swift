//
//  dialog.swift
//  Sitios Favoritos
//
//  Created by Hernán Rodríguez on 4/8/24.
//

import SwiftUI

struct CustomDialog<Content: View>: View {
    
    let closeDialog: () -> Void
    let onDismissOutside: Bool
    let content: Content
    
    
    var body: some View {
        ZStack{
            Rectangle().fill(.gray.opacity(0.7)).ignoresSafeArea().onTapGesture {
                if onDismissOutside {
                    withAnimation{
                        closeDialog()
                    }
                }
            }
            content
                .frame(width: UIScreen.main.bounds.size.width-100, height: 300)
                .padding()
                .background(.white)
                .cornerRadius(16)
                .overlay(alignment: .topTrailing){
                    Button(action: {
                        withAnimation{
                            closeDialog()
                        }
                    }) {
                        Image(systemName: "xmark.circle")
                    }.foregroundColor(.gray).padding(16)
                }
            
        }.ignoresSafeArea().frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
    }
}

struct CustomDialog_Previews: PreviewProvider {
    static var previews: some View {
        CustomDialog(
            closeDialog: { print("Cerrar diálogo") },
            onDismissOutside: true,
            content: Text("Contenido del diálogo")
                .padding()
        )
    }
}
