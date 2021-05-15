import UIKit
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  // MARK: - Properties
  var window: UIWindow?

  private lazy var rootCoordinator: RootCoordinator = {
    let window = UIWindow()
    self.window = window
    return RootDependencyManager().createRootCoordinator(with: window)
  }()

  private let disposeBag = DisposeBag()

  // MARK: - Methods
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    rootCoordinator.start().subscribe().disposed(by: disposeBag)
    return true
  }
}
