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
typedef void (^SelectTagBlock)();
typedef void (^DeleteTagBlock)();
typedef void (^EndEditingBlock)();

@interface TextFeildCell : UICollectionViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *shadeButton;
@property (weak, nonatomic) IBOutlet UITextField *textFeild;
/**
 *  添加 Tag 回调
 */
@property (nonatomic,strong)AddTagString addTagBlock;
/**
 *  输入字符串改变回调
 */
@property (nonatomic,strong)EditingTagString editingBlock;
/**
 *  停止搜索回调
 */
@property (nonatomic,strong)StopSearchTag stopSearchBlock;
/**
 *  选中最后一个Tag回调
 */
@property (nonatomic,strong)SelectTagBlock selectTagBlock;
/**
 *  删除 tag 回调
 */
@property (nonatomic,strong)DeleteTagBlock deleteTagBlock;

/**
 *  编辑结束键盘收起回调
 */
@property (nonatomic,strong)EndEditingBlock endEditingBlock;


@end
