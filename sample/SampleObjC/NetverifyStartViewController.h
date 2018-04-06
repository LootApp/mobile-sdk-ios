//
//  NetverifyStartViewController.h
//
//  Copyright © 2018 Jumio Corporation All rights reserved.
//

#import "StartViewController.h"

@interface NetverifyStartViewController : StartViewController

@property (nonatomic, weak) IBOutlet UISwitch *switchRequireVerification;
@property (nonatomic, weak) IBOutlet UISwitch *switchRequireFaceMatch;

- (IBAction) startNetverify: (id) sender;

@end
