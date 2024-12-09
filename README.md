# Objective-C ARC Memory Leak

This repository demonstrates a subtle memory leak in Objective-C when using Automatic Reference Counting (ARC). The issue stems from repeatedly calling a method that creates and assigns a strong property without releasing the previously assigned value, leading to retained objects and potential crashes.

## Problem

The `bug.m` file contains an example of a class (`MyClass`) with a strong property (`myString`). The `someMethod` repeatedly allocates a new string and assigns it to this property.  If `someMethod` is called multiple times without releasing the previous string, there's a memory leak. This can lead to crashes, especially in scenarios with timers or frequent method calls.

## Solution

The `bugSolution.m` file shows the corrected version of `MyClass`.  Before assigning a new string to `myString`, the previous value is set to `nil`, ensuring proper memory management and avoiding leaks. This effectively breaks the retain cycle and allows for proper garbage collection.

## Setup

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the project to observe the improved memory management. 