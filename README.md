### OpenCV3 Debian
For use with Travis builds when OpenCV3 is needed instead of 2.4

### Installing OpenCV3 on Ubuntu 16.04
Clone with `--depth=1`.

This Debian package is compatible with only Ubuntu 16.04 and `amd64` architecture.
Additional dependencies may be needed, and the package can be installed with
```bash
sudo dpkg -i opencv3_3.4.0-1_amd64.deb
```

### Missing Dependencies
You may need to install
```
sudo apt install ffmpeg libtesseract3
```

If you ran this after attempting `dpkg` you may need to run `sudo apt-get -f install` to 
fix the dependency issues.

Some runtime libraries are also needed
```
sudo apt install libxine2 liblapack3 libblas3
```
