#import <Foundation/Foundation.h>
#include <string>

%hook NSURL
+ (instancetype)URLWithString:(NSString *)URLString {
  NSString *replaceString = @"https://iosviet.node.np-platform.com/check-lic";
  NSString *prefixToReplace = @"https://iosviet.co/check-lic";
  NSString *newString = [URLString copy];
  if ([URLString hasPrefix:prefixToReplace]) {
    NSLog(@"[iHide] Hooked +[NSURL URLWithString:] -> %@", URLString);
    [newString stringByReplacingOccurrencesOfString:prefixToReplace withString:replaceString]
    return newString;
  }
  return %orig;
}
%end