import UIKit

class UIFlowRouter {
  typealias Result = (updatedScreenStack: [UIFlowScreen], newScreensAdded: [UIFlowScreen])

  // MARK: - Properties
  private let window: UIWindow

  private var screenStack: [UIFlowScreen]
  private var newScreensAdded = [UIFlowScreen]()

  // MARK: - Initializer
  init(window: UIWindow, screenStack: [UIFlowScreen]) {
    self.window = window
    self.screenStack = screenStack
  }

  // MARK: - Methods
  func execute(_ commands: [UIFlowCommand]) -> Result {
    for command in commands {
      execute(command)
    }
    return (screenStack, newScreensAdded)
  }
}

// MARK: - Private Methods
extension UIFlowRouter {
  private func execute(_ command: UIFlowCommand) {
    switch command {
    case let .setRoot(newScreen):
      setRoot(newScreen)
    case let .present(newScreen):
      present(newScreen)
    case let .push(newScreen):
      push(newScreen)
    case .dismiss:
      dismiss()
    case .pop:
      pop()
    case .popToRoot:
      popToRoot()
    }
  }

  private func setRoot(_ newScreen: UIFlowScreen) {
    window.rootViewController = newScreen.viewController
    window.makeKeyAndVisible()
    screenStack = [newScreen]
    newScreensAdded.append(newScreen)
  }

  private func present(_ newScreen: UIFlowScreen) {
    guard let currentViewController = screenStack.last?.viewController else {
      setRoot(newScreen)
      return
    }
    currentViewController.present(newScreen.viewController, animated: true)
    screenStack.append(newScreen)
    newScreensAdded.append(newScreen)
  }

  private func push(_ newScreen: UIFlowScreen) {
    guard let navigationController = screenStack.last?.viewController.navigationController else {
      present(newScreen)
      return
    }
    navigationController.pushViewController(newScreen.viewController, animated: true)
    screenStack.append(newScreen)
    newScreensAdded.append(newScreen)
  }

  private func dismiss() {
    guard let currentViewController = screenStack.last?.viewController else {
      return
    }
    currentViewController.dismiss(animated: true)
    screenStack.removeLast()
  }

  private func pop() {
    guard let navigationController = screenStack.last?.viewController.navigationController else {
      return
    }
    navigationController.popViewController(animated: true)
    screenStack.removeLast()
  }

  private func popToRoot() {
    guard let rootViewController = screenStack.first?.viewController else {
      return
    }
    if let navigationController = rootViewController.navigationController {
      navigationController.popToRootViewController(animated: true)
    } else {
      rootViewController.dismiss(animated: true)
    }
    screenStack.removeSubrange(1..<screenStack.count)
  }
}

