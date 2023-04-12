import SwiftUI

struct ContentView: View {
    
    let wwdcDate = Date(timeIntervalSince1970: 1681973940)
    
    @State private var milliseconds: Int = 0
    @State private var seconds: Int = 0
    @State private var minutes: Int = 0
    @State private var hours: Int = 0
    @State private var days: Int = 0
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Image("wwdc")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                Text("WWDC23")
                    .font(.system(size: 80, weight: .medium))
                    .multilineTextAlignment(.center)
                
                Text("Swift Student Challenge")
                    .font(.system(size: 100, weight: .bold))
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    VStack {
                        Text("\(days)")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                        Text("days")
                    }
                    
                    Rectangle().frame(width: 0.5).padding(.vertical, 32).frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack {
                        Text("\(hours)")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                        Text("hours")
                    }
                    
                    Rectangle().frame(width: 0.5).padding(.vertical, 32).frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack {
                        Text("\(minutes)")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                        Text("minutes")
                    }
                    
                    Rectangle().frame(width: 0.5).padding(.vertical, 32).frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack {
                        Text("\(seconds)")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                        Text("seconds")
                    }
                    
                    Rectangle().frame(width: 0.5).padding(.vertical, 32).frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack {
                        Text("\(milliseconds)")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                        Text("milliseconds")
                    }
                    
                }
                .frame(width: 800, height: 100)
                .scaleEffect(2)
                
                Spacer()
                
                Text("good luck")
                    .font(.largeTitle)
                    .padding(.bottom, 32)
            }
            .foregroundColor(.white)
        }
        .onReceive(timer) { _ in
            calculateDate()
        }
    }
    
    func calculateDate() {
        let calendar = Calendar.current
        let now = Date()

        let rawDays = calendar.dateComponents([.day], from: now, to: wwdcDate).day ?? 0
        let rawHours = (calendar.dateComponents([.hour], from: now, to: wwdcDate).hour ?? 0)
        let rawMinutes = (calendar.dateComponents([.minute], from: now, to: wwdcDate).minute ?? 0)
        let rawseconds = (calendar.dateComponents([.second], from: now, to: wwdcDate).second ?? 0)
        
        days = calendar.dateComponents([.day], from: now, to: wwdcDate).day ?? 0
        hours = (calendar.dateComponents([.hour], from: now, to: wwdcDate).hour ?? 0) - rawDays * 24
        minutes = (calendar.dateComponents([.minute], from: now, to: wwdcDate).minute ?? 0) - (rawHours * 60)
        seconds = (calendar.dateComponents([.second], from: now, to: wwdcDate).second ?? 0) - rawMinutes * 60
        milliseconds = Int(wwdcDate.timeIntervalSince(now) * 1000) - rawseconds * 1000
    }
}
