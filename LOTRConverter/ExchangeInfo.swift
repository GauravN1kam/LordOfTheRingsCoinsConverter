import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                Text("Here at the Prancing pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper we realized it had no value to use. Below is a simple guide to our currency exchnage rates:")
                    .font(.title3)
                    .padding()
                
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold piece = 4 gold pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, text: "1 golden penny = 4 silver pieces", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, text: "1 silver piece = 4 silver pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, text: "1 silver penny = 100 copper pennies", rightImage: .copperpenny)
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}


