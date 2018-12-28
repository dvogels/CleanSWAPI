//
//  StarWarsItemCell.swift
//  CommonUI
//
//  Created by Dieter Vogels on 28/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

public protocol StarWarsItem {
    
    var title: String { get }
    var subtitle: String? { get }
    
}

public class StarWarsItemCell: UITableViewCell {
    
    public static let identifier = "StarWarsItemCell"
    
    public var item: StarWarsItem? {
        didSet {
            if let item = item {
                self.textLabel?.text = item.title
                self.detailTextLabel?.text = item.subtitle
            }
        }
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
