/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class TutorialViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl : UIPageControl!
    
    var arrPages = [TutorialStepViewController]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.scrollView.isPagingEnabled = true
    
    // 1. Instance the ViewController Tutorial
    let firstTutorialPages = createAndAddTutorialStep("bg_1",
                                                 iconImageName: "icon_1",
                                                 text: "Lorem Ipsum is simply dummy text of the printing  of type and scrambled it to make a type specimen book.")
    let secondTutorialPages = createAndAddTutorialStep("bg_2",
                                                 iconImageName: "icon_2",
                                                 text: "Lorem Ipsum is simply dummy text of the printing and type and scrambled it to make a type specimen book.")
    let thirdTutorialPages = createAndAddTutorialStep("bg_3",
                                                 iconImageName: "icon_3",
                                                 text: "Lorem Ipsum is simply dummy text of the printing an when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
    let fourTutorialPages = createAndAddTutorialStep("bg_4",
                                                      iconImageName: "icon_4",
                                                      text: "Lorem Ipsum is simply dummy text of the printing an when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
    
    arrPages = [firstTutorialPages, secondTutorialPages, thirdTutorialPages, fourTutorialPages]
    
    // 2. Set up the constraints between them (Views)
    // 2.2 Create a dictionary with the views
    let views : [String : UIView] = ["view": view,
                                     "page1": firstTutorialPages.view,
                                     "page2": secondTutorialPages.view,
                                     "page3" : thirdTutorialPages.view,
                                     "page4" : fourTutorialPages.view]
    
    let metrics = ["edgeMargin": 10, "betweenMargin" : 20]
    
    // Vertical and Hoeizontal constraint to all views
    let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|",
                                                             options: [],
                                                             metrics: nil,
                                                             views: views)
    
    let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[page1(==view)]-betweenMargin-[page2(==view)]-betweenMargin-[page3(==view)]-betweenMargin-[page4(==view)]-edgeMargin-|",
                                                               options: [.alignAllTop, .alignAllBottom],
                                                               metrics: metrics,
                                                               views: views)
    
    // Active them
    NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints)
    
  }

    // MARK : Create a ViewController programatically and set the properties
  private func createAndAddTutorialStep(_ backgroundImageName: String,
                                        iconImageName: String,
                                        text: String) -> TutorialStepViewController {
    
    let tutorialStep = storyboard!.instantiateViewController(withIdentifier: "TutorialStepViewController") as! TutorialStepViewController
    tutorialStep.view.translatesAutoresizingMaskIntoConstraints = false
    tutorialStep.backgroundImage = UIImage(named: backgroundImageName)
    tutorialStep.iconImage = UIImage(named: iconImageName)
    tutorialStep.text = text

    scrollView.addSubview(tutorialStep.view)

    addChildViewController(tutorialStep)
    tutorialStep.didMove(toParentViewController: self)

    return tutorialStep
  }
}

extension TutorialViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth  // Example 1.4
        
        pageControl.currentPage = Int(round(pageFraction)) // 1
        
    }
}






