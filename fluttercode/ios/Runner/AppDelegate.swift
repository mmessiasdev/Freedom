import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(AIzaSyCxLzbpuB5I4oVyO73Anh4MnlWeOV5BAe8)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
