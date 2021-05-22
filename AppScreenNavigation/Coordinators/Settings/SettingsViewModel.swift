struct SettingsViewModel {
  // MARK: - Properties
  private let model: SettingsModel

  // MARK: - Initializer
  init(model: SettingsModel) {
    self.model = model
  }

  // MARK: - Outputs to View Controller
  var title: String {
    if model.chosenNumber == 3 {
      return "DID RECEIVE DEEP LINK"
    } else {
      return "Chosen number is: \(model.chosenNumber)"
    }
  }
}
