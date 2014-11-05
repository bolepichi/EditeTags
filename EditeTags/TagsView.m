//
//  TagsView.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagsView.h"
#import "TagFrame.h"
#import "TagsDataSource.h"
#import "TagCollectionViewLayout.h"
#import "TagLayoutHelper.h"

static const CGFloat InputDoneHeight = 60;

typedef enum : NSUInteger {
    TagsViewStateEditing=0,
    TagsViewStatesInputDone,
} TagsViewStates;

@interface TagsView ()<UICollectionViewDelegate>

@property (strong , nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic)TagsDataSource *dataSource;

@property (assign, nonatomic)TagsViewStates *state;

@property (strong ,nonatomic) UITableView *tagTableView;

@property (strong, nonatomic)NSMutableArray *tagArray;

@property (assign, nonatomic)CGFloat contentWidth;


@property (strong, nonatomic)UIView *inputDoneView;

@end

@implementation TagsView

-(void)awakeFromNib
{
    
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}



-(void)setTagsArray:(NSArray*)tags
       contentWidth:(CGFloat)contentWidth
      setViewHeight:(SetViewHeightBlock)setViewHeightBlock
       getTagsBlock:(GetTagsBlock)getTagsBlock{
    
    self.tagArray = [NSMutableArray arrayWithArray:tags];
    self.contentWidth = contentWidth;
    self.setViewHeightBlock= setViewHeightBlock;
    self.getTagsBlock = getTagsBlock;
}


#pragma mark - TagsViewStateEditing

-(void)intalInterfaceWith:(CGRect)frame{
    
    
    if (_collectionView==nil) {
        
        
        TagCollectionViewLayout *layout = [[TagCollectionViewLayout alloc] init];
        
        UICollectionView *tagCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        tagCollectionView.backgroundColor =[UIColor whiteColor];
        [tagCollectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:@"ImageCell"];
        [tagCollectionView registerNib:[UINib nibWithNibName:@"TagStringCell" bundle:nil] forCellWithReuseIdentifier:@"TagStringCell"];
        [tagCollectionView registerNib:[UINib nibWithNibName:@"TextFeildCell" bundle:nil] forCellWithReuseIdentifier:@"TextFeildCell"];
        tagCollectionView.allowsMultipleSelection = NO;
        [tagCollectionView setDelegate:self];
        self.dataSource = [[TagsDataSource alloc]init];
        self.dataSource.contentWdith = self.contentWidth;
        [self.dataSource setLayoutData:self.tagArray];
        [tagCollectionView setDataSource:self.dataSource];
        [self addSubview:tagCollectionView];
        
        
        self.collectionView = tagCollectionView;
        __weak typeof(self) tagView = self;
        self.dataSource.configureTagStringCellBlock = ^(TagStringCell *cell, NSIndexPath *indexPath, TagFrame* tagFrame){
            
            cell.textString = tagFrame.tagString;
        };
        self.dataSource.configureTextFeildBlock = ^ (TextFeildCell *textFeildCell, NSIndexPath *indexPath, TagFrame* tagFrame){
            
            
            
            textFeildCell.addTagBlock = ^(NSString *tagString){
                
                [tagView.dataSource addTag:tagString addTagFrame:^(TagFrame *addtagFrame, NSInteger index) {
                    
                    /**
                     *  添加item
                     */
                    [tagView addTagWithTagFrame:addtagFrame index:index];
                    
                    
                    [tagView.dataSource setCollectViewSize:^(CGSize size) {
                        
                        
                        [tagView setContentViewSize:size];
                        
                    }];
                    
                }];
            };
            
            
            //编辑标签回调
            textFeildCell.editingBlock = ^(NSString *edittingString){
                
            };
            
            textFeildCell.stopSearchBlock = ^(){
                [tagView stopSearchTag];
            };
            
            
            textFeildCell.deleteTagBlock=^(){
                
                [tagView deleteTagWithTagFrame];
            };
            
            textFeildCell.selectTagBlock=^(NSInteger index){
                
                if (index>0) {
                    [tagView selectLastTagString:tagCollectionView.visibleCells.count-2];
                }
                
            };
            
            textFeildCell.endEditingBlock = ^(){
                
                
                
            };
            
        };

        
    }
    
}

//重新设置高度
-(void)setContentViewSize:(CGSize)size{
    
    CGFloat x =   self.collectionView.frame.origin.x;
    CGFloat y =  self.collectionView.frame.origin.y;
    
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    [self.collectionView setFrame:CGRectMake(x, y, width, height)];
    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height)];
    
    if (_setViewHeightBlock) {
        _setViewHeightBlock(height);
    }
}

/**
 *  添加一个tagframe
 *
 *  @param tagFrame 所添加的tagFrame
 *  @param index    添加索引
 */
-(void)addTagWithTagFrame:(TagFrame*)tagFrame index:(NSInteger)index{
    
    NSIndexPath *addIndexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    [self.collectionView insertItemsAtIndexPaths:@[addIndexPath]];
}

/**
 *  删除一个
 *
 *  @param tagFrame 删除TagFrame
 *  @param index    item索引
 */
-(void)deleteTagWithTagFrame{
    
    if (self.collectionView.visibleCells.count>2) {
        
        NSIndexPath *deleteIndexpath = [self.collectionView indexPathsForSelectedItems][0];
        
        NSLog(@"选中，%d",deleteIndexpath.item);
        
        
        [self.dataSource deleteTag:deleteIndexpath.item complateBlock:^{
            
            
            [self.collectionView deleteItemsAtIndexPaths:[self.collectionView indexPathsForSelectedItems]];
            __weak typeof(self) weakself = self;
            
            [self.dataSource setCollectViewSize:^(CGSize Size) {
                
                [weakself setContentViewSize:Size];
            } ];
            
        }];
    }
    
}

-(void)selectLastTagString:(NSInteger)index{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    [self.collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
}

//停止搜索
-(void)stopSearchTag{
    
}
//搜索
-(void)searchTag{
    
}


#pragma mark - TagsViewStatesInputDone

-(void)setState:(TagsViewStates *)state
{
    if (state == 0) {
        [self changeStateToEdite];
    }
    else
    {
        [self changeStateToInputDone];
    }
    _state = state;
}


-(void)intalInputdoneview{
    
    UIView *inputDone  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentWidth, InputDoneHeight)];
    inputDone.hidden = YES;
    inputDone.userInteractionEnabled = YES;
    UIImageView *tagImageView = [[UIImageView alloc] init];
    tagImageView.tag = 100;
    [inputDone addSubview:tagImageView];
    
    UILabel *tagText = [[UILabel alloc] init];
    tagText.tag = 101;
    
    NSString *tagTextString = [NSString stringWithFormat:@"%@ & %d more",self.tagArray[0],self.tagArray.count];
    NSMutableAttributedString *attribute =   [TagLayoutHelper getAttributedWithSting:tagTextString];
    tagText.attributedText = attribute;
    [inputDone addSubview:tagText];
    
    
    [self addSubview:inputDone];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeStateToEdite)];
    [inputDone addGestureRecognizer:tapGesture];
    
}



-(void)changeStateToEdite{
    
    [self.inputDoneView setHidden:YES];
     [UIView animateWithDuration:0.3f
                      animations:^{
                          self.frame = self.collectionView.frame;
                          
     }];
}


-(void)changeStateToInputDone{
    
    UILabel *tagText = (UILabel*)[self.inputDoneView viewWithTag:101];
    NSString *tagTextString = [NSString stringWithFormat:@"%@ & %d more",self.tagArray[0],self.tagArray.count];
    NSMutableAttributedString *attribute =   [TagLayoutHelper getAttributedWithSting:tagTextString];
    tagText.attributedText = attribute;

    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.frame = self.inputDoneView.frame;
                     } completion:^(BOOL finished) {
                            [self.inputDoneView setHidden:YES];
                     }];
}


@end
