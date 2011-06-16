//
//  contact.m
//  CoolAgent
//
//  Created by xiaodong yang on 10-11-23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "contact.h"


@implementation Contact
@synthesize firstName;
@synthesize lastName;
@synthesize email;

-(void) display {
	printf("%s", [self.firstName UTF8String]);
}

-(void)dealloc {
	[firstName release];
	[lastName release];
	[email release];
	[super dealloc];
}


@end
