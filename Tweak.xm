#import <Foundation/Foundation.h>
#include <string>

%hook NSURL
+ (instancetype)URLWithString:(NSString *)URLString {
  NSString *baseUrl = [URLString absoluteString];
  NSString *prefixToReplace = @"https://iosviet.co/check-lic";
  NSString *replaceString = @"https://iosviet.node.np-platform.com/check-lic";
  NSString *newString = @"";
  if ([baseUrl hasPrefix:prefixToReplace]) {
    NSLog(@"[NPDev] Hooked -> %@", baseUrl);
    newString = [baseUrl stringByReplacingOccurrencesOfString:prefixToReplace withString:replaceString];
    NSLog(@"[NPDev] Patched -> %@", newString);
    URLString = newString;
  }
  return %orig;
}
%end