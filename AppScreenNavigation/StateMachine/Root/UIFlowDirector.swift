class UIFlowDirector {
  // MARK: - Properties
  private let stateMachine: UIFlowStateMachine

  // MARK: - Initializer
  init(stateMachine: UIFlowStateMachine) {
    self.stateMachine = stateMachine
  }

  // MARK: - Methods
  func start() {
    stateMachine.start()
  }
}