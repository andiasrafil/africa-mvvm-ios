//
//  ContentView.swift
//  Africa
//
//  Created by Accounting on 07/07/21.
//

import SwiftUI

struct ContentView: View {
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    
    @State private var isGridViewActive: Bool = false
    
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    @ObservedObject var viewModel = AnimalViewModelImpl(service: AnimalServiceImpl())
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var showAnimalList: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let content):
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(content){ animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalListItemView(animal: animal)
                                })
                        }
                        CreditView().modifier(CenterModifier())
                    }
                }else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, content: {
                            ForEach(content) { item in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: item),
                                    label: {
                                        AnimalGridItemView(animal: item)
                                    })
                            }
                        })
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            case .failed(_):
                Text("failed")
            }
        }
    }
    var body: some View {
        NavigationView {
            Group {
                showAnimalList
//                if !isGridViewActive {
//                    List {
//                        CoverImageView()
//                            .frame(height: 300)
//                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                        ForEach(animals){ animal in
//                            NavigationLink(
//                                destination: AnimalDetailView(animal: animal),
//                                label: {
//                                    AnimalListItemView(animal: animal)
//                                })
//                        }
//                        CreditView().modifier(CenterModifier())
//                    }
//                } else {
//                    showAnimalList
//                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })
                        
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                    }
                }
            }
        }.onAppear(perform: {
            viewModel.getAnimals()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
