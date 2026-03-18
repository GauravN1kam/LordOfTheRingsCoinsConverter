import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    var body: some View {
                
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(Currency.allCases) { i in
                if(i == currency)
                {
                    CurrencyIcon(currencyIcon: i.image , currencyName: i.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }
                else{
                    CurrencyIcon(currencyIcon: i.image , currencyName: i.name)
                        .onTapGesture {
                            self.currency = i
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currency: Currency = .silverPenny
    IconGrid(currency: $currency)
}
