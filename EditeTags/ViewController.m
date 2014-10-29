//
//  ViewController.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/29.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagCell.h"

#import "ViewController.h"

#import <NHBalancedFlowLayout/NHBalancedFlowLayout.h>

@interface ViewController ()<NHBalancedFlowLayoutDelegate>

@property (nonatomic,strong)NSMutableArray *tags;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController


-(void)awakeFromNib
{
}

-(void)initaleSamplatData{
    self.tags = [NSMutableArray arrayWithArray:@[@"北京",@"摄影",@"插画",@"艺术家",@"大话西游",@"降魔篇",@"超级无敌但华诞",@"爱在西元前",@"asdf",@"阿的说法水电费",@"阿萨德发时代",@"噶三等功",@"阿萨德发时代分",@"阿萨德发时代发生过",@"阿萨德发时代发时代发",@"阿萨德发时代发瓦斯的服务",@"2时代发",@"大风",@"asdf",@"阿萨德发时代",@"阿萨德发时代",@"阿萨德发时代",@"阿萨德发时代",@"阿萨德发时代发时代发时代",@"阿萨德发时代",@"阿萨德发时代发",@"阿萨德发时代发"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initaleSamplatData];
    
    NHBalancedFlowLayout  *layout = (NHBalancedFlowLayout*)self.collectionView.dataSource;
  

  
}


#pragma mark - UICollectionViewFlowLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(NHBalancedFlowLayout *)collectionViewLayout preferredSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat w = [self setAttributedWithString:[NSString stringWithFormat:@"#%@",self.tags[indexPath.item]]].size.width+10;
    
    return CGSizeMake(w>self.view.frame.size.width?self.view.frame.size.width:w, 30);
}

#pragma mark - UICollectionView data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return [self.tags count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TagCell" forIndexPath:indexPath];
    
    cell.tagLabel.attributedText = [self setAttributedWithString:[NSString stringWithFormat:@"#%@",self.tags[indexPath.item]]];

    return cell;
}


-(NSMutableAttributedString *)setAttributedWithString:(NSString *)string
{
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:string];
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
    [attriString setAttributes:dicattributes range:NSMakeRange(0, string.length)];
    return attriString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
