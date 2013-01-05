//
//  PrincipalViewController.h
//  PickerView
//
//  Created by Rafael Brigagão Paulino on 29/08/12.
//  Copyright (c) 2012 Rafael Brigagão Paulino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrincipalViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>


@property (nonatomic, weak) IBOutlet UIPickerView *picker;
@property (nonatomic, weak) IBOutlet UIImageView *imagem;

@property (nonatomic, strong) IBOutlet NSMutableArray *estados;

@end
