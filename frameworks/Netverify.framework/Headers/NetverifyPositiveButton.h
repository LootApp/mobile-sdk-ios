//
//  NetverifyPositiveButton.h
//
//  Copyright © 2018 Jumio Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetverifyViewController.h"

__attribute__((visibility("default"))) @interface NetverifyPositiveButton : UIButton <NetverifyAppearance>

@property (nonatomic,strong) UIColor *borderColor UI_APPEARANCE_SELECTOR;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
- (UIColor *)backgroundColorForState:(UIControlState)state UI_APPEARANCE_SELECTOR;

@end
