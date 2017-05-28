//
//  FZYFileUtils.m
//  百思不得姐
//
//  Created by Feng Zuyan on 17/5/28.
//  Copyright © 2017年 Feng Zuyan. All rights reserved.
//

#import "FZYFileUtils.h"

@implementation FZYFileUtils

+ (NSUInteger)getFileSize:(NSString *)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDictionary *attrs = [manager attributesOfItemAtPath:path error:nil];
    
    if ([attrs.fileType isEqualToString:NSFileTypeRegular]) {
        return attrs.fileSize;
    }
    
    NSUInteger totalSize = 0;
    
    NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:path];
    for (NSString *subPath in enumerator) {
        NSString *subFullPath = [path stringByAppendingPathComponent:subPath];
        totalSize += [manager attributesOfItemAtPath:subFullPath error:nil].fileSize;
    }
    
    return totalSize;
}

@end
