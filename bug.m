In Objective-C, a common yet subtle error arises when dealing with object ownership and memory management using ARC (Automatic Reference Counting).  Consider this scenario:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    self.myString = [NSString stringWithFormat:@"Hello, world!"];
    // ... some code ...
}
@end
```

This seems innocuous. However, if `someMethod` is called multiple times without releasing the previous `myString`,  each call creates a new string, increasing the retain count.  When the object is deallocated, it may crash due to over-released memory.  If you have a timer calling this method repeatedly, this problem can easily go unnoticed.