import UIKit

class Router {
  // MARK: - Properties
  private let previousViewController: UIViewController

  // MARK: - Initializer
  init(previousViewController: UIViewController) {
    self.previousViewController = previousViewController
  }

  // MARK: - Methods
  func present(_ viewControllerToPresent: UIViewController) {
    previousViewController.present(viewControllerToPresent, animated: true)
  }

  func dismiss() {
    previousViewController.dismiss(animated: true)
  }
}

class WindowRouter {
  // MARK: - Properties
  private let window: UIWindow

  // MARK: - Initializer
  init(window: UIWindow) {
    self.window = window
  }

  // MARK: - Methods
  func setRoot(_ viewController: UIViewController) {
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
}
