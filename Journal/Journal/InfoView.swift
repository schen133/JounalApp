//
//  InfoView.swift
//  Journal
//
//  Created by Sifeng Chen on 11/20/22.
//

//Display application name and etc. Using provided Bundle+
import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            Spacer()

            Text(Bundle.main.displayName ?? "")
                .font(.largeTitle)
                .fontWeight(.medium)
            Text(Bundle.main.version ?? "")
                .font(.title)
                .fontWeight(.medium)
            Text(Bundle.main.build ?? "")
                .font(.caption)
            Spacer()

            Text(Bundle.main.copyright ?? "")
                .font(.caption2)
        }
        .padding()
    }

}
