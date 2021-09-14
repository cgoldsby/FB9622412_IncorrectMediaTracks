# tvOS 15 beta 9 (19J5346a) AVPlayerViewController has incorrect Subtitle & Audio tracks

Feedback Assistant: [9622412](https://feedbackassistant.apple.com/feedback/9622412)

When AVPlayerViewController is reused, the Subtitle & Audio track UI always shows the initial stream data. The subtitle & audio track UI in the top tab bar does not update when a new streams is started. This bug is unique to apps built with a version of Xcode older than Xcode 13, i.e., Xcode 12.5 (12E262), but running on an Apple TV device with tvOS 15.

In this use case the app uses the pre-tvOS 15 player UI, where subtitles and audio tracks are in the top tab bar. The behavior is not reproducible if the app is running on an Apple TV device with tvOS 14.7.

For example, suppose a stream with a German audio track is started. In that case, a new stream is started with an English audio channel using the same AVPLayerViewController, then the Audio tab will still show "German" and not "English."

## Steps to reproduce:

This behavior is reproducible when reusing an AVPlayerViewController. The app needs to be built using **Xcode 12.5** and installed on a device with **tvOS 15**.

1. Build, archive, and export an app on Xcode 12.5.
2. Install the app using Xcode, TestFlight or Apple Configurator 2 on an Apple TV with tvOS 15.
3. Open the app and present the AVPlayerViewController with a stream that has subtitles & audio tracks.
4. Swipe down and note the different subtitles & audio tracks. The user can switch subtitles & audio tracks successfully.

| Stream 1 - Correct subtitle track | Stream 1 - Correct audio track |
| ---            | ---
|![Correct subtitle track](img/correct-subtitle-track-stream1.png)|![Correct audio track](img/correct-audio-track-stream1.png)|

5. Press the menu to dismiss the AVPlayerViewController.
6. Using the same AVPlayerViewController, replace the AVPlayer with a new instance that uses a stream with no subtitle & audio tracks. Present the AVPlayerViewController.
7. Swipe down and note that the subtitle & audio tracks are incorrect and are the same as the stream started in Step 1. Selecting the subtitle or audio track does nothing.

| Stream 2 - Wrong subtitle track | Stream 2 - Wrong audio track |
| ---            | ---
|![Wrong subtitle track](img/incorrect-subtitle-track-stream2.png)|![Wrong audio track](img/incorrect-audio-track-stream2.png)|

| Stream 2 - Expected media track |
| ---            |
|![Correct media track](img/correct-audio-track-stream2.png)|

The order in which stream is played first matters: If a stream with no subtitles & audio track starts first, then the 2nd stream will also have no subtitles & audio tracks, even if it should.

| Stream 1 - Incorrect audio track |
| ---    
|![Incorrect audio track](img/incorred-audio-track-stream1.png)|

The expected behavior is that when a new instance of AVPlayer is assigned to the player property of AVPlayerViewController, then the subtitle & audio UI represents the correct data for that stream.

#### Os version
![os version](img/os-version.png)
