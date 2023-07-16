//
//  ContentView.swift
//  ChordConnections
//
//  Created by Artem on 16.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        var xInitial = 50
        var yInitial = 50
        var xFinal = 350
        var yFinal = 380
        var radius = 15
        var vInterval = (yFinal - yInitial)/6
        var hInterval = (xFinal - xInitial)/5
        var chord = [-1, 3, 2, 4, 3, -1]
        var notes = [Int]()
        ZStack{
            Color(.gray)
                .ignoresSafeArea()
            VStack {
                
                Text("My Awesome Chord")
                    .font(.largeTitle)
                Path { path in
                    
                    path.move(to: CGPoint(x: xInitial, y: yInitial))
                    path.addLine(to: CGPoint(x: xFinal, y: yInitial))
                    path.addLine(to: CGPoint(x: xFinal, y: yFinal))
                    path.addLine(to: CGPoint(x: xInitial, y: yFinal))
                    path.addLine(to: CGPoint(x: xInitial, y: yInitial))
                    
                    //Border
                    
                    path.move(to: CGPoint(x: xInitial, y: yInitial + vInterval))
                    path.addLine(to: CGPoint(x: xFinal, y: yInitial + vInterval))
                    path.move(to: CGPoint(x: xInitial, y: yInitial + 2*vInterval))
                    path.addLine(to: CGPoint(x: xFinal, y: yInitial + 2*vInterval))
                    path.move(to: CGPoint(x: xInitial, y: yInitial + 3*vInterval))
                    path.addLine(to: CGPoint(x: xFinal, y: yInitial + 3*vInterval))
                    path.move(to: CGPoint(x: xInitial, y: yInitial + 4*vInterval))
                    path.addLine(to: CGPoint(x: xFinal, y: yInitial + 4*vInterval))
                    path.move(to: CGPoint(x: xInitial, y: yInitial + 5*vInterval))
                    path.addLine(to: CGPoint(x: xFinal, y: yInitial + 5*vInterval))
                    path.addLine(to: CGPoint(x: xFinal, y: yInitial + 4*vInterval))
                    path.move(to: CGPoint(x: xInitial, y: yInitial + 6*vInterval))
                    
                    
                    path.move(to: CGPoint(x: xInitial + hInterval, y: yInitial))
                    path.addLine(to: CGPoint(x: xInitial + hInterval, y: yFinal))
                    path.move(to: CGPoint(x: xInitial + 2*hInterval, y: yInitial))
                    path.addLine(to: CGPoint(x: xInitial + 2*hInterval, y: yFinal))
                    path.move(to: CGPoint(x: xInitial + 3*hInterval, y: yInitial))
                    path.addLine(to: CGPoint(x: xInitial + 3*hInterval, y: yFinal))
                    path.move(to: CGPoint(x: xInitial + 4*hInterval, y: yInitial))
                    path.addLine(to: CGPoint(x: xInitial + 4*hInterval, y: yFinal))
                    
                    
                    for i in 0...5 {
                        if chord[i] != -1 {
                            
                            notes.append(yInitial + (2 * chord[i] - 1) * hInterval/2)
                        }
                    }
                    

                    for i in 0...5 {
                        if chord[i] != -1 {
                            path.move(to: CGPoint(x: xInitial + i*hInterval + radius, y: yInitial + notes[i]))
                            path.addArc(center: CGPoint(x: xInitial + i*hInterval, y: yInitial + notes[i]), radius: CGFloat(radius), startAngle: Angle(degrees: 0), endAngle:Angle(degrees: 360), clockwise: true)

                        }
                    }
                }
                .stroke(Gradient(colors: [.black,.blue]), lineWidth: 5)
                
                
            }
            
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
