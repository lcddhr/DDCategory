//
//  UILabel+Addition.m
//  xibDemo
//
//  Created by lovelydd on 14-5-31.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)


-(void)labelTextRangeColor:(UIColor *)color range:(NSRange)range
{
    
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    [attributedText setAttributes:@{NSForegroundColorAttributeName:color} range:range];
    self.attributedText = attributedText;
//    [attributedText setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:28/255.0f green:160/255.0f blue:170/255.0f alpha:1.0]} range:[self.text rangeOfString:@"Facebook Pop"]];
//    [attributedText setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:28/255.0f green:160/255.0f blue:170/255.0f alpha:1.0]} range:[self.text rangeOfString:@"Facebook Pop" options:NSBackwardsSearch]];

}

- (void)alignTop {
    CGSize fontSize = [self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [self.text stringByAppendingString:@"\n "];
}

- (void)alignBottom {
    CGSize fontSize = [self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
}


@dynamic autoResize;
-(void)setAutoResize:(BOOL)autoResize{
    if (autoResize == YES) {
        
        [self setNumberOfLines:0];
        
        
        CGSize size = CGSizeMake(self.frame.size.width,MAXFLOAT);
        CGSize labelsize = [self.text sizeWithFont:self.font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        if (labelsize.height>self.frame.size.height) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelsize.width, labelsize.height);
        }
        
        //iOS7下可以用
//        NSDictionary *attribute = @{NSFontAttributeName: self.font};
//        
//        CGSize retSize = [self.text boundingRectWithSize:self.frame.size
//                                                 options:\
//                          NSStringDrawingTruncatesLastVisibleLine |
//                          NSStringDrawingUsesLineFragmentOrigin |
//                          NSStringDrawingUsesFontLeading
//                                              attributes:attribute
//                                                 context:nil].size;
//        NSLog(@"retSizeWidth :%f, height :%f",retSize.width,retSize.height);
//                if (retSize.height>self.frame.size.height) {
//                    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, retSize.width, retSize.height);
//                }
    }
    
}


- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    NSLog(@"retSizeWidth :%f, height :%f",retSize.width,retSize.height);
    
    return retSize;
}
@end
