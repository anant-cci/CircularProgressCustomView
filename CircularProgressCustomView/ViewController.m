//
//  ViewController.m
//  CircularProgressCustomView
//
//  Created by Anant Kannaik on 20/06/18.
//  Copyright © 2018 Anant Kannaik. All rights reserved.
//

#import "ViewController.h"
#import "CircularProgressCustomView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CircularProgressCustomView *CircularProgressCustomView1;
@property (weak, nonatomic) IBOutlet CircularProgressCustomView *CircularProgressCustomView2;
@property (weak, nonatomic) IBOutlet CircularProgressCustomView *CircularProgressCustomView3;

@end

@implementation ViewController {
    NSTimer *m_timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    // Kick off a timer to count it down
    m_timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(decrementSpin) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)decrementSpin {
    // If we can decrement our percentage, do so, and redraw the view
    if (self.CircularProgressCustomView1.percent > 0) {
        self.CircularProgressCustomView1.percent = self.CircularProgressCustomView1.percent - 1;
        [self.CircularProgressCustomView1 setNeedsDisplay];
    }
    else {
        [m_timer invalidate];
        m_timer = nil;
    }
}

@end
