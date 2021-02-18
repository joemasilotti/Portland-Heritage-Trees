import SwiftUI

struct HeritageTreeNameView: View {
    let viewModel: HeritageTreeViewModel

    @State private var showingSafari = false

    var body: some View {
        if let url = viewModel.wikipediaURL {
            Button(action: { showingSafari = true }) {
                HStack {
                    content
                    Spacer()
                    Image(systemName: "arrow.up.forward.app")
                        .foregroundColor(.gray)
                }
            }
            .sheet(isPresented: $showingSafari) {
                SafariView(url: url)
            }
        } else {
            content
        }
    }

    private var content: some View {
        VStack(alignment: .leading) {
            Text(viewModel.commonName)
                .font(.title)
            Text(viewModel.scientificName)
                .font(.title3)
                .foregroundColor(.mutedText)
        }
    }
}

struct HeritageTreeNameView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeNameView(viewModel: HeritageTreeViewModel.preview)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
