//
//  JHCycleView.h
//  JHCycleView
//
//  Created by HaoCold on 2019/8/6.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHCycleView : UIView

- (instancetype)initWithFrame:(CGRect)frame textData:(NSArray *)array;
- (instancetype)initWithFrame:(CGRect)frame imageData:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
