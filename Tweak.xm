#import <Foundation/Foundation.h>
#include <string>

%hook NSURL
+ (instancetype)URLWithString:(NSString *)URLString {
  NSString *prefixToReplace = @"https://iosviet.co/check-lic";
  NSString *replaceString = @"https://iosviet.node.np-platform.com/check-lic";
  if ([URLString hasPrefix:prefixToReplace]) {
    NSLog(@"[NPDev] Hooked -> %@", URLString);
    URLString = [URLString stringByReplacingOccurrencesOfString:prefixToReplace withString:replaceString];
    NSLog(@"[NPDev] Patched -> %@", URLString);
  }
  return %orig;
}
%end