# Download and concatenate videos #

This is a collection of scripts to download videos from the Startup
Engineering course (and probably any other Coursera course) and join
them into one file. It comes in handy if you want to have videos
spanning multiple lectures as one video.

## Usage ##

### Bring up an AWS instance ###

Bring up an AWS instance, as was done previously in the lectures. I used
the Ubuntu Server 12.04.2 AMI.

### Clone this repository ###

    $ git clone https://github.com/sefrederik/coursera-video
    $ cd coursera-video
    $ chmod +x *.sh

### Install ffmpeg ###

We first need to install ffmpeg. Just run the script compile\_ffmpeg.sh:

    $ ./compile\_ffmpeg.sh

This is going to take a while -- a bit over one hour in a t1.micro
instance, so go grab a beverage of your choice.

### Download and convert the videos ###

The rest is easy. Go to the course page and look at the download URL of the first
and last video you want to download. For example, the first video of
lecture 4a is
https://class.coursera.org/startup-001/lecture/download.mp4?lecture\_id=131.
Note down the lecture\_id. The last video in lecture 4a has id 153.

To download all videos from id 131 to 153, run

    $ ./download_and_join.sh 131 153 lecture4a.mp4

This will download all videos and join them in the file lecture4a.mp4.

### Copy the files back to your computer ###

Use scp to copy the files back to your computer. For example, on *your*
computer (not the AWS instance), run:

    $ scp -i ~/YOUR_KEYFILE ubuntu@YOURINSTANCE:coursera-video/lecture4a.mp4  .

This command copies lecture4a.mp4 from the AWS instance to your computer.
