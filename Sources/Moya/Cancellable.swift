/// Protocol to define the opaque type returned from a request.
public protocol Cancellable {

    /// A Boolean value stating whether a request is cancelled.
    var isCancelled: Bool { get }

    /// Cancels the represented request.
    func cancel()
}

public class CancellableWrapper: Cancellable {
    public var innerCancellable: Cancellable = SimpleCancellable()

    public var isCancelled: Bool { innerCancellable.isCancelled }

    public func cancel() {
        innerCancellable.cancel()
    }
}

public class SimpleCancellable: Cancellable {
    public var isCancelled = false
    public func cancel() {
        isCancelled = true
    }
}
