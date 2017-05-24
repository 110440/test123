//
//  TestView.m
//  test
//
//  Created by tanson on 2017/5/24.
//  Copyright © 2017年 tanson. All rights reserved.
//

#import "TestView.h"

@interface TestView ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView * scrollView;
@property(nonatomic,strong) UIImageView * view1;
@property(nonatomic,strong) UIImageView * view2;
@property(nonatomic,strong) UIImageView * view3;

@end

@implementation TestView{
    NSArray *_images;
    NSInteger _curPage;
}

-(instancetype)initWithFrame:(CGRect)frame images:(NSArray *)imgs{
    if([super initWithFrame:frame]){
        _images = imgs;
        _curPage = 0;
        [self addSubview:self.scrollView];
        self.scrollView.contentSize = CGSizeMake(frame.size.width * imgs.count, frame.size.height);
        [self showPageWithIndex:_curPage];
    }
    return self;
}

-(void) showPageWithIndex:(NSInteger)page {
    
    if(_images.count <= 1){
        return;
    }
    
    if(page >= _images.count){
        page = 0;
    }
    if(page <0){
        page = _images.count-1;
    }
    _curPage = page;
    
    _view2.image = _images[page];
    
    NSInteger next = page+1;
    if(next >= _images.count){
        next = 0;
    }
    
    _view3.image = _images[next];
    
    NSInteger pre = page -1;
    if(pre <0){
        pre = _images.count-1;
    }
    _view1.image = _images[pre];
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.bounds.size.width, 0);
}

-(UIScrollView *)scrollView{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.delegate = self;
        _view1  = [UIImageView new];
        _view1.backgroundColor = [UIColor grayColor];
        _view2  = [UIImageView new];
        _view2.backgroundColor = [UIColor yellowColor];
        _view3  = [UIImageView new];
        [_scrollView addSubview:_view1];
        [_scrollView addSubview:_view2];
        [_scrollView addSubview:_view3];
    }
    return _scrollView;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    CGRect frame = CGRectMake(0, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    self.view1.frame = frame;
    frame.origin.x += frame.size.width;
    self.view2.frame = frame;
    frame.origin.x += frame.size.width*2;
    self.view3.frame = frame;
}


#pragma mark- scroll delegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat x = scrollView.contentOffset.x;
    
    if(x==0){
        _curPage--;
    }else if(x >= scrollView.bounds.size.width*2){
        _curPage++;
    }
    [self showPageWithIndex:_curPage];
}



@end














