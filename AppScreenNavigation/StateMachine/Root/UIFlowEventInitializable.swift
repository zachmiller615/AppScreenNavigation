import RxSwift

protocol UIFlowEventInitializable {
  var toEvent: UIFlowEvent { get }
}

extension Observable where Element == UIFlowEventInitializable {
  var toEvent: Observable<UIFlowEvent> {
    map { $0.toEvent }
  }
}
