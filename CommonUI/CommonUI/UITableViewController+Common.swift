//
//  UITableViewController+Common.swift
//  Common
//
//  Created by Dieter Vogels on 28/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

public extension UITableViewController {
    
    public func adjustFooterViewHeightToFillTableView() {
        
        if let tableFooterView = self.tableView.tableFooterView {
            
            let minHeight = tableFooterView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            
            let currentFooterHeight = tableFooterView.frame.height
            
            let fitHeight = self.tableView.frame.height - self.tableView.adjustedContentInset.top - self.tableView.contentSize.height  + currentFooterHeight
            let nextHeight = (fitHeight > minHeight) ? fitHeight : minHeight
            
            if (round(nextHeight) != round(currentFooterHeight)) {
                var frame = tableFooterView.frame
                frame.size.height = nextHeight
                tableFooterView.frame = frame
                self.tableView.tableFooterView = tableFooterView
            }
        }
    }
    
}
