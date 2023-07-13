Xvfb :0 -screen 0 1024x768x16 && sleep 5 && gst-launch-1.0 videotestsrc ! videoconvert ! autovideosink
