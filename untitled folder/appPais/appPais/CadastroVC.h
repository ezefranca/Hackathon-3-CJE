//
//  CadastroVC.h
//  appPais
//
//  Created by Ezequiel Franca dos Santos on 20/09/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastroVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *menuTabela;
@end
