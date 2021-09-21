//
//  ViewController.swift
//  FB9622412_IncorrectMediaTracks
//
//  Created by Christopher Goldsby on 9/14/21.
//

import AVKit

final class ViewController: UIViewController {

    private let playerViewController = AVPlayerViewController()

    @IBAction
    private func presentPlayerOne() {
        // Stream has multiple audio & subtitle tracks
        let url = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
        playerViewController.player = AVPlayer(url: url)
        playerViewController.player?.play()
        present(playerViewController, animated: true)
    }

    @IBAction
    private func presentPlayerTwo() {
        // Stream has zero audo & subtitle tracks
        let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
        playerViewController.player = AVPlayer(url: url)
        playerViewController.player?.play()
        present(playerViewController, animated: true)
    }

    /*
        Workaround 1: Replace AVPlayerItem instead of AVPlayer.

        The code below replaces the AVPlayerItem instead of an AVPlayer. This code does work and the issue is not reproducible. The issue appears to be related to updating the player property of AVPlayerViewController.

        However, the list of audio options are cut off and the layout does not display the full list of items.
     */

//    @IBAction
//    private func presentPlayerOne() {
//        // Stream has multiple audio & subtitle tracks
//        presentPlayer(with: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")
//    }
//
//    @IBAction
//    private func presentPlayerTwo() {
//        // Stream has zero audo & subtitle tracks
//        presentPlayer(with: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
//    }
//
//    private func presentPlayer(with urlString: String) {
//        let url = URL(string: urlString)!
//
//        if playerViewController.player == nil {
//            playerViewController.player = AVPlayer(url: url)
//        }
//        else {
//            let item = AVPlayerItem(url: url)
//            playerViewController.player?.replaceCurrentItem(with: item)
//        }
//
//        playerViewController.player?.play()
//        present(playerViewController, animated: true)
//    }
}
