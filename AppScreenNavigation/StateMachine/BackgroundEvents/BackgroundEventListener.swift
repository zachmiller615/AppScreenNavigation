import RxSwift

class BackgroundEventListener {
  // MARK: - Properties
  private let deepLinkListener: DeepLinkListener

  var events: Observable<BackgroundEvent> {
    deepLinkListener.didReceiveDeepLink.mapTo(.didReceiveDeepLink)
  }

  // MARK: - Initializer
  init(deepLinkListener: DeepLinkListener) {
    self.deepLinkListener = deepLinkListener
  }
}