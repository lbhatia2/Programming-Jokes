//
//  ContentView.swift
//  Programming Jokes
//
//  Created by Lina Bhatia on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var jokes = [Joke]()
    var body: some View {
        NavigationView{
            List(jokes){joke in
                NavigationLink(destination: Text(joke.punchline)
                    .padding()){
                        Text(joke.setup)
                    }
            }
            .navigationTitle("Programming Jokes ")
        }
        .onAppear(perform: {
            getJokes()
        })
    }
    func getJokes() {
        let apiKey = "?rapidapi-key = (d3536bf3fbmsh8949c2bb1c6d036p1a2ca1jsnad0c31252dbe)"
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Joke: Identifiable {
    let id = UUID()
    var setup = ""
    var punchline = ""
}
