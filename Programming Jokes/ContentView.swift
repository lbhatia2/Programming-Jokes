//
//  ContentView.swift
//  Programming Jokes
//
//  Created by Lina Bhatia on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var jokes = [Joke]()
    @State private var showingAlert = false
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
        .alert(isPresented: $showingAlert){
            Alert(title: Text("Loading erorr"),
            message: Text("There was a problem loading the data"),
                  dismissButton: .default(Text("OK")))
        }
    }
    func getJokes() {
        let apiKey = "?rapidapi-key = d3536bf3fbmsh8949c2bb1c6d036p1a2ca1jsnad0c31252dbe"
        let query = "https://dad-jokes.p.rapidapi.com/joke/type/programming\(apiKey)"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                if json["success"] == true {
                    let contents = json["body"].arrayValue
                    for item in contents {
                        let setup = item["setup"].stringValue
                        let punchline = item["punchline"].stringValue
                        let joke = Joke(setup: setup, punchline: punchline)
                        jokes.append(joke)
                    }
                    
                }
                
            }
            
        }
        
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


