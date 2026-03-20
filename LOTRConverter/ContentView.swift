import SwiftUI

struct ContentView: View {
    
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    @FocusState var leftTyping
    @FocusState var rightTyping
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchnage")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack{
                    VStack {
                        
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount){
                                if leftTyping {
                                    rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
                                }
                            }
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount){
                                if rightTyping {
                                    leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
                                }
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                Spacer()
                
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                    .padding(.trailing)
                    
                }
            }
            .sheet(isPresented: $showExchangeInfo){
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency){
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
        }
    }
}

#Preview {
    ContentView()
}
