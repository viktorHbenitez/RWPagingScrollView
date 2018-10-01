# Paging Scroll View

![imagen](../master/assets/pageMetrics.png)  


## Create a Tutorial with scrollView
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
