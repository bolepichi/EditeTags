//
//  TagsSearchTableView.h
//  EditeTags
//
//  Created by Taagoo'iMac on 14/11/4.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SelectTagBlock)(NSString *selectTagString);

@interface TagsSearchTableView : UITableView

@property(nonatomic,strong)SelectTagBlock selectTagBlock;

@end
