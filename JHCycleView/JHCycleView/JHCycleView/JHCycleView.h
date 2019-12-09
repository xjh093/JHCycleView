//
//  JHCycleView.h
//  JHCycleView
//
//  Created by HaoCold on 2019/8/6.
//  Copyright © 2019 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2019 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class JHCycleView;

@protocol JHCycleViewDelegate <NSObject>

@optional

- (void)cycleView:(JHCycleView *)cycleView didSelectViewAtIndex:(NSInteger)index;

@end

@interface JHCycleView : UIView

/// Default is 3s.
@property (nonatomic,  assign) CGFloat  scrollInterval;
///
@property (nonatomic,    weak) id<JHCycleViewDelegate>delegate;
///
@property (nonatomic,  strong) NSArray *textData;
///
@property (nonatomic,  strong) NSArray *imageData;
///
@property (nonatomic,  strong) NSArray *imageURLData;

- (instancetype)initWithFrame:(CGRect)frame textData:(NSArray *)array;
- (instancetype)initWithFrame:(CGRect)frame imageData:(NSArray *)array;
- (instancetype)initWithFrame:(CGRect)frame imageURLData:(NSArray *)array holderImage:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
