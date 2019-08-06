//
//  JHCycleView.m
//  JHCycleView
//
//  Created by HaoCold on 2019/8/6.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import "JHCycleView.h"

@interface JHCycleView()<UIScrollViewDelegate>
@property (nonatomic,  strong) UIScrollView *scrollView;
@property (nonatomic,  strong) UIPageControl *pageControl;

@property (nonatomic,  strong) NSMutableArray *dataArray;
@property (nonatomic,  strong) NSTimer *timer;
@property (nonatomic,  assign) NSInteger  index;

@end

@implementation JHCycleView

#pragma mark -------------------------------------视图-------------------------------------------

- (instancetype)initWithFrame:(CGRect)frame textData:(NSArray *)array;
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArray = @[].mutableCopy;
        
        [self setupViews];
        [self setupSubviews:array type:0];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame urlData:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArray = @[].mutableCopy;
        
        [self setupViews];
        [self setupSubviews:array type:1];
    }
    return self;
}

- (void)setupViews
{
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
}

- (void)setupSubviews:(NSArray *)array type:(NSInteger)type
{
    NSMutableArray *marr = @[].mutableCopy;
    [marr addObject:[array lastObject]];
    [marr addObjectsFromArray:array];
    [marr addObject:[array firstObject]];
    
    NSMutableArray *views = @[].mutableCopy;
    for (NSInteger i = 0; i < marr.count; i++) {
        if (type == 0) {
            UILabel *label = [self setupLabel:marr[i]];
            [views addObject:label];
        }else if (type == 1) {
            UIImageView *imageView = [self setupImageView:marr[i]];
            [views addObject:imageView];
        }
    }
    
    [self addMenuViews:views];
}

- (UILabel *)setupLabel:(NSString *)text
{
    CGFloat width = CGRectGetWidth(_scrollView.bounds);
    CGFloat height = CGRectGetHeight(_scrollView.bounds);
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, width, height);
    label.text = text;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:24];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor brownColor];
    return label;
}

- (UIImageView *)setupImageView:(NSString *)text
{
    CGFloat width = CGRectGetWidth(_scrollView.bounds);
    CGFloat height = CGRectGetHeight(_scrollView.bounds);
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, width, height);
    imageView.image = [UIImage imageNamed:text];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor lightGrayColor];
    return imageView;
}

#pragma mark -------------------------------------事件-------------------------------------------

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)addMenuViews:(NSArray <UIView *>*)menus
{
    if (menus.count == 0) {
        return;
    }
    
    [_dataArray removeAllObjects];
    [_dataArray addObjectsFromArray:menus];
    
    if (menus.count > 2) {
        _pageControl.numberOfPages = menus.count - 2;
    }
    
    [self layoutScrollMenu];
}

- (void)layoutScrollMenu
{
    CGFloat width = CGRectGetWidth(_scrollView.frame);
    CGFloat height = CGRectGetHeight(_scrollView.frame);
    
    for (NSInteger i = 0; i < _dataArray.count; i++) {
        UIView *view = _dataArray[i];
        [_scrollView addSubview:view];
        view.center = CGPointMake(width*0.5+i*width, height*0.5);
    }
    
    if (_dataArray.count > 1) {
        _scrollView.contentSize = CGSizeMake(width*_dataArray.count, 0);
        _scrollView.contentOffset = CGPointMake(width, 0);
        
        self.timer.fireDate = [NSDate distantPast];
    }
}

- (void)autoScroll
{
    _index++;
    [_scrollView setContentOffset:CGPointMake(_index*CGRectGetWidth(_scrollView.frame), 0) animated:YES];
    
    if (_index == _dataArray.count - 1) {
        _index = 1;
    }
}

#pragma mark --- UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];
    _timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((NSInteger)scrollView.contentOffset.x % (NSInteger)CGRectGetWidth(_scrollView.frame) != 0) {
        return;
    }
    
    NSInteger index = scrollView.contentOffset.x / CGRectGetWidth(_scrollView.frame);
    _pageControl.currentPage = index - 1;
    
    if (index == 0) {
        _scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.frame)*(_dataArray.count-2), 0);
    }else if (index == _dataArray.count - 1) {
        _scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.frame), 0);
    }
}

#pragma mark -------------------------------------懒加载-----------------------------------------

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.frame = self.bounds;
        scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        UIPageControl *control = [[UIPageControl alloc] init];
        control.frame = CGRectMake(0, self.bounds.size.height - 12, self.bounds.size.width, 12);
        control.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        control.hidesForSinglePage = YES;
        control.pageIndicatorTintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        control.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl = control;
    }
    return _pageControl;
}

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    }
    return _timer;
}

@end
