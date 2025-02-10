/*
 * DISCLAIMER:
 *
 * This tweak template is provided for educational and research purposes only.
 * It is provided "as is" without any express or implied warranty. Under no circumstances
 * shall the author(s) be liable for any direct, indirect, incidental, or consequential damages
 * arising from the use or misuse of this code.
 *
 * Use this code at your own risk. Before using, modifying, or distributing it, ensure that you have
 * the necessary rights, permissions, and that your actions comply with all applicable laws, regulations,
 * and the terms of service of your device or software. Note that modifications to system behavior,
 * including spoofing or altering identifiers, may void warranties or be considered a violation of
 * software policies.
 *
 * This code is intended for use in environments where such modifications are permitted (e.g., jailbroken devices)
 * and is not supported or endorsed by any third-party vendors. If you do not agree with these terms, do not use,
 * modify, or distribute this code.
 */

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
