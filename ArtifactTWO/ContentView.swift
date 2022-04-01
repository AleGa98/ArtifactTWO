//
//  ContentView.swift
//  ArtifactTWO
//
//  Created by Alessandro Gallo on 31/03/22.
//

import SwiftUI

struct ContentView: View {
    var paint =  Paint(name: "", image: "quadro")
    
    var body: some View {
        ZStack{
            
            Image(paint.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text("01/04/2022")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
                
        }
        .padding()
              
    }
     
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct  Paint : Identifiable {
   
    let id = UUID()
    let name :  String
    let image:  String
    

    
}
