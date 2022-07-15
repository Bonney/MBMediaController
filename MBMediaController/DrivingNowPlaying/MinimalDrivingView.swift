//
//  MinimalDrivingView.swift
//  MBMediaController
//
//  Created by Matt Bonney on 7/14/22.
//

import SwiftUI

struct MDVButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
            .frame(maxWidth: .infinity, maxHeight: 160, alignment: .center)
    }
}

struct MinimalDrivingView: View {
    @EnvironmentObject var mediaController: MediaController
    @Orientation var deviceOrientation: UIDeviceOrientation

    var body: some View {
        VStack {

            MediaControlButtons()
            NowPlayingTitleAndArtwork()

        }
        .padding()
        .frame(maxHeight: .infinity)
        .background {
            LinearGradient(colors: [Color.black, Color.indigo.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }

    @ViewBuilder func NowPlayingTitleAndArtwork() -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.quaternary)
                .frame(width: 80)

            VStack(alignment: .leading) {

                Text("Track Title Track Title Here")
                    .font(.title2)

                Text("Artist Name Goes Here")
                    .font(.title3)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder func MediaControlButtons() -> some View {
        HStack {
            Button { } label : { Image(systemName: "backward") }
            Button { } label : { Image(systemName: "play") }
            Button { } label : { Image(systemName: "forward") }
        }
        .buttonStyle(MDVButtonStyle())
    }
}

struct MinimalDrivingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MinimalDrivingView()
                .environmentObject(MediaController())
        }
    }
}
