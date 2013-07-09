# Download and concatenate videos #

This is a collection of scripts to download videos from the Startup
Engineering course (and probably any other Coursera course) and join
them into one file. It comes in handy if you want to have the many small
videos of a lecture as one video file. You can also use the scripts to
merge the all course videos into one file.

## Usage ##

### Bring up an AWS instance ###

Bring up an AWS instance as was done previously in the lectures. I used
the Ubuntu Server 12.04.2 AMI.

### Clone this repository ###

    $ git clone https://github.com/sefrederik/coursera-videos
    $ cd coursera-videos
    $ chmod +x *.sh

### Install ffmpeg ###

We first need to install ffmpeg. Just run the script compile_ffmpeg.sh:

    $ ./compile_ffmpeg.sh

This is going to take a while -- a bit over one hour in a t1.micro
instance, so go grab a beverage of your choice.

### Download and convert the videos ###

The rest is easy. Go to the course page and look at the download URL of the first
and last video you want to download and join. For example, the first video of
lecture 4a is
https://class.coursera.org/startup-001/lecture/download.mp4?lecture_id=131.
Note down the lecture_id. The last video in lecture 4a has id 153.

To download all videos from id 131 to 153, run

    $ ./download_and_join.sh 131 153 lecture4a.mp4

This will download all videos and join them in the file lecture4a.mp4.

### Copy the files back to your computer ###

Use scp to copy the files back to your computer. For example, on *your*
computer (not the AWS instance), run:

    $ scp -i ~/YOUR_KEYFILE ubuntu@YOURINSTANCE:coursera-videos/lecture4a.mp4 .

This command copies lecture4a.mp4 from the AWS instance to your computer.

## Used software ##

These scripts call [ffmpeg](http://www.ffmpeg.org/) and
[wget](http://www.gnu.org/software/wget/). They also pull all
dependencies to compile ffmpeg, since the ffmpeg version shipped with
Ubuntu is rather ancient.

## Author ##

Frederik Hermans <frederik.ac.hermans+se@mail.google.com>
https://github.com/sefrederik/coursera-videos

