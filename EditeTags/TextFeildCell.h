//
//  TextFeiledCell.h
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddTagString)(NSString *string);


@interface TextFeildCell : UICollectionViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *shadeButton;


@property (nonatomic,strong)AddTagString addTagBlock;

@end
