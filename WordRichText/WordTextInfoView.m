//
//  WordTextInfoView.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "WordTextInfoView.h"
#define DEFAULT_HEIGHT 35

@implementation WordTextInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.indexView = [[WordRichTextView alloc] initWithFrame:CGRectMake(0, 0, 72, DEFAULT_HEIGHT)];
        self.meaningView = [[WordRichTextView alloc] initWithFrame:CGRectMake(72, 0, 248, DEFAULT_HEIGHT)];
        [self addSubview:self.indexView];
        [self addSubview:self.meaningView];
        
        UIColor *backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"border.png"]];
        [self.indexView setBackgroundColor:backgroundColor];
        [self.meaningView setBackgroundColor: backgroundColor];
        [self.indexView setTextColor:[UIColor colorWithRed:0.93 green:0.57 blue:0.24 alpha:1.0]];
        
        //attribute setting
        self.indexView.editable = NO;
        self.meaningView.editable = NO;
        self.indexView.textAlignment = NSTextAlignmentRight;
        self.meaningView.textAlignment = NSTextAlignmentLeft;
        self.indexView.scrollEnabled = NO;
        self.meaningView.scrollEnabled = NO;
        self.indexView.selectable = NO;
        self.meaningView.selectable = NO;
        self.indexView.userInteractionEnabled = NO;
        self.meaningView.userInteractionEnabled = NO;

    }
    return self;
}

- (void)setIndex:(NSInteger)index{
    self.indexView.text = [NSString stringWithFormat:@"考法%ld",index];
}

- (void)setMeaning:(NSString *)meaning{
    self.meaningView.text = meaning;
}

- (CGFloat)adjustHeight{
    CGRect oldFrame = self.meaningView.frame;
    oldFrame.size.height = [self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithAttributedString:self.meaningView.attributedText] andWidth:248];
    self.meaningView.frame = oldFrame;
    
    CGRect oldLeftFrame = self.indexView.frame;
    oldLeftFrame.size.height = oldFrame.size.height;
    self.indexView.frame = oldLeftFrame;
    
    return self.meaningView.frame.size.height;
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString*)text andWidth:(CGFloat)width
{
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

@end
