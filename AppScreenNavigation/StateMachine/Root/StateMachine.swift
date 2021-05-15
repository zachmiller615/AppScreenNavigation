import RxSwift

protocol State {
  static var initial: Self { get }
}

protocol Reducer {
  associatedtype StateType: State
  associatedtype EventType

  static func transition(from currentState: StateType, with event: EventType) -> StateType
}

class StateMachine<ReducerType: Reducer> {
  // MARK: - Properties
  let state: Observable<ReducerType.StateType>

  // MARK: - Initializer
  init(events: Observable<ReducerType.EventType>) {
    state = events
      .scan(.initial, accumulator: ReducerType.transition)
      .startWith(.initial)
      .share(replay: 1)
  }
}
