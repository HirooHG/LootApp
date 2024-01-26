//
//  OnboardingScreenView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/26/24.
//

import SwiftUI

struct OnboardingScreenView: View {
    let actionGs: () -> Void
    @State var selectedPage = 0
    
    var body: some View {
        TabView(selection: $selectedPage) {
            OnboardingView(
                title: "Gérer ses loots",
                color: Color.blue,
                descriptions: "Ajoutez facilement vos trouvaillest vos achats à votre collection personnelle.",
                icon: "gym.bag",
                actionName: "Suivant",
                action: {
                    selectedPage = 1
                }
            ).tag(0)
            OnboardingView(
                title: "Votre wishlist",
                color: Color.purple,
                descriptions: "Créez une liste de souhaits pour garder une trace des articles que vous voulez acquérir.",
                icon: "wand.and.stars.inverse",
                actionName: "Suivant",
                action: {
                    selectedPage = 2
                }
            ).tag(1)
            OnboardingView(
                title: "En un coup d'oeil",
                color: Color.yellow,
                descriptions: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de votre appareil",
                icon: "iphone.case",
                actionName: "Commencer",
                action: actionGs
            ).tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingScreenView(actionGs:  {})
        .preferredColorScheme(.light)
        .previewDisplayName("Light Mode")
}

#Preview {
    OnboardingScreenView(actionGs:  {})
        .preferredColorScheme(.dark)
        .previewDisplayName("Dark Mode")
}
