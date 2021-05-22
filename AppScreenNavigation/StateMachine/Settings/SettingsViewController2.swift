import UIKit
import RxSwift

class SettingsViewController2: UIViewController {
  // MARK: - Properties
  private let settingsView = SettingsView()
  private let viewModel: SettingsViewModel

  var didTapBackButton: Observable<Void> {
    settingsView.rx.didTapBackButton
  }

  // MARK: - Initializer
  init(viewModel: SettingsViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods
  override func loadView() {
    view = settingsView
    bindViewModel()
  }
}

// MARK: - Private Methods
extension SettingsViewController2 {
  private func bindViewModel() {
    settingsView.setTitle(to: viewModel.title)
  }
}
