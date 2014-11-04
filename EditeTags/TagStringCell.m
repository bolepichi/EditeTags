//
//  TagStringCell.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagStringCell.h"

#import "TagLayoutHelper.h"

@interface TagStringCell ()

@property (weak, nonatomic) IBOutlet UILabel *tagString;

@end

@implementation TagStringCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setTextString:(NSString *)textString
{
    self.tagString.attributedText = [TagLayoutHelper getAttributedWithSting:textString];
    
}



@end
