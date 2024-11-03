# VolumeControl
Set device volume either via a drag controller or two numeric input means; set volume level 0 - 100 or set level increment 1 - 10 which adjusts the volume to values of 10, 20, 30 etc. based on increment.

- The application only supports portrait orientation at this stage. 
- Tested on physical device iPhone 11 - iOS 17.6.1 and simulator iPhone 15 & iPad Pro.
- Tried setting initial device volume using AVAudioSession.sharedInstance() but this is a bit flaky as same value is retuned even if changing on physical device, seems to be know issue if your app doesn't actually play volume.
 
