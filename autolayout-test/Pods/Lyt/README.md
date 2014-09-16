Lyt
===
[![Version](https://cocoapod-badges.herokuapp.com/v/Lyt/badge.png)](http://cocoadocs.org/docsets/Lyt) [![Platform](https://cocoapod-badges.herokuapp.com/p/Lyt/badge.png)](http://cocoadocs.org/docsets/Lyt) [![Build Status](https://travis-ci.org/robotmedia/Lyt.png)](https://travis-ci.org/robotmedia/Lyt)

A UIView category to make autolayout (more) readable and less verbose. 

###Better semantics with less code

Lyt allows you to express the intent of your constraint. Write this:

```objective-c
[view lyt_centerInParent];
```

Instead of:

```objective-c
NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
[view.superview addConstraint:centerXConstraint];

NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
[view.superview addConstraint:centerYConstraint];
```

Or this:

```objective-c
[view lyt_alignSidesToParentWithMargin:10];
```

Instead of:

```objective-c
NSDictionary *views = NSDictionaryOfVariableBindings(view);
NSDictionary *metrics = @{@"margin" : @(10)};
NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[view]-margin-|" options:kNilOptions metrics:metrics views:views];
[view.superview addConstraints:constraints];
```

###Designed for code completion

Type `lyt_` and then the layout action you want (e.g., `center`) to see what's available.

![Code completion screenshot](Assets/autocomplete.png)

Lyt offers dozens of methods. Current families are:

* `lyt_align*`
* `lyt_center*`
* `lyt_place*`
* `lyt_set*`
* `lyt_match*`

###Support for dynamic layouts

Each Lyt method returns the corresponding constraint or constraints, which you can then modify or remove from the view hierarchy.

```objective-c
NSLayoutConstraint *leftConstraint = [view lyt_alignLeftToParent];
// Later...
leftConstraint.constant = 10; 
```

Additionally, each method has an equivalent that doesn't add the constraint to the view hierarchy, which is particularly useful for dynamic autolayouts. For example:

```objective-c
_labelLeftConstraint = [_label lyt_constraintByAligningLeftToParent];
// Later...
[self.view addConstraint:_labelLeftConstraint]; 
```

##Installation

Using [CocoaPods](http://cocoapods.org/):

```ruby
pod "Lyt", "~> 0.1"
```

Or add the files from the [Lyt](https://github.com/robotmedia/Lyt/tree/master/Lyt) directory if you're doing it manually.


##License

 Copyright 2013 [Robot Media SL](http://www.robotmedia.net)
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
