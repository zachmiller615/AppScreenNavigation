import RxSwift

extension Observable {
  func mapTo<Result>(_ value: Result) -> Observable<Result> {
    map { _ in value }
  }
}

extension Observable where Element: UIFlowEventInitializable {
  var toEvent: Observable<UIFlowEvent> {
    map { $0.toEvent }
  }
}
