## Welcome to Swifty Loader!
Hi, **SwiftyLoader** is a simple loader screen for iOS App.


## Installation

### Cocoapods
1. Install **[Cocoapods](https://cocoapods.org)**
2. Add this repo to your `Podfile`
```swift

  target 'ExamplePod' do
  # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!
  
  # Pods for ExamplePod
    pod 'SwiftyLoader'
end

```
3. Run **`pod install`**
4. Open up the **`.xcworkspace`** that CocoaPods created
5. Done!

## Usage
```swift

   import SwiftyLoader
   ...
   
   let loader = SwiftyLoader()
   
   ...

   loader.startLoader() {
      print("Loaded.")
      // Do anything your heart desires...
   }

   loader.closeLoader() {
      print("Closed.")
      // Do anything your heart desires...
   }
   
```

## Customizations
#### Opener Style :

Use `openerStyle` property.

**`  loader.openerStyle = .toTop  `**

	 Parameters : .toTop, .toBottom, .toLeft, .toRight, .toCenter

--

#### Closing Style :

Use `closingStyle` property.

**`  loader.closingStyle = .toBottom  `**

	 Parameters : .toTop, .toBottom, .toLeft, .toRight, .toCenter
--

#### Closing  Delay :

Use `closingDelay` property.

**`  loader.closingDelay = 2.0  `**

--

#### Background Color :

Use `bgColor` property.

**`  loader.bgColor = UIColor.red  `**

--

#### Indicator Color :

Use `indicatorColor` property.

**`  loader.indicatorColor = UIColor.white.cgColor  `**

--

#### Indicator Radius :

Use `indicatorRadius` property.

**`  loader.indicatorRadius = 60.0  `**

--

#### Indicator Line Size :

Use `indicatorLineSize` property.

**`  loader.indicatorLineSize = 4.0  `**

--

## Requirements :
 - Swift 4+
 - iOS 10+

## Author :

I'm Orkan Çep. Freelancer in İstanbul/Turkey.
