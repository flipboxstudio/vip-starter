# vip-starter
a starter iOS project using VIP ( View Interactor Presenter ) Architecture

### How to Use
install template from [clean-swift.com](https://clean-swift.com/), to generate new scene: `New File` -> `iOS` -> `Clean Swift` -> `Scene` -> `Input Scene Name`

### Libraries Used:
* Fabric
* Crashlytics

* Alamofire ( networking )
* AlamofireImage ( request image from server )
* ModelMapper ( mapping model )
* PKHUD ( Loading View )

## VIP
VIP is a set of Xcode Templates to generate the Clean Architecture components. 

#### Key Points VIP Cycle

* The view controller accepts an user event, constructs a request object, sends it to the interactor.
* The interactor does some work with the request, constructs a response object, and sends it to the presenter.
* The presenter formats the data in the response, constructs a view model object, and sends it to the view controller.
* The view controller displays the results contained in the view model to the user.

![vip cycle](https://cdn-images-1.medium.com/max/2000/1*QV4nxWPd_sbGhoWO-X7PfQ.png)

## VIP Component

#### View Controller
* ViewController containts display logic
* To create new scene : `New File` -> `iOS` -> `Clean Swift` -> `Scene` -> `Input Scene Name`
* Implement UIViewController or Base__ViewController
* Implement UITableViewController, UICollectionViewController, or UIWebViewController if needed
* Implement BaseFormViewController for form screen.
* Use xib, don’t use storyboard.

#### Interactor

* Interactor containt `Bussiness Logic` 
* Use worker if needed
* Wait ViewController request something and send response to presenter

#### Presenter

* Contains View Logic
* Reformat data from interactor and send it to controller

#### View

* Use xib, or by code
* Don’t put business logic

#### Model

* Representation of object with its property
* Use ModelMapper

#### Router

* Route to next screen
* Pass data to other view controller

# Packaging & naming

```
[Optional] Core
  - Assets.xcassets
  - LaunchScreen.storyboard
  - AppDelegate.swift
Base
Models
Scenes
  - YourSceneName
Services
Worker
```
| Group Name | Description |
| ---------- | ----------- |
| Core | Core file of xcode project like `Assets.xcassets`, `LaunchScreen.storyboard`, `AppDelegate.swift` |
| Base | Base class, that useful for minimize code |
| Models | Contains data structures that will be used for data management |
| Scenes | contain VIP Components that make up the screen |
| Services | Global Helper not related to business logic |
| Worker | Global Helper specific to business logic |
```
