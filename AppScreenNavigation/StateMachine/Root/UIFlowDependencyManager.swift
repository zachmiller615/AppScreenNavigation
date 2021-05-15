import UIKit
import RxSwift

class UIFlowDependencyManager {
  func createUIFlowDirector(with window: UIWindow) -> UIFlowDirector {
    let router = createUIFlowRouter(with: window)
    return UIFlowDirector(dependencyManager: self, router: router)
  }

  func createUIFlowStateMachine(with events: Observable<UIFlowEvent>) -> UIFlowStateMachine {
    UIFlowStateMachine(events: events)
  }

  func createLoginViewController() -> LoginViewController2 {
    LoginViewController2()
  }

  func createScheduleViewController() -> ScheduleViewController2 {
    ScheduleViewController2()
  }

  func createSettingsViewController(with model: SettingsModel) -> SettingsViewController2 {
    let viewModel = createSettingsViewModel(with: model)
    return SettingsViewController2(viewModel: viewModel)
  }
}

// MARK: - Private Methods
extension UIFlowDependencyManager {
  private func createUIFlowRouter(with window: UIWindow) -> UIFlowRouter {
    UIFlowRouter(window: window)
  }

  private func createSettingsViewModel(with model: SettingsModel) -> SettingsViewModel {
    SettingsViewModel(model: model)
  }
}
