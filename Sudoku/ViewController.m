//
//  ViewController.m
//  Sudoku
//
//  Created by 星星 on 16/8/19.
//  Copyright © 2016年 星星. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@implementation UIColor (Extensions)


+ (instancetype)randomColor {
    
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    return [self colorWithRed:red green:green blue:blue alpha:1.0];
}

@end

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *containerView = [[UIView alloc] init];
    [self.view addSubview:containerView];
    containerView.backgroundColor = [UIColor whiteColor];
    containerView.layer.borderWidth = 1;
    containerView.layer.borderColor = [UIColor grayColor].CGColor;
    
    [containerView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(66);
        make.right.equalTo(-15);
        make.height.equalTo(300);
    }];
    
    for (int i = 0; i < 10; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor randomColor];
        [containerView addSubview:view];
    }
    
    [containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:50 fixedItemHeight:50 warpCount:3 topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
    
    [containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:10 fixedInteritemSpacing:20 warpCount:3 topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
    
}

@end




