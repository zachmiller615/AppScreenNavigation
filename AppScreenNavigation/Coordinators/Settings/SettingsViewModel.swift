struct SettingsViewModel {
  // MARK: - Properties
  private let model: SettingsModel

  // MARK: - Initializer
  init(model: SettingsModel) {
    self.model = model
  }

  // MARK: - Outputs to View Controller
  var title: String {
    """
    Settings Screen

    Chosen number is: \(model.chosenNumber)
    """
  }
}
