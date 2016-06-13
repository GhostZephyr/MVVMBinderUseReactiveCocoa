//
//  ShowCaseViewSwiftBinder.swift
//  MVVMBinderUseReactiveCocoa
//
//  Created by gz on 16/6/13.
//  Copyright © 2016年 gz. All rights reserved.
//

import Foundation
import ReactiveCocoa

class ShowCaseViewSwiftBinder: ShowCaseViewSwift , ASTableViewDataSource {
    
    weak var viewModel = ShowCaseViewModel();
    
    func bindToViewModel(viewModel: ShowCaseViewModelProtocol!) {
        self.viewModel = viewModel as? ShowCaseViewModel;
        DynamicProperty(object: self.viewModel, keyPath: "datas").signal.ignoreNil().observeNext { [unowned self] x in
            self.tableView.reloadData();
        }
        
        DynamicProperty(object: self.parentController, keyPath: "title") <~ DynamicProperty(object: self.viewModel, keyPath: "pageTitle").signal.map({$0});
        

        DynamicProperty(object: self.viewModel, keyPath: "isBusy").signal.observeNext { x in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = x as! Bool;
        }
        
        self.tableView.asyncDataSource = self;
        self.tableView.registerClass(ShowCaseTableViewCell.classForCoder(), forCellReuseIdentifier: "showCase");
        self.viewModel!.isActive = true;
        self.viewModel?.loadDataCommand .execute(nil) .doError({ [unowned self] (error) in
            let alert = UIAlertController(title: "error", message: error.domain, preferredStyle: .Alert);
            self.parentController?.presentViewController(alert, animated: true, completion: nil);
        });
        self.viewModel?.pageTitle = "Swift RAC 4";
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ((self.viewModel?.datas) != nil) {
            return (self.viewModel?.datas.count)!;
        } else {
            return 0;
        }
        
    }
    
    func tableView(tableView: ASTableView, nodeForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNode {
        var node = tableView.nodeForRowAtIndexPath(indexPath) as? ShowCaseCellNode;
        if ((node) == nil) {
            node = ShowCaseCellNode();
            
        }
        node!.setData(self.viewModel?.datas[indexPath.row] as! RACTuple);
        return node!;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
}