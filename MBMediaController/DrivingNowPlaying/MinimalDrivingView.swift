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
            .font(.system(size: 80, weight: .ultraLight, design: .default))
            .symbolVariant(.fill)
            .foregroundStyle(.quaternary)
            .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
            .background {
                ContainerRelativeShape()
                    .foregroundStyle(.quaternary)
                    .opacity(0.4)
                    .overlay {
                        ContainerRelativeShape()
                            .stroke(.quaternary, lineWidth: 2)
                    }
            }
            .containerShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
    }
}

struct MinimalDrivingView: View {
    @EnvironmentObject var mediaController: MediaController
    @Orientation var deviceOrientation: UIDeviceOrientation

    var body: some View {
        VStack(spacing: 20) {
            MediaControlButtons()
            NowPlayingTitleAndArtwork()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background {
            Color.black.ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }

    @ViewBuilder func NowPlayingTitleAndArtwork() -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.quaternary)
                .frame(width: 60)
                .overlay {
                    Image(systemName: "airplayaudio")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

            VStack(alignment: .leading) {
                Text("Track Title Track Title Here")
                    .font(.title2)
                    .foregroundStyle(.secondary)

                Text("Artist Name Goes Here")
                    .font(.title3)
                    .foregroundStyle(.tertiary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder func MediaControlButtons() -> some View {
        Group {
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
