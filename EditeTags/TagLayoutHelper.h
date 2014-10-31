//
//  TagLayoutHelper.h
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TagLayoutHelper : NSObject


+(NSMutableAttributedString*)getAttributedWithSting:(NSString*)string;

+(CGFloat)getAttributedWidthWithString:(NSString *)string;


@end
