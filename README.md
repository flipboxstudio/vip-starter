# vip-starter
a starter iOS project using VIP ( View Interactor Presenter ) Architecture
### How to use
download this template from [clean-swift.com](https://clean-swift.com/), after download open template directory in terminalan type `make install_templates` for instal template, to produce new  `scene` : `New File` -> `iOS` -> `Clean Swift` -> `Scene` -> `Type your scene name`

### Usefull `Library`:
* Fabric
* Crashlytics

* Alamofire ( networking )
* AlamofireImage ( request image from server )
* ModelMapper ( mapping model )
* PKHUD ( Loading View )

## VIP
VIP is a set of  Xcode Templates for produce `Clean Architecture` component.

#### Key Points VIP Cycle

* `ViewController` receive user interaction, create request object and send it to `Interactor`.
* The interactor doing some work with `request object`, consntruct response object, and send it to presenter.
* Presenter formating data from `response object`, and construct `view model object` and send it to `ViewController`.
* `ViewController` display result in `ViewModel` to user.

![vip cycle](https://cdn-images-1.medium.com/max/2000/1*QV4nxWPd_sbGhoWO-X7PfQ.png)

## VIP Component

#### View Controller
* ViewController containts display logic
* To make a new `scene` : `New File` -> `iOS` -> `Clean Swift` -> `Scene` -> `Input Scene Name`
* Implement `UIViewController` or `Base__ViewController`
* Implement `UITableViewController`, `UICollectionViewController`, or `UIWebViewController` if needed
* Implement `BaseFormViewController` for `scene` `Form Scene`
* Use `xib`, don't use  `storyboard`.

#### Interactor

* `Interactor` containt `Bussiness Logic`
* Use `worker` if needed
* Wait request for `ViewController` and send `response object to presenter`

#### Presenter

* Contain `ViewLogic`
* reformat data from `interactor` and send to `ViewController`.

#### View

* Use `xib` or `by code`
* Don't put `business logic` here

#### Model

* Representation from object with its property
* Use `ModelMapper`

#### Router

* Navigate to next `scene`
* Send data to other `ViewController`

# Group and Naming

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
| Nama Group | Deskripsi |
| ---------- | ----------- |
| Core | Contain core xcode project like `Assets.xcassets`, `LaunchScreen.storyboard`, and `AppDelegate.swift` |
| Base | Base class that used to minimalize code |
| Models | Contain data structure that used for data management |
| Scenes | Contain VIP Components that construct `Scene` |
| Services | `Global Helper` that unrelated with business logic |
| Worker | `Global Helper` specific for `business logic` |
```
