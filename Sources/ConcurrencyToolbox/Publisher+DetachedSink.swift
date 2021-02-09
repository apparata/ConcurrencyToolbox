//
//  Copyright © 2021 Apparata AB. All rights reserved.
//

import Combine

extension Publisher {
    
    public typealias OnCompletion = (Subscribers.Completion<Failure>) -> Void
    public typealias OnValue = (Output) -> Void

    /// A sink that will dispose of the the subscriber chain once it is done.
    ///
    /// By using `Subscribers.Sink` directly, instead of `.sink(...)`, we create a subscription
    /// that lasts until it is completed, and nothing must be held onto. When the subscription completes
    /// (with either `.finished` or `.failure`), the `Sink` discards the `Subscription`, which
    /// breaks the retain cycle that was keeping it alive, so the `Sink` and the `Subscription` are
    /// also destroyed, leaving no memory leaks
    ///
    /// - Parameter receiveCompletion: The closure to execute on completion.
    /// - Parameter receiveValue: The closure to execute on receipt of a value.
    public func detachedSink(receiveCompletion: @escaping OnCompletion,
                             receiveValue: @escaping OnValue) {
        let subscriber = Subscribers.Sink<Output, Failure>(
            receiveCompletion: receiveCompletion,
            receiveValue: receiveValue)
        self.subscribe(subscriber)
    }
}
