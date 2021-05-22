import UIKit

struct UIFlowDependencyManager {
  func createUIFlowDirector(with window: UIWindow) -> UIFlowDirector {
    let stateMachine = createUIFlowStateMachine(with: window)
    return UIFlowDirector(stateMachine: stateMachine)
  }

  func createUIFlowStateMachine(with window: UIWindow) -> UIFlowStateMachine {
    UIFlowStateMachine(window: window)
  }
}