//
//  ZM_UITools.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/30.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_UITools.h"

// 设置随机颜色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//7.1设置 view 圆角
#define LLayerRadiusView(View, Radius)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\

@implementation ZM_UITools

- (void)zm_test {
    
    //CGRectZero
    UIButton *testBtn = [ZM_UITools zm_createBtnTitle:@"" titleColor:[UIColor redColor] font:[UIFont systemFontOfSize:16] bgColor:RandomColor frame:CGRectMake(100, 200, 100, 38)];
    LLayerRadiusView(testBtn,5.f);
    [testBtn addTarget:self action:@selector(testClick) forControlEvents:UIControlEventTouchUpInside];  
    [[UIView new] addSubview:testBtn];
    
    UIButton *back = [ZM_UITools zm_createBtnTitle:nil titleColor:nil font:nil 
                                             image:[UIImage imageNamed:@"leftArrow"]                                               
                                           bgImage:nil bgColor:nil frame:CGRectMake(10, 27, 50, 30) 
                                         addTarget:self action:@selector(backClick)];   
    [[UIView new] addSubview:back];
}
- (void)testClick {
    
}
- (void)backClick {
    // [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ------------------ setter getter UI ------------------

// 添加线 Line
+ (UIView *)zm_lineViewFrame:(CGRect)frame {
    UIView *_lineView = [[UIView alloc] initWithFrame:frame];
    _lineView.backgroundColor = [UIColor grayColor];
    _lineView.alpha = 0.3f;
    return _lineView;
}


// 添加 UILabel
+ (UILabel *)zm_createLabText:(NSString * _Nullable)text 
                    textColor:(UIColor * _Nullable)textColor
                         font:(UIFont * _Nonnull)font  
                      bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame {
    
    UILabel *_label = [[UILabel alloc] initWithFrame:(CGRect)frame];
    _label.font = font;
    _label.text = text;
    if (textColor) {_label.textColor = textColor;}
    if (bgColor)   {_label.backgroundColor = bgColor;}
    return _label;
}

// 添加按钮 UIButton
+ (UIButton *)zm_createBtnTitle:(nullable NSString *)title 
                     titleColor:(UIColor *_Nullable)titleColor
                           font:(UIFont * _Nullable)font  
                        bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame {
    
    UIButton *_addBtn = [[UIButton alloc] initWithFrame:frame];
    [_addBtn setTitle:title forState:UIControlStateNormal];
    [_addBtn setTitleColor:titleColor forState:UIControlStateNormal];
    if (font)       {[_addBtn.titleLabel setFont:font];}
    if (titleColor) {[_addBtn setTitleColor:titleColor forState:UIControlStateNormal];}
    if (bgColor)    {[_addBtn setBackgroundColor:bgColor];}
    return _addBtn;
}

+ (UIButton *)zm_createBtnTitle:(nullable NSString *)title 
                     titleColor:(UIColor *_Nullable)titleColor
                           font:(UIFont * _Nullable)font  
                          image:(UIImage * _Nullable)image 
                        bgImage:(UIImage * _Nullable)bgImage 
                        bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame 
                      addTarget:(nullable id)target action:(SEL)action  {
    
    UIButton *_addBtn = [[UIButton alloc] initWithFrame:frame];
    [_addBtn setTitle:title forState:UIControlStateNormal];
    [_addBtn setTitleColor:titleColor forState:UIControlStateNormal];
    [_addBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (image)      {[_addBtn setImage:image forState:UIControlStateNormal];}
    if (bgImage)    {[_addBtn setBackgroundImage:bgImage forState:UIControlStateNormal];}
    if (font)       {[_addBtn.titleLabel setFont:font];}
    if (titleColor) {[_addBtn setTitleColor:titleColor forState:UIControlStateNormal];}
    if (bgColor)    {[_addBtn setBackgroundColor:bgColor];} 
    return _addBtn;
}



/** 表的配置 UITableView
 @param tableView 表
 @param separatorColor 分割线颜色
 @param separatorStyle 分割线类型
 @param headerViewHide 头部多余的分割线
 @param footerViewHide 底部多余的分割线
 @param estimated 是否预估高度
 */
+ (void)setTableView:(UITableView *)tableView bgColor:(UIColor *)bgColor 
      separatorStyle:(ZMCellSeparatorStyle)separatorStyle 
      separatorColor:(UIColor *)separatorColor
      headerViewHide:(BOOL)headerViewHide 
      footerViewHide:(BOOL)footerViewHide 
           estimated:(BOOL)estimated {
    
    tableView.backgroundColor = bgColor;   
    if (estimated) {
        if (@available(iOS 11.0, *)) {
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
        }
    }
    if (separatorStyle == ZMCellSeparatorNone) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }else if (separatorStyle == ZMCellSeparatorSingleLine) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    }else if (separatorStyle == ZMCellSeparatorSingleLineEtched) {
        //UITableViewCellSeparatorStyleSingleLineEtched
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    }else if (separatorStyle == ZMCellSeparatorAll) { 
        // 分割线 自左向右 全部显示
        tableView.separatorInset = UIEdgeInsetsZero;
        tableView.layoutMargins  = UIEdgeInsetsZero;
    }else{
        // ZMCellSeparatorNormal
    }        
    if (separatorColor!=nil) {
        [tableView setSeparatorColor:separatorColor];
    }
    //清除UITableView多余的分割线
    UIView *View= [UIView new];
    if (headerViewHide) {[tableView setTableHeaderView:View];}
    if (footerViewHide) {[tableView setTableFooterView:View];}
}


@end
