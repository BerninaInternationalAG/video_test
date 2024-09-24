import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15

ApplicationWindow {
    id: main
    width: 1280
    height: 800
    visible: true
    title: qsTr("Hello World")

    MediaPlayer {
        id: mediaPlayer1
        property string realFile: "01_llama_drama_1080p.mp4"
        // 1 source: "file:///usr/share/share/" + realFile
        // 2 source: "gst-pipeline: filesrc location=/usr/share/share/" + realFile + " ! qtdemux ! h264parse ! imxvpudec ! qtvideosink"
        // 3 source: "gst-pipeline: filesrc location=/usr/share/share/" + realFile + " ! qtdemux ! h264parse ! v4l2h264dec ! qtvideosink"
        autoPlay: true
        loops: MediaPlayer.Infinite
        volume: 0.0
    }

    VideoOutput {
        width: main.width / 4
        height: main.height / 4
        source: mediaPlayer1
        fillMode: VideoOutput.PreserveAspectFit
    }

}
