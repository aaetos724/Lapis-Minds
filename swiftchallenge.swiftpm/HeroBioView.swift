import SwiftUI



struct HeroBioView: View {
    let hero: Scholar

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(hero.name)
                        .font(.custom("Courier", size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    
                    Text(hero.area)
                        .font(.custom("Courier", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Divider().background(Color.white.opacity(0.3))
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("English History")
                            .font(.headline)
                            .foregroundColor(.yellow)
                        Text(hero.bioEn)
                            .font(.custom("Courier", size: 18))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    
             
                    VStack(alignment: .trailing, spacing: 10) {
                        Text("داستان به فارسی")
                            .font(.headline)
                            .foregroundColor(.yellow)
                        Text(hero.bioFarsi)
                            .font(.custom("Courier", size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding(30)
            }
        }
    }
}
