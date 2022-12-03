//
//  LoginVie.swift
//  kalliJaeb
//
//  Created by Krishna Venkatramani on 03/12/2022.
//

import Foundation
import SwiftUI
import SUI
import web3

struct LoginView: View {
    
    @State var `continue`: Bool = false
    struct Constants {
        static let textConfig: CustomTextFieldConfig = .init(accentColor: .textColor.opacity(0.15), foregroundColor: .textColor, font: Font(CustomFonts.medium.fontBuilder(size: 15) ?? .systemFont(ofSize: 15)), insets: .init(vertical: 10, horizontal: 15), placeHolder: "Passphrase".medium(size: 15), borderColor: .surfaceBackgroundInverse, borderWidth: 1, cornerRadius: 8)
    }
    
    func testingWeb3() {
        
//        EthereumAccount.importAccount(addingTo: <#T##EthereumMultipleKeyStorageProtocol#>, privateKey: <#T##String#>, keystorePassword: <#T##String#>)
        let keyStorage = EthereumKeyLocalStorage()
        let account = try? EthereumAccount.create(replacing: keyStorage, keystorePassword: "MY_PASSWORD")
        print("(DEBUG) account : ", account?.address.value)
    }
    
    var body: some View {
        ZStack {
            Color.surfaceBackground
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                "Login".bold(size: 30)
                    .text
                
                "Enter your Passphrase!".bold(size: 20)
                    .text
                
                Spacer()
                
                CustomTextField(config: Constants.textConfig) {
                    print("(DEBUG) value: ", $0)
                } searchOnCommit: {
                    print("(DEBUG) value: ", $0)
                    `continue`.toggle()
                }
                .padding(.bottom, 20)
                
                Button(text: "Continue", config: .auto(background: .green)) {
                    print("(DEBUG) clicked on continue!")
                    self.testingWeb3()
                }
                .slideIn(show: `continue`, direction: .bottom)
                .fillWidth(alignment: .bottomTrailing)
            }.padding(.init(by: 10))
        }
    }
    
}
