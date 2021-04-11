//
//  Storyboards.swift
//  DummyAlteaCare
//
//  Created by Rahmad Hidayat on 15/03/21.
//

import Foundation
import UIKit

internal enum StoryboardScene {
    
    internal enum Search: StoryboardType {
        internal static let storyboardName = "Search"
        
        internal static let SearchViewController = SceneType<SearchViewController>(storyboard: Search.self, identifier: "SearchViewController")
    }
    
    internal enum SearchSpecialist: StoryboardType {
        internal static let storyboardName = "SearchSpesialist"
        
        internal static let SearchSpecialistViewController = SceneType<SearchSpecialistViewController>(storyboard: SearchSpecialist.self, identifier: "SearchSpecialistViewController")
    }
    
}

// MARK: - Implementation Details

internal protocol StoryboardType {
    static var storyboardName: String { get }
}

internal extension StoryboardType {
    static var storyboard: UIStoryboard {
        let name = self.storyboardName
        return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
    }
}

internal struct SceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    internal let identifier: String
    
    internal func instantiate() -> T {
        let identifier = self.identifier
        guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
        }
        return controller
    }
}

internal struct InitialSceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    
    internal func instantiate() -> T {
        guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
            fatalError("ViewController is not of the expected class \(T.self).")
        }
        return controller
    }
}

private final class BundleToken {}
