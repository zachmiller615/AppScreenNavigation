import UIKit
import RxSwift

class SettingsScreen: UIFlowScreen {
  enum Result {
    case didTapBackButton
  }

  // MARK: - Properties
  private let model: SettingsModel
  private let dependencyManager = SettingsScreenDependencyManager()
  private lazy var settingsViewController = dependencyManager.createSettingsViewController(with: model)

  let identifier: UIFlowScreenIdentifier = .settings
  let disposeBag = DisposeBag()

  var viewController: UIViewController {
    settingsViewController
  }

  var didFinish: Observable<UIFlowEventInitializable> {
    settingsViewController.didTapBackButton.mapTo(Result.didTapBackButton)
  }

  // MARK: - Initializer
  init(model: SettingsModel) {
    self.model = model
  }
}

extension SettingsScreen.Result: UIFlowEventInitializable {
  var toEvent: UIFlowEvent {
    .settingsScreen(self)
  }
}
