//
//  ItemCelula.h
//  appPais
//
//  Created by Ezequiel Franca dos Santos on 20/09/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemCelula : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icone;
@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *idade;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectSexo;

@end
