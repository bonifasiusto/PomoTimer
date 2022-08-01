//
//  ContentView.swift
//  PomoTimer
//
//  Created by Bonifasius Toto Neguisa Ginting on 21/07/22.
//

import SwiftUI

struct HomeView: View {
    @State var indexState = 0
    var screenSize: CGSize
    @State var offset: CGFloat = 0
    @StateObject var pomodoroModel: PomodoroModel = .init()
    var body: some View {
        NavigationView{
            VStack{
                Button {
                    
                } label: {
                    Image("PomotimerLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 193, height: 100)
                }.padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                OffsetPageTabView(offset: $offset) {
                    
                    HStack(spacing: 0){
                        ForEach(intros){
                            intro in
                            
                            VStack{
                                Image(intro.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: screenSize.height / 3)
                                
                                VStack(alignment: .leading, spacing: 5){
                                    
                                    Text(intro.title)
                                        .font(.largeTitle.bold())
                                    
                                    Text(intro.description)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.secondary)
                                }
                                .foregroundStyle(.white)
                                .padding(.top, 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }.padding()
                            
                            
                            // Atur max lebar
                                .frame(width: screenSize.width)
                        }
                    }
                    
                }
                
                // Animasi indikator page
                HStack(alignment: .bottom){
                    
                    // Indikator
                    HStack(spacing: 12){
                        
                        ForEach(intros.indices,id: \.self){ index in
                            
                            Capsule()
                                .fill(.white)
                            // increase width for only current index
                                .frame(width: getIndex() == index ? 20 : 7, height: 7)
                            
                        }
                        
                    }
                    .overlay(
                        
                        Capsule()
                            .fill(.white)
                            .frame(width: 20, height: 7)
                            .offset(x: getIndicatorOffset())
                        
                        ,alignment: .leading
                    )
                    .offset(x: 1 , y: -15)
                    
                    Spacer()
                    
                    // MARK: Nambah logic buat pass ke timer
                    if indexState == (intros.count - 1){
                        NavigationLink(destination: ContentTimerView().environmentObject(pomodoroModel)){
                            Image(systemName: "chevron.right")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .padding(11)
                                .background(
                                    Circle().fill(intros[getIndex()].color)
                                )
                        }
                    } else {
                        Button {
                            
                            // update untuk offset
                            let index = min(getIndex() + 1, intros.count - 1)
                            offset = CGFloat(index) * screenSize.width
                            indexState = getIndex()
                            print(indexState)
                        }
                        
                    label: {
                        Image(systemName: "chevron.right")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .padding(11)
                            .background(
                                
                                //                            intros[getIndex()].color,
                                //                            in: Circle()
                                Circle().fill(intros[getIndex()].color)
                            )
                    }
                        
                    }
                    
                }
                .padding()
                .offset(y: -20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            // Animating when index change
            .animation(.easeInOut, value: getIndex())
            .background(Color("BackgroundColor"))}}
    
    // offset untuk indikator
    func getIndicatorOffset() -> CGFloat {
        
        let progress = offset / screenSize.width
        
        // 12 = spacing , 7 = size buletan
        let maxWidth: CGFloat = 12 + 7
        return progress * maxWidth
        
    }
    
    // Expading index based on offset
    
    func getIndex()-> Int {
        
        let progress = round(offset / screenSize.width)
        
        // Biar getIndex aman
        let index = min(Int(progress), intros.count - 1)
        return index
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

