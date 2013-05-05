//
//  NSOperationQueueAdditions.m
//  Zangetsu
//
//  Created by Colin Wheeler on 9/30/11.
//  Copyright 2012. All rights reserved.
//

#import "NSOperationQueueAdditions.h"
#import <EXTScope.h>

@implementation NSOperationQueue (NSOperationQueueAdditions)

-(void)cw_addOperationAfterDelay:(double)seconds
                       withBlock:(dispatch_block_t)block {
	
    NSParameterAssert(block);
	@weakify(self);
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW,(seconds * NSEC_PER_SEC));
	dispatch_queue_t queue = dispatch_queue_create("com.Zangetsu.NSOperationQueueAdditions", 0);
    dispatch_after(popTime, queue, ^(void){
		@strongify(self);
        [self addOperationWithBlock:block];
    });
	dispatch_release(queue);
}

@end
