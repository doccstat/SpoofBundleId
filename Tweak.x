#import <Foundation/Foundation.h>

#define SPOOFED_BUNDLE_ID @"ORIGINAL_BUNDLE_ID"

%hook NSBundle

- (NSString *)bundleIdentifier {
    // Use a static counter to track the number of spoofed returns.
    static int spoofCount = 0;

    // Get the original bundle identifier.
    NSString *origBundleId = %orig;

    // If the original bundle id matches our target and we haven't spoofed twice yet...
    if ([origBundleId isEqualToString:@"REAL_BUNDLE_ID"] && spoofCount > -1) {
        spoofCount++;
        NSLog(@"Spoofing bundle ID from %@ to %@ (spoof count: %d)", origBundleId, SPOOFED_BUNDLE_ID, spoofCount);
        return SPOOFED_BUNDLE_ID;
    }

    // Otherwise, return the original bundle identifier.
    return origBundleId;
}

- (id)objectForInfoDictionaryKey:(NSString *)key {
    // Use a static counter for the objectForInfoDictionaryKey: hook.
    static int spoofInfoCount = 0;

    if ([key isEqualToString:@"CFBundleIdentifier"]) {
        NSString *origValue = %orig;
        if ([origValue isEqualToString:@"REAL_BUNDLE_ID"] && spoofInfoCount > -1) {
            spoofInfoCount++;
            NSLog(@"Spoofing InfoDict key %@ from %@ to %@ (spoof count: %d)", key, origValue, SPOOFED_BUNDLE_ID, spoofInfoCount);
            return SPOOFED_BUNDLE_ID;
        }
    }

    return %orig;
}

%end
