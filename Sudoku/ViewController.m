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

@property (nonatomic, weak) UIView *containerView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *containerView = [[UIView alloc] init];
    [self.view addSubview:containerView];
    self.containerView = containerView;
    containerView.backgroundColor = [UIColor whiteColor];
    containerView.layer.borderWidth = 1;
    containerView.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    // 固定containerView的宽高
    // 宫格大小随着containerView的宽高而改变
    [self distributeDynamicCellWithCount:10 warp:3];
    
    // 固定containerView的宽
    // 宫格的宽随containerView的宽改变
    // 固定宫格的高
    // containerView的高随宫格的高改变
    // [self distributeDynamic2CellWithCount:13 warp:3];
    
    
    // 固定container大小
    // 固定宫格大小
    // [self distributeFixedCellWithCount:17 warp:4];
}



// 固定containerView的宽高
// 宫格大小随containerView的宽高改变
- (void)distributeDynamicCellWithCount:(NSUInteger)count warp:(NSUInteger)warp {
    
    [self.containerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.containerView remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(66);
        make.right.equalTo(-15);
        make.height.equalTo(280);
    }];
    
    for (int i = 0; i < count; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor randomColor];
        [self.containerView addSubview:view];
    }
    
    [self.containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0
                                                            fixedLineSpacing:10 fixedInteritemSpacing:20
                                                                   warpCount:3
                                                                  topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
}

// 固定containerView的宽
// 宫格的宽随containerView的宽改变
// 固定宫格的高
// containerView的高随宫格的高改变
- (void)distributeDynamic2CellWithCount:(NSUInteger)count warp:(NSUInteger)warp {
    
    [self.containerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.containerView remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(66);
        make.right.equalTo(-15);
    }];
    
    for (int i = 0; i < count; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor randomColor];
        [self.containerView addSubview:view];
    }
    
    [self.containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:80
                                                            fixedLineSpacing:10 fixedInteritemSpacing:20
                                                                   warpCount:3
                                                                  topSpacing:10
                                                               bottomSpacing:10 leadSpacing:10 tailSpacing:10];
}


// 固定container大小
// 固定宫格大小
- (void)distributeFixedCellWithCount:(NSUInteger)count warp:(NSUInteger)warp {
    
    [self.containerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.containerView remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(66);
        make.right.equalTo(-15);
        make.height.equalTo(300);
    }];
    
    for (int i = 0; i < count; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor randomColor];
        [self.containerView addSubview:view];
    }
    
    
    [self.containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:50 fixedItemHeight:50
                                                              warpCount:warp
                                                             topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
}

@end



