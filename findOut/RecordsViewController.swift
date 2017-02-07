//
//  RecordsViewController.swift
//  findOut
//
//  Created by Максим on 03/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift

class RecordsViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    private let model = RecordsModel()
    
    private var recordsView: RecordsView {
        return view as! RecordsView
    }
    
    public weak var delegate: SidePanelViewControllerDelegate?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Ноффости"
        
        
        model.loadWall()
        model.loading.filter { $0 == false }
            .subscribe(onNext: { [unowned self] _ in
                self.recordsView.setup(for: RecordsViewModel(records: self.model.records))
        }).addDisposableTo(disposeBag)
    }
}
