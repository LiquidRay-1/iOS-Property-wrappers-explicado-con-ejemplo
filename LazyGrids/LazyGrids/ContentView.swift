//
//  ContentView.swift
//  LazyGrids
//
//  Created by dam2 on 26/2/24.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var counter = 0 ///Con Published se le dice a la vista que la variable ha cambiado
}

struct View1: View {
    @StateObject var viewModel = ViewModel() ///No pertenecena una vista y además posee un objeto de estado y normalmente se pasa a través del entorno, es buena idea ponerle de nombre viewModel y acompañado de que es lo que representa.
    var body: some View {
        VStack {
            Text("Contador: \(viewModel.counter)")
                .bold()
                .font(.largeTitle)
            Text("Vista 1")
            //View2(viewModel: viewModel)
        }
        .padding()
        .environmentObject(viewModel) ///Gracias a esto tenemos cualquier variables que se introduzca en cualquier vista del proyecto.
    }
}

struct View2: View {
    //@ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack{
            Text("Vista 2")
            //View3(viewModel: viewModel)
        }
    }
}

struct View3: View {
    @EnvironmentObject var viewModel: ViewModel ///Con esto SwiftUI busca entre todo los objetos de entorno y busca la variable a la que hacemos referencia.
    var body: some View {
        VStack{
            Text("Vista 3")
            Button("Pulsame", action: {
                print("Botón pulsado")
                viewModel.counter += 1
            })
        }
    }
}

#Preview {
    View1()
}

#Preview {
    //View2(viewModel: ViewModel())
    ///Gracias a las variables de entorno no hace falta instaciar las variables dentro de la preview.
    View2()
}

#Preview{
    //View3(viewModel: ViewModel())
    ///Gracias a las variables de entorno no hace falta instaciar las variables dentro de la preview.
    View3()
}
