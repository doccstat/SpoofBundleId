## Please star this repo if you find it useful.

> [!IMPORTANT]
> Spoofing the bundle id of an app may cause the app to behave unexpectedly
> (e.g. not being able to request permissions). Use at your own risk.

1.  [Fork this repo.](https://github.com/doccstat/SpoofBundleId/fork)
2.  Modify the files as needed.
    - Open [`control`](./control) and edit `Package: com.lixingchi.spoofbundleid` to your own package name, etc.
    - Open [`Makefile`](./Makefile) and edit `INSTALL_TARGET_PROCESSES = EXECUTABLE_NAME` to the name of the app you want to spoof.
    - Open [`SpoofBundleId.plist`](./SpoofBundleId.plist) and [`Tweak.x`](./Tweak.x) and edit `REAL_BUNDLE_ID` to the bundle id you have.
    - Open [`Tweak.x`](./Tweak.x) and edit `ORIGINAL_BUNDLE_ID` to the bundle id of the app you want to spoof to. Modify `spoofCount > -1` to limit the number of spoofs.
3.  Run `make package` in the terminal
4.  The deb can be found in the `./packages` folder

```plaintext

DISCLAIMER:

This tweak template is provided for educational and research purposes only.
It is provided "as is" without any express or implied warranty. Under no circumstances
shall the author(s) be liable for any direct, indirect, incidental, or consequential damages
arising from the use or misuse of this code.

Use this code at your own risk. Before using, modifying, or distributing it, ensure that you have
the necessary rights, permissions, and that your actions comply with all applicable laws, regulations,
and the terms of service of your device or software. Note that modifications to system behavior,
including spoofing or altering identifiers, may void warranties or be considered a violation of
software policies.

This code is intended for use in environments where such modifications are permitted (e.g., jailbroken devices)
and is not supported or endorsed by any third-party vendors. If you do not agree with these terms, do not use,
modify, or distribute this code.

```
