# htop-android
Practise cross-compiling some tool for android.
Including the following packages:

- ncurses-6.0
- htop-2.02
- lsof-4.89

# note
## configure: error: missing libraries:  libncurses
- solution
in /odm/lib create a soft link for ncurses.so.6.0
`ln -s libncurses.so.6.0 libncurses6.so` 

## How to Run

```
export TERM=xterm
export LD_LIBRARY_PATH=/odm/lib
./htop
```

# Refference
https://blog.csdn.net/alien75/article/details/52755299


