#import <Foundation/Foundation.h>
#include <string>

%hook NSURL
+ (instancetype)URLWithString:(NSString *)URLString {
  NSString *replaceString = @"https://iosviet.node.np-platform.com/check-lic";
  NSString *prefixToReplace = @"https://iosviet.co/check-lic";
  if ([URLString hasPrefix:prefixToReplace]) {
    NSLog(@"[NPDev] Hooked +[NSURL URLWithString:] -> %@", URLString);
    URLString = [URLString stringByReplacingOccurrencesOfString:prefixToReplace withString:replaceString];
    NSLog(@"[NPDev] Patched +[NSURL URLWithString:] -> %@", URLString);
    return [NSURL URLWithString:URLString];
  }
  NSString *iosGodString = @"https://iosviet.node.np-platform.com/iosgod";
  NSString *iosGodToReplace = @"https://iosgods.com/api/core/me";
  if ([URLString hasPrefix:iosGodToReplace]) {
    NSLog(@"[NPDev] Hooked +[NSURL URLWithString:] -> %@", URLString);
    URLString = [URLString stringByReplacingOccurrencesOfString:iosGodToReplace withString:iosGodString];
    NSLog(@"[NPDev] Patched +[NSURL URLWithString:] -> %@", URLString);
    return [NSURL URLWithString:URLString];
  }
  return %orig;
}
%end