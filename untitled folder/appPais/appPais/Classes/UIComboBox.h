//
//  UIComboBox.h
//  ExpenceManager
//
//  Created by ileafmac14 on 24/09/13.
//  Copyright (c) 2013 ileafmac14. All rights reserved.
//
//  Developer HarikrishnaPanicker.N
//

#import <UIKit/UIKit.h>
@class UIView;

@protocol UIComboBoxDelegate <NSObject>

-(void)getString :(NSString *)string :(int )index  ;

@end

@interface UIComboBox : UIView<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

{
    NSMutableArray *arrayCombo;
    UIView *UICombo;
    BOOL comboOpen;
    int comboId;
    UITextField *txtfldCombo ;
    UIButton *btnCombo;
    NSMutableArray *arrList;
    UITableView *tblvwCombo;
    CGRect comboRect ;
    id<UIComboBoxDelegate>delegate;
}

@property(strong,nonatomic)id<UIComboBoxDelegate>delegate;
@property(strong,nonatomic)UITableView *tblvwCombo;
@property(strong,nonatomic)UIView *UICombo;

-(void)setValues:(NSArray *)contentArray Setvalue:(CGRect)frame forIndex:(int)index;
-(UIView *)getCombo;

@end
