//
//  CMDQueryStringMultipleBracketedKeysArrayTransformer.h
//  CMDQueryStringSerialization
//
//  Created by Bryan Irace on 1/26/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

#import "CMDQueryStringArrayTransformer.h"

/**
 Transforms a key and array of values into multiple key/value pairs where the key is suffixed with `[]`.
 */
@interface CMDQueryStringMultipleBracketedKeysArrayTransformer : NSObject <CMDQueryStringArrayTransformer>

@end
