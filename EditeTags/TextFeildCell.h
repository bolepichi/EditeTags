//
//  TextFeiledCell.h
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddTagString)(NSString *string);
typedef void (^EditingTagString)(NSString *string );
typedef void(^StopSearchTag)();



@interface TextFeildCell : UICollectionViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *shadeButton;
@property (weak, nonatomic) IBOutlet UITextField *textFeild;
@property (nonatomic,strong)AddTagString addTagBlock;
@property (nonatomic,strong)EditingTagString editingBlock;
@property (nonatomic,strong)StopSearchTag stopSearchBlock;
@end
