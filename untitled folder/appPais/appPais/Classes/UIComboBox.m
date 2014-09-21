//
//  UIComboBox.m
//  ExpenceManager
//
//  Created by ileafmac14 on 24/09/13.
//  Copyright (c) 2013 ileafmac14. All rights reserved.
//
//  Developer HarikrishnaPanicker.N
//

#import "UIComboBox.h"

@implementation UIComboBox
@synthesize tblvwCombo,UICombo;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        comboRect =frame;
    }
    return self;
}

-(void)setValues:(NSArray *)contentArray Setvalue:(CGRect)frame forIndex:(int)index{
  
    comboId  = index;
    comboRect =frame;
    arrList = [[NSMutableArray alloc]initWithArray:contentArray];
}

-(UIView *)getCombo {
    
    UICombo = [[UIView alloc]initWithFrame:CGRectMake(comboRect.origin.x, comboRect.origin.y, comboRect.size.width, comboRect.size.height  )];
    [UICombo setBackgroundColor:[UIColor clearColor]];
    [self textField];
    comboOpen = NO;
    
    [UICombo addSubview:tblvwCombo];
    [UICombo addSubview:txtfldCombo];
    [txtfldCombo addSubview:btnCombo];
    
    return(UICombo);
}
-(void)btnClick{
    UIImage *buttonImageNormal;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    if (comboOpen == NO) {
        tblvwCombo.frame= CGRectMake((comboRect.size.width)*1/18,comboRect.size.height-1,(comboRect.size.width)*16/18,comboRect.size.height * 3 );
        UICombo.frame =  CGRectMake(comboRect.origin.x, comboRect.origin.y, comboRect.size.width, comboRect.size.height *4);
        [btnCombo setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
        comboOpen = YES;
    }else{
        tblvwCombo.frame =CGRectMake((comboRect.size.width)*1/18,1,(comboRect.size.width)*16/18,comboRect.size.height-2 );
        UICombo.frame =  CGRectMake(comboRect.origin.x, comboRect.origin.y, comboRect.size.width, comboRect.size.height );
        [btnCombo setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        comboOpen = NO;
    }
    
    [UIView commitAnimations];
    UIImage *strechableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [btnCombo setBackgroundImage:strechableButtonImageNormal forState:UIControlStateNormal];
    
}
-(void)btnView{
    
    float imageY = (comboRect.size.height - (comboRect.size.height) * 2/3)/2;
    float imageX = (comboRect.size.width - (comboRect.size.height) * 2/3)- imageY;
    
    btnCombo = [UIButton buttonWithType:UIButtonTypeCustom] ;
    btnCombo.frame = CGRectMake(imageX, imageY, (comboRect.size.height) *2/3, (comboRect.size.height)*2/3 );
    [btnCombo setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [btnCombo addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self tblvw];
}
-(void)tblvw{
    tblvwCombo = [[UITableView alloc]initWithFrame:CGRectMake((comboRect.size.width)*1/18,1,(comboRect.size.width)*16/18,comboRect.size.height -2 )];
    tblvwCombo.rowHeight = comboRect.size.height ;
    [tblvwCombo registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    tblvwCombo.delegate = self;
    tblvwCombo.dataSource = self;
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return NO;
}
-(void)textField{
    
    
    txtfldCombo =[[UITextField alloc]initWithFrame:CGRectMake(0,0, comboRect.size.width, comboRect.size.height ) ];
    [txtfldCombo setBorderStyle: UITextBorderStyleRoundedRect];
    txtfldCombo.font = [UIFont systemFontOfSize:15];
    txtfldCombo.autocorrectionType = UITextAutocorrectionTypeNo;
    txtfldCombo.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtfldCombo.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtfldCombo.delegate = self;
    [self btnView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    tableView =  tblvwCombo;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    tableView =  tblvwCombo;
    return arrList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView =  tblvwCombo;
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [arrList objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    txtfldCombo.text = [arrList objectAtIndex:indexPath.row];
    [self btnClick];
    [self.delegate getString:txtfldCombo.text :comboId];
}

@end
