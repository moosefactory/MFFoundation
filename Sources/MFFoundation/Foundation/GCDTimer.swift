//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 GCDTimer.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 06/02/2025.

import Foundation

public class GCDTimer: NSObject {

	private(set) var running: Bool = false
	
	//private var timer: Timer?
	private var timer: DispatchSourceTimer?
	
	// MARK: - Life Cycle
	
	public init(_ interval: Double, block: @escaping () -> Void = {}, leeway: DispatchTimeInterval = DispatchTimeInterval.milliseconds(20)) {
		timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
		if let timer = self.timer {
			timer.scheduleRepeating(deadline: DispatchTime.now(), interval: interval, leeway: leeway)
			timer.setEventHandler(handler: {
				block()
			})
		}
	}

	deinit {
		cancel()
	}
	
	func setHandler(_ block: @escaping () -> Void) {
		if let timer = self.timer {
			timer.setEventHandler(handler: {
				block()
			})
		}
	}
	
	// MARK: - Control
	
    public func resume() {
		guard let timer = self.timer else {
			return
		}
		timer.resume()
		running=true
	}
	
    public func stop() {
		guard let timer = self.timer else {
			return
		}
		timer.suspend()
		running=false
	}
	
    public func cancel() {
		guard let timer = self.timer else {
			return
		}
		timer.cancel()
		running=false
	}
    
    public func invalidate() {
        cancel()
    }

}
