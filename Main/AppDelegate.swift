//
//  AppDelegate.swift
//  Syrinscape Bridge
//
//  Created by Daniel Moro on 11/02/2020.
//  Copyright © 2020 Moroverse. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    enum AppError : Error {
        case schemeConversionError
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    private func handleClientError(_ error: Error) {
        print(error.localizedDescription)
    }

    private func handleServerError(_ response: URLResponse?) {
        print(response.debugDescription)
    }

    func application(_ application: NSApplication, open urls: [URL]) {
        if let url = urls.first {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.scheme = "https"
            guard let newUrl = components?.url else {
                handleClientError(AppError.schemeConversionError)
                return
            }
            let task = URLSession.shared.dataTask(with: newUrl) { data, response, error in
                if let error = error {
                    self.handleClientError(error)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                    self.handleServerError(response)
                    return
                }
                #if DEBUG
                print("sent \(url)")
                #endif
            }
            task.resume()
        }
        // bring Fantasy Grounds back to the foreground
        let apps = NSWorkspace.shared.runningApplications
        for app in apps {
            if app.localizedName == "Fantasy Grounds" {
                if !app.isActive {
                    app.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
                }
            }
        }

    }

}

