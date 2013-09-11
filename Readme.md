
### Requirement

The purpose of this project is merge h264 video and aac audio to one ts stream, which can be played by VLC, the test video and audio is at the demo diretory.


### Solution

Tstool: ./esmerge ~/Downloads/video.h264  ~/Downloads/audio.au  ~/Downloads/xxx.ts

FFMpeg: ffmpeg -i ~/Downloads/audio.au -i ~/Downloads/video.h264 -vcodec copy -acodec copy ~/Downloads/xxx.ts