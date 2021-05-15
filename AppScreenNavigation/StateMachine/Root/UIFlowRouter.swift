import UIKit

class UIFlowRouter {
  // MARK: - Properties
  private let window: UIWindow
  private var viewControllers = [UIViewController]()

  // MARK: - Initializer
  init(window: UIWindow) {
    self.window = window
  }

  // MARK: - Methods
  func navigate(to newViewController: UIViewController, with segue: UIFlowSegue) {
    switch segue {
    case .setRoot:
      setRoot(newViewController)
    case .present:
      present(newViewController)
    case .dismiss:
      dismiss()
    }
  }
}

// MARK: - Private Methods
extension UIFlowRouter {
  private func setRoot(_ newViewController: UIViewController) {
    window.rootViewController = newViewController
    window.makeKeyAndVisible()
    viewControllers.append(newViewController)
  }

  private func present(_ newViewController: UIViewController) {
    viewControllers.last?.present(newViewController, animated: true)
    viewControllers.append(newViewController)
  }

  private func dismiss() {
    viewControllers.last?.dismiss(animated: true)
    viewControllers.removeLast()
  }
}
