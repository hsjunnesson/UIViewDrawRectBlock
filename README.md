# UIView+DrawRectBlock

Tired of subclassing UIView just to implement drawRect?

This is a category on UIView to create an instance with a block for its drawRect.


## How do I use this?

Something like this:

    - (void)viewDidLoad {
        [self.view addSubview:[UIView viewWithFrame:CGRectMake(20, 40, 60, 60)
                                      drawRectBlock:^(CGRect rect) {
                                          CGContextRef c = UIGraphicsGetCurrentContext();
                                          CGContextSetFillColorWithColor(c, [UIColor blueColor].CGColor);
                                          CGContextFillRect(c, rect);
                                      }]];
    }

But, of course, always be careful around blocks. This setup makes it really easy to create a circular reference chain.
Say you want to access a property on the viewcontroller, like that color, so you do something like this:

    - (void)viewDidLoad {
        [self.view addSubview:[UIView viewWithFrame:CGRectMake(20, 40, 60, 60)
                                      drawRectBlock:^(CGRect rect) {
                                          CGContextRef c = UIGraphicsGetCurrentContext();
                                          CGContextSetFillColorWithColor(c, self.fillColor.CGColor);
                                          CGContextFillRect(c, rect);
                                      }]];
    }

Now the block will retain the viewcontroller, the viewcontroller will retain the view and the view will retain the block, which in turn retains the view...

If you're using iOS 5 and ARC, you can do something like this:

    - (void)viewDidLoad {
        __weak MyViewController *weakRef = self;
        [self.view addSubview:[UIView viewWithFrame:CGRectMake(20, 40, 60, 60)
                                      drawRectBlock:^(CGRect rect) {
                                          CGContextRef c = UIGraphicsGetCurrentContext();
                                          CGContextSetFillColorWithColor(c, weakRef.fillColor.CGColor);
                                          CGContextFillRect(c, rect);
                                      }]];
    }


## License

Copyright (C) 2012 Hans Sjunnesson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

