//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

extension UINavigationController {

    func popViewControllers(withCount: Int, animated: Bool) {
        let viewControllers = self.viewControllers as [UIViewController]
        self.popToViewController(viewControllers[viewControllers.count - (withCount+1)], animated: true)
    }

    func removePreviousFromStack() {
        var stack = self.viewControllers as Array
        if stack.count > 1 {
            stack.remove(at: stack.count - 2)
            self.viewControllers = stack
        }
    }

    // Where we need completion block to perform some task on popViewController, for example: Posting notifications
    // inside completion.
    func popViewController(animated: Bool, completion: @escaping () -> Void) {
        self.popViewController(animated: animated)

        completionHandlerForNavController(animated: true, completion: completion)
    }

    // Where we need completion block to perform some task on popViewControllers, for example: Posting notifications
    // inside completion.
    func popViewControllers(withCount: Int, animated: Bool, completion: @escaping () -> Void) {
        let viewControllers = self.viewControllers as [UIViewController]
        self.popToViewController(viewControllers[viewControllers.count - (withCount+1)], animated: true)

        completionHandlerForNavController(animated: true, completion: completion)
    }

    // Where we need completion block to perform some task on popToRootViewController, for example: Posting notifications
    // inside completion.
    func popToRootViewController(animated: Bool, completion: @escaping () -> Void) {
        self.popToRootViewController(animated: animated)

        completionHandlerForNavController(animated: true, completion: completion)
    }

    private func completionHandlerForNavController(animated: Bool, completion: @escaping () -> Void) {
        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion() }
            return
        }
        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
}
