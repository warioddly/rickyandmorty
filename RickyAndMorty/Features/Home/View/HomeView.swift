//
//  HomeView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 23/2/25.
//
import SwiftUI


struct TabViewItem: Identifiable{
    let id = UUID()
    let icon: String
    let label: String
    let view: AnyView
    
    init<V: View>(icon: String, label: String, view: V) {
        self.icon = icon
        self.label = label
        self.view = AnyView(view)
    }
}

struct HomeView: View {
    
    let tabViewItems = [
        TabViewItem(icon: "person.fill", label: "Characters", view: CharactersView()),
        TabViewItem(icon: "heart.fill", label: "Episodes", view: EpisodesView()),
        TabViewItem(icon: "location.circle.fill", label: "Locations", view: LocationsView()),
    ]
    
    var body: some View {
        TabView {
            ForEach(tabViewItems) { item in
                item.view
                    .tabItem {
                        Image(systemName: item.icon)
                        Text(item.label)
                    }
            }
        }
    }
    
}


#Preview {
    HomeView()
}
