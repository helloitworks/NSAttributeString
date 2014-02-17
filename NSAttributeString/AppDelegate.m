//
//  AppDelegate.m
//  NSAttributeString
//
//  Created by Shen Yixin on 14-2-13.
//  Copyright (c) 2014年 Shen Yixin. All rights reserved.
//

#import "AppDelegate.h"

//font
static const NSRect kSpeedFontBounds = { 0.f, 2.f, 128.f, 28.f };
static const CGFloat kSpeedFontColor[] = { 255.f / 255.f, 0.f / 255.f, 255.f / 255.f, 1.0f };
static NSString * const kSpeedFontName = @"Lucida Grande";
static const CGFloat kSpeedFontSize = 22.f;


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //--------method 1: draw attributeString s
    //display the attributeString “Hello It Works”，and want the letters 0 through 4 to be underlined,the letters 0 through 7 to be green, and the letters 9 through 13 to be supperscript
    NSMutableAttributedString *s;
    s = [[NSMutableAttributedString alloc] initWithString:@"Hello It Works"];
    
    [s addAttribute:NSFontAttributeName value:[NSFont userFontOfSize:22] range:NSMakeRange(0,14)];
    
    [s addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(0,5)];
    
    [s addAttribute:NSForegroundColorAttributeName value:[NSColor greenColor] range:NSMakeRange(0,8)];
    
    [s addAttribute:NSSuperscriptAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(9,5)];
    
    [s drawInRect:[self.window.contentView bounds]];
    
    
    
    //--------method 2:draw attributeString speed at the center
    NSMutableAttributedString *speed = [[[NSMutableAttributedString alloc] initWithString: @"512K/s"] autorelease];
    NSRange range = NSMakeRange(0, [speed length]);
    
    NSFont *font = [NSFont fontWithName:kSpeedFontName size:kSpeedFontSize];
    [speed addAttribute: NSFontAttributeName value: font range: range];
    
    NSColor *fontColor = [NSColor colorWithColorSpace: [NSColorSpace sRGBColorSpace] components: kSpeedFontColor count: sizeof(kSpeedFontColor) / sizeof(CGFloat)];
    [speed addAttribute: NSForegroundColorAttributeName value: fontColor range: range];
    
    NSMutableParagraphStyle* paragraphStyle = [[[NSMutableParagraphStyle alloc] init] autorelease];
    [paragraphStyle setAlignment: NSCenterTextAlignment];
    [speed addAttribute: NSParagraphStyleAttributeName value: paragraphStyle range: range];
    
    //use the following to draw attributeString speed vertically center
    /*
    NSSize size = speed.size;
    NSPoint point = [[self  class ] calcOriginalForCenterDraw:size destSize:[self.window.contentView bounds].size];
    NSRect drawRect = {point, size};
    [speed drawInRect:drawRect];
     */
    [speed drawInRect:[self.window.contentView bounds]];
    
    //--------method 3:draw string title vertically center
    NSString *title = @"This is a vertically center string title";
    NSDictionary* sTitleAttribute = [[NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:kSpeedFontName size:kSpeedFontSize],NSFontAttributeName, nil] retain];
    NSSize titleSize = [title sizeWithAttributes:sTitleAttribute];
    NSPoint titlePoint = [[self  class ] calcOriginalForCenterDraw:titleSize destSize:[self.window.contentView bounds].size];
    
    NSRect titleDrawRect = {titlePoint, titleSize};
    [title drawInRect:titleDrawRect withAttributes:sTitleAttribute];

}


+(NSPoint)calcOriginalForCenterDraw:(NSSize)drawSize destSize:(NSSize)destSize
{
    NSPoint point = NSZeroPoint;
    point.x += (destSize.width - drawSize.width) / 2;
    point.y += (destSize.height - drawSize.height) / 2;
    return point;
}

@end
