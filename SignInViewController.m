    //
//  SignIn.m
//  CoolAgent
//
//  Created by xiaodong yang on 11-07-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SignInViewController.h"
#import "SBJson.h"


@implementation SignInViewController
@synthesize userName;
@synthesize password;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) onClickSignIn {
	NSLog(@"clicked username:%@ and password: %@", userName.text, password.text);
	NSURL* webServiceUrl = [[NSURL alloc] initWithString:@"https://tpoitgn8i.tpolab.com/dataservice/login.svc/Login"];
	NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:webServiceUrl];
	[request addValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"content-type"];
	[request setHTTPMethod:@"POST"];
	
	NSMutableDictionary *loginRequest = [[NSMutableDictionary alloc] init];
	[loginRequest setValue:userName.text forKey:@"name"];
	[loginRequest setValue:password.text forKey:@"password"];
	
	SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
	NSString *requestBody = [jsonWriter stringWithObject:loginRequest];


	[request setHTTPBody:[requestBody dataUsingEncoding:NSUTF8StringEncoding]];

	
	NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

	if(connection) {
		receivedData = [[NSMutableData dataWithLength:0] retain];
	} else {
	}
	
	[loginRequest release];
	[jsonWriter release];
									   
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	
	[receivedData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
	NSString* result = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
	[receivedData release];
	
	SBJsonParser* parser = [[SBJsonParser alloc] init];
	
	NSDictionary *object = [parser objectWithString:result error:nil];
	if ([object objectForKey:@"exception"]) {
		NSLog(@"%@",[[object objectForKey:@"exception"] objectForKey:@"message"]);

	} else {
		NSLog(@"%@", [object objectForKey:@"token"]);
	}

	[parser release];
}




- (void)dealloc {
	[userName release];
	[password release];
	[receivedData release];
    [super dealloc];
}


@end
