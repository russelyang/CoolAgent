//
//  contact.h
//  CoolAgent
//
//  Created by xiaodong yang on 10-11-23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Contact : NSObject {
	NSString*	firstName;
	NSString*	lastName;
	NSString*	email;

}

-(void) display;
@property (retain,nonatomic) NSString* firstName;
@property (retain,nonatomic) NSString* lastName;
@property (retain,nonatomic) NSString* email;

@end
