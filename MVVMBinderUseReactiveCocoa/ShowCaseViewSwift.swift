//
//  ShowCaseViewSwift.swift
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/12.
//  Copyright © 2016年 gz. All rights reserved.
//

import Foundation

public class ShowCaseViewSwift : NSObject, ShowCaseViewProtocol {
    
    public let tableView :ASTableView;
    public weak var parentController: UIViewController?;
    
    deinit {
        
    }
    
    override init() {
        self.tableView = ASTableView();
    }
    
    
    public func attach(rootView: UIView!) {
        self.tableView.frame = rootView.frame;
        self.tableView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        rootView.addSubview(self.tableView);
        
    }
    
    public func attach(rootView: UIView!, parentController controller: UIViewController!, navigator: UINavigationController!) {
        self.parentController = controller;
        
    }
    
    public func dettach() {
        
    }
    
    public func viewForAutolayout() -> UIView! {
        let view = UIView();
        self.attach(view);
        return view;
    }
    
    public func viewWithFrame(frame: CGRect) -> UIView! {
        let view = UIView(frame:frame);
        self.attach(view);
        return view;
    }

}

