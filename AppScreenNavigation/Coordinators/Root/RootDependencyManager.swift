import UIKit

class RootDependencyManager {
  func createRootCoordinator(with window: UIWindow) -> RootCoordinator {
    let windowRouter = createWindowRouter(with: window)
    return RootCoordinator(dependencyManager: self, router: windowRouter)
  }
}

// MARK: - Helper Methods
extension RootDependencyManager {
  private func createWindowRouter(with window: UIWindow) -> WindowRouter {
    WindowRouter(window: window)
  }
}
