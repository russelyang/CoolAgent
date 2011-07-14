//
//  SignIn.h
//  CoolAgent
//
//  Created by xiaodong yang on 11-07-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SignInViewController : UIViewController {
	IBOutlet UITextField* userName;
	IBOutlet UITextField* password;
	
	NSMutableData* receivedData;

}

@property (nonatomic, retain) IBOutlet UITextField *userName;
@property (nonatomic, retain) IBOutlet UITextField *password;

-(IBAction) onClickSignIn ;



@end
