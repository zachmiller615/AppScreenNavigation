import UIKit

struct UIFlowDependencyManager {
  func createUIFlowStateMachine(with window: UIWindow) -> UIFlowStateMachine {
    let backgroundEventListener = createBackgroundEventListener()
    return UIFlowStateMachine(window: window, backgroundEventListener: backgroundEventListener)
  }
}

// MARK: - Private Methods
extension UIFlowDependencyManager {
  private func createBackgroundEventListener() -> BackgroundEventListener {
    let deepLinkListener = DeepLinkListener()
    return BackgroundEventListener(deepLinkListener: deepLinkListener)
  }

  private func createDeepLinkListener() -> DeepLinkListener {
    DeepLinkListener()
  }
}