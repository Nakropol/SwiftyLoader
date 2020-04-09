# SwiftyLoader
Simple Loader for Swift

## Installation

### CocoaPods 

1. Install [CocoaPods](https://cocoapods.org)
2. Add this repo to your `Podfile`

	```ruby
	target 'Example' do
	    # IMPORTANT: Make sure use_frameworks! is included at the top of the file
	    use_frameworks!

	    pod 'SwiftyLoader'
	end
	```
3. Run `pod install`
4. Open up the `.xcworkspace` that CocoaPods created
5. Done!


### Basic Usage

```sh
import SwiftyLoader

...

let loader = SwiftyLoader()

....

loader.startLoader() {
	print("End")
}

loader.closeLoader() {
	print("Closed")
}

```