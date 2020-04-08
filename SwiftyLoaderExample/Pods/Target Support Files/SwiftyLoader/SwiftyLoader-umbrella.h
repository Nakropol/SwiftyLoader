#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SwiftyLoader.h"

FOUNDATION_EXPORT double SwiftyLoaderVersionNumber;
FOUNDATION_EXPORT const unsigned char SwiftyLoaderVersionString[];

