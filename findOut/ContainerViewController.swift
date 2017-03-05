//
//  ContainerViewController.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case bothCollapsed
    case leftPanelExpanded
    case rightPanelExpanded
}

protocol SidePanelViewControllerDelegate: class {
    //    func animalSelected(_ animal: Favourites)
}

class ContainerViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    private lazy var _menuViewController: MenuViewController? = {
        return UIStoryboard(name: "Menu", bundle: nil)
            .instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
    }()

    private lazy var _recordsViewController: UINavigationController? = {
        return UIStoryboard(name: "Records", bundle: nil)
            .instantiateViewController(withIdentifier: "RecordsNavigationController") as? UINavigationController
    }()

    var currentState: SlideOutState = .bothCollapsed

    var recordsViewController: UINavigationController!
    var menuViewController: MenuViewController?

    let centerPanelExpandedOffset: CGFloat = 60

    override func viewDidLoad() {
        super.viewDidLoad()

        recordsViewController = _recordsViewController

        view.addSubview(recordsViewController.view)
        addChildViewController(recordsViewController)

        recordsViewController.didMove(toParentViewController: self)

        let panGestureRecognizer = UIPanGestureRecognizer(target: self,
                                                          action: #selector(ContainerViewController.handlePanGesture(_:)))
        panGestureRecognizer.cancelsTouchesInView = false
        recordsViewController.view.addGestureRecognizer(panGestureRecognizer)
    }

    func addMenuViewController() {
        if menuViewController == nil {
            menuViewController = _menuViewController
            addChildSidePanelController(menuViewController!)
        }
    }

    func addChildSidePanelController(_ sidePanelController: UIViewController) {
        view.insertSubview(sidePanelController.view, at: 0)
        addChildViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
    }

}

// MARK: CenterViewController delegate

extension ContainerViewController { //: CenterViewControllerDelegate {

    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        if notAlreadyExpanded {
            addMenuViewController()
        }
        animateMenu(notAlreadyExpanded)
    }

    func collapseSidePanels() {
        switch currentState {
        case .rightPanelExpanded:
            break
        case .leftPanelExpanded:
            toggleLeftPanel()
        default:
            break
        }
    }

    func animateMenu(_ shouldExpand: Bool) {
        if shouldExpand {
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(view.frame.width - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(0) { [unowned self] finished in
                self.currentState = .bothCollapsed
                self.menuViewController!.view.removeFromSuperview()
                self.menuViewController = nil
            }
        }
    }

    func animateCenterPanelXPosition(_ targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: UIViewAnimationOptions(),
                       animations: { [weak self] in self?.recordsViewController.view.frame.origin.x = targetPosition },
                       completion: completion)
    }
}

extension ContainerViewController: UIGestureRecognizerDelegate {
    // MARK: Gesture recognizer

    func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            if currentState == .bothCollapsed {
                addMenuViewController()
            }
        case .changed:
            guard let recognizerView = recognizer.view else {
                return
            }
            let offset = recognizer.translation(in: view).x
            if recognizerView.frame.origin.x + offset <= 0 {
                return
            }
            recognizerView.center.x += offset
            recognizer.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if menuViewController != nil {
                // animate the side panel open or closed based on whether the view has moved more or less than halfway
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
                animateMenu(hasMovedGreaterThanHalfway)
            }
        default:
            break
        }
    }
}
