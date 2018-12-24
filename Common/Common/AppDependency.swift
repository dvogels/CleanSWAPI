//
//  AppDependency.swift
//  Common
//
//  Created by Dieter Vogels on 24/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation
import Services

protocol HasAPIClient {
    var apiClient: APIClient { get }
}

public struct AppDependency: HasAPIClient {
    let apiClient: APIClient
}
