//
//  OnboardingView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/26/24.
//

import SwiftUI

struct OnboardingView: View {
    let title: String
    let color: Color
    let descriptions: String
    let icon: String
    let actionName: String
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(title)
                .multilineTextAlignment(.center)
                .fontWeight(.black)
                .font(.system(size: 60))
            Spacer()
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 100))
                .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
                .background(color)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Spacer()
            Text(descriptions)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .fontWeight(Font.Weight.regular)
                .padding()
            Spacer()
            Button(action: action, label: {
                Text(actionName)
                    .foregroundStyle(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
            })
            .padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            Spacer()
        }
    }
}

#Preview {
    OnboardingView(
        title: "En un coup d'oeil",
        color: Color.yellow,
        descriptions: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de votre appareil",
        icon: "iphone.case",
        actionName: "Commencer",
        action: {}
    )
}

