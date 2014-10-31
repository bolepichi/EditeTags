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


-(void)setString:(NSString *)string
{
    self.string = string;
    self.tagString.text = string;
    self.tagString.attributedText = [TagLayoutHelper getAttributedWithSting:string];
    
}



@end
