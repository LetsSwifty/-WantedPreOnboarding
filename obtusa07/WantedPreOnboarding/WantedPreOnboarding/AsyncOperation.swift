//
//  AsyncOperation.swift
//  WantedPreOnboarding
//
//  Created by Taehwan Kim on 2023/02/24.
//

import UIKit

// 분명 이걸 이용해서 구현하는 것일텐데 의존성을 가지는 오퍼레이션을 만드는 것에 실패했다.

class AsyncOperation: Operation {
    // Enum 생성
    enum State: String {
        case ready, executing, finished
        
        // KVO notifications을 위한 keyPath설정
        fileprivate var keyPath: String {
            return "is\(rawValue.capitalized)"
        } // isReady/isExecuting/isFinished
    }
    
    // 직접 관리하기 위한 상태 변수 생성
    var state = State.ready {
        willSet {
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
        didSet {
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
        }
    }
}

extension AsyncOperation {
    // 상태속성은 모두 read-only
    override var isReady: Bool {
        return super.isReady && state == .ready
    }
    
    override var isExecuting: Bool {
        return state == .executing
    }
    
    override var isFinished: Bool {
        return state == .finished
    }
    
    override var isAsynchronous: Bool {  // 무조건 true로 리턴
        return true
    }
    
    override func start() {
        if isCancelled {
            state = .finished
            return
        }
        main()
        state = .executing
    }
    
    override func cancel() {
        super.cancel()
        state = .finished
    }
}
