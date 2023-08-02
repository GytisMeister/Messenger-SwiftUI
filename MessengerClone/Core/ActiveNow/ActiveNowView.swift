//
//  ActiveNowView.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-07-31.
//

import SwiftUI

struct ActiveNowView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 32) {
                ForEach(0 ... 10, id: \.self) { user in
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            CircularProfileImageView(user: User.Mock_User, size: .medium)
                            
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 18, height: 18)
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width: 12, height: 12)
                            }
                        }
                        Text("Bruce Wayne")
                            .font(.subheadline)
                            .foregroundColor(Color(.systemGray))
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}
