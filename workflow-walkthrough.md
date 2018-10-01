# Paging Scroll View

![imagen](../master/assets/pageMetrics.png)  

## 1. Create a Tutorial with scrollView
Instantiate multiple instances if this tutorials steps (ViewControllers)   

![imagen](../master/assets/scrollViewTutorial.gif)  

### Steps  

1. Create a ViewController programatically and set the properties  

```swift
private func createAndAddTutorialStep(_ backgroundImageName: String,
                                        iconImageName: String,
                                        text: String) -> TutorialStepViewController {
    
    let tutorialStep = storyboard!.instantiateViewController(withIdentifier: "TutorialStepViewController") as! TutorialStepViewController
    tutorialStep.view.translatesAutoresizingMaskIntoConstraints = false
    tutorialStep.backgroundImage = UIImage(named: backgroundImageName)
    tutorialStep.iconImage = UIImage(named: iconImageName)
    tutorialStep.text = text

    scrollView.addSubview(tutorialStep.view)  // Add the view

    addChildViewController(tutorialStep)  // Add relationship parent and child
    tutorialStep.didMove(toParentViewController: self) // move the view to parent control

    return tutorialStep
  }
}
```

2. Create the constraints programatically Vertical and Horizontal  
 2.2 Create a dictionary with the views  
 2.3 Vertical and Hoeizontal constraint to all views.  
 2.4 Active them  
 
 ## 2. UIPageControl & Gaps between Views
 
 ![imagen](../master/assets/pageControl.gif)  
 
 ### Add Gaps between pages
 ![imagen](../master/assets/gaps.png)   
 ![imagen](../master/assets/gaps2.png)  
 
  ### STEPS
  
  1. in scrollView add horizontal paddin in the storyboard    
  2. Add Metrics  
  
  ```swift
    let views : [String : UIView] = ["view": view,
                                     "page1": firstTutorialPages.view,
                                     "page2": secondTutorialPages.view,
                                     "page3" : thirdTutorialPages.view,
                                     "page4" : fourTutorialPages.view]
    
    // Metrics have the padding added in the scrollview
    let metrics = ["edgeMargin": 10, "betweenMargin" : 20]
    
    // Vertical and Hoeizontal constraint to all views
    let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|",
                                                             options: [],
                                                             metrics: nil,
                                                             views: views)
    
    // Add the metrics in the constraints
    let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[page1(==view)]-betweenMargin-[page2(==view)]-betweenMargin-[page3(==view)]-betweenMargin-[page4(==view)]-edgeMargin-|",
                                                               options: [.alignAllTop, .alignAllBottom],
                                                               metrics: metrics,
                                                               views: views)
    
    // Active them
    NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints)
    
  ```
  
  ## UIPageControl
  
 ### Important properties:
 numberOfProperties  
 currentPage  
 
 ### ToCalculate current Page
 **round(content offset  x / content width )**  
 
 
 ### STEPS
 
 1. Add UIPageControl  in the scrolView as a brothers  
 2. Use a ScrollView delegate  and overide the method `func scrollViewDidScroll(_ scrollView: UIScrollView) {}`
 3. Calculate the current page scroll  
 
 ```swift
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // width the current view
        let pageWidth = scrollView.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth  // Example 1.4
        
        pageControl.currentPage = Int(round(pageFraction)) // 1
        
    }
 ```
 
 
 ## 3. Chanllenge : UIPageControl 
 Git branch feature-ChanllengeAdding-PagingControl  
 
**NOTE: create the constraints and the view with the loop array**  

  ![imagen](../feature-ChanllengeAdding-PagingControl/assets/challenge.gif)  
 
 
