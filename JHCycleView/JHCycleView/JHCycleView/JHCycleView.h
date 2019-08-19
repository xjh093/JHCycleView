//
//  JHCycleView.h
//  JHCycleView
//
//  Created by HaoCold on 2019/8/6.
//  Copyright © 2019 HaoCold. All rights reserved.
//

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

- (instancetype)initWithFrame:(CGRect)frame textData:(NSArray *)array;
- (instancetype)initWithFrame:(CGRect)frame imageData:(NSArray *)array;
- (instancetype)initWithFrame:(CGRect)frame imageURLData:(NSArray *)array holderImage:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
