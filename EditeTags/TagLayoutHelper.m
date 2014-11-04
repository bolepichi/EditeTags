//
//  TagLayoutHelper.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagLayoutHelper.h"



@implementation TagLayoutHelper

/**
 *  获取字符串长度
 *
 *  @param string 标签文字
 *
 *  @return 长度值
 */
+(CGFloat)getAttributedWidthWithString:(NSString *)string
{
    NSMutableAttributedString *attriString = [TagLayoutHelper getAttributedWithSting:string];
    
    
    return [attriString size].width;
}

/**
 *  获取标签字符 AttributedString
 *
 *  @param string 标签文字
 *
 *  @return 返回标签
 */
+(NSMutableAttributedString*)getAttributedWithSting:(NSString*)string
{
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"#%@",string]];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle  alloc] init];
    paragraphStyle.lineSpacing = 0;
    paragraphStyle.paragraphSpacing = 0;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.headIndent = 0;
    paragraphStyle.firstLineHeadIndent= 0;
    paragraphStyle.tailIndent = 0;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
    paragraphStyle.lineHeightMultiple = 1.0f;
    paragraphStyle.paragraphSpacingBefore=0;
    NSDictionary *dicattributes = @{NSForegroundColorAttributeName:[UIColor grayColor],
                                    NSFontAttributeName:[UIFont systemFontOfSize:12.0f],
                                    NSParagraphStyleAttributeName:paragraphStyle
                                    };
    [attriString setAttributes:dicattributes range:NSMakeRange(0, string.length+1)];
    return attriString;
}


@end
