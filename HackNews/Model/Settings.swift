//
//  Settings.swift
//  HackNews
//
//  Created by Sai Avinash Vagicherla on 8/27/25.
//

struct Settings {
    var iconTitle: String
    var leftIcon: String
    var rightIcon: String
    
    static func getData() -> [String:[Settings]] {
        return [
            "Network" : [
                Settings(iconTitle: "Airplane Mode", leftIcon: "airplane", rightIcon: "chevron.right"),
                Settings(iconTitle: "Wi-Fi", leftIcon: "wifi", rightIcon: "chevron.right"),
                Settings(iconTitle: "Bluetooth", leftIcon: "phone.connection.fill", rightIcon: "chevron.right"),
                Settings(iconTitle: "Cellular", leftIcon: "antenna.radiowaves.left.and.right", rightIcon: "chevron.right"),
                Settings(iconTitle: "Battery", leftIcon: "battery.100percent", rightIcon: "chevron.right")
            ],
            "General" : [
                Settings(iconTitle: "General", leftIcon: "gearshape", rightIcon: "chevron.right"),
                Settings(iconTitle: "Accessibility", leftIcon: "figure.wave", rightIcon: "chevron.right"),
                Settings(iconTitle: "Camera", leftIcon: "camera", rightIcon: "chevron.right"),
                Settings(iconTitle: "Control Center", leftIcon: "switch.2", rightIcon: "chevron.right"),
                Settings(iconTitle: "Display & Brightness", leftIcon: "textformat.size", rightIcon: "chevron.right"),
                Settings(iconTitle: "Home Screen & App Library", leftIcon: "square.grid.2x2", rightIcon: "chevron.right"),
                Settings(iconTitle: "Search", leftIcon: "magnifyingglass", rightIcon: "chevron.right"),
                Settings(iconTitle: "Wallpaper", leftIcon: "photo.fill", rightIcon: "chevron.right")
            ],
            "Notifications" : [
                Settings(iconTitle: "Notifications", leftIcon: "bell.badge.fill", rightIcon: "chevron.right"),
                Settings(iconTitle: "Sound & Haptics", leftIcon: "speaker.wave.2.fill", rightIcon: "chevron.right"),
                Settings(iconTitle: "Focus", leftIcon: "moon.fill", rightIcon: "chevron.right"),
                Settings(iconTitle: "Screen Time", leftIcon: "timer", rightIcon: "chevron.right"),
            ],
            "Privacy" : [
                Settings(iconTitle: "Face ID & Passcode", leftIcon: "faceid", rightIcon: "chevron.right"),
                Settings(iconTitle: "Emergency SOS", leftIcon: "sos", rightIcon: "chevron.right"),
                Settings(iconTitle: "Privacy & Security", leftIcon: "hand.raised.fill", rightIcon: "chevron.right")
            ],
            "Payments & Storage" : [
                Settings(iconTitle: "Game Center", leftIcon: "gamecontroller", rightIcon: "chevron.right"),
                Settings(iconTitle: "iCloud", leftIcon: "icloud.fill", rightIcon: "chevron.right"),
                Settings(iconTitle: "Wallet & Apple Pay", leftIcon: "wallet.bifold.fill", rightIcon: "chevron.right")
            ],
            "Others" : [        Settings(iconTitle: "Apps", leftIcon: "apps.iphone", rightIcon: "chevron.right")
                       ]
        ]
    }
}
