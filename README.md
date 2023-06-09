# Plank dock helper

This is a collection of small shell files written by me to add some capabilities to the Plank dock, especially supporting multi-screen display smoothly


## Features
- Support displaying dock on multi-monitor smoothly, even if the computer just wakes up from sleep, sleeps or restarts
- Runs automatically when the system boots as background mode, automatically adapts to monitor connect/disconnect events, and automatically adjusts to Plank dock display. You won't need to do it manually or every time you connect/disconnect an external monitor!
- Support automatic display of dock on external screen automatically when connecting/disconnecting a external monitor
- Maximum support for display on two screens
- Configure once, use many times. You only need to configure Plank once according to your preferences, and this shell script will help you apply that configuration across the entire screen you have!
- Highly customizable, you can edit these shell scripts to make them work the way you want them to!
- This shell script was written with one purpose in mind: Add smooth multi-monitor support to the Plank dock. No C, C++, just use pure bash statements, anyone can read to understand shell script and this script is not networkable, so privacy and transparency are guaranteed!

## Tested
This shell script has been tested and works fine on distros:

- Ubuntu 20.04 (GNOME Desktop)
- Xubuntu 20.04 (XFCE Desktop)
- Ubuntu 22.04 (GNOME Desktop)
- Xubuntu 22.04 (XFCE Desktop)

Other distributions using GNOME Desktop or XFCE Desktop will work fine, KDE Desktop may also work

## Installing

(You **MUST** install Plank on your system **first**!)

+ On Ubuntu (18.04 and up) and Debian-like distributions and Ubuntu-based Linux distributions like Linux Mint (19.* and up), Pop!_OS or Zorin OS **(don't use this PPA on elementary OS!!)**:

```
sudo add-apt-repository ppa:ricotz/docky
sudo apt-get update
sudo apt-get install plank
```

+ Fedora:

```
sudo dnf install plank plank-docklets
```

+ Arch Linux / Manjaro:

```
sudo pacman -S plank
```

+ openSUSE:

```
sudo zypper install plank
```

+ Solus OS:

```
sudo eopkg install plank
```

+ Or you can install Plank from source. You can download Plank source code from [Launchpad](https://launchpad.net/plank) or [Github](https://github.com/ricotz/plank)
+ On Arch Linux / Manjaro you can install the latest Plank from Git by using an unofficial [Arch User Repository package](https://aur.archlinux.org/packages/plank-git/)

# Configuration

- Once **Installing** done, run Plank. You can find Plank from the application menu, or press combine `Alt + F2` then type `plank`, then press `Enter` and configure the Plank dock according to your preferences. **Note DO NOT close Plank during configuration and after you have configured Plank dock according to your preferences!!**

- Copy the following files in the repository to your `HOME` directory (it is a `~` directory): `disable_second.sh`, `dock.sh`, `enable_second.sh`, `second_plank.sh`. Or you can use this command (when you are in root directory of this repository):

```
cp -r *.sh $HOME
```

- Then depending on your environment, XFCE or GNOME, there are two ways to do it. Make sure to follow the correct steps for your desktop environment:

### XFCE Desktop

- At the root of this archive, go to the `XFCE` folder, where you will see the file named `Dock.desktop`. Open the file in Mousepad, or using this command (when you already in `XFCE` folder, press right mouse then choose `Open Terminal here`), then type this command:

```
mousepad Dock.desktop
```

You will see something look like this:

```
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=Dock
Comment=Start dock at login
Exec=/home/duythanh/dock.sh &
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
```

Now, open Terminal, then type the command:

```
echo $HOME
```

then copy the result then close the Terminal, for example:

```
$ echo $HOME
/home/tester
```

In my case, `/home/tester` are the result I need to copy

Now, going back to the Mousepad that we opened the `Dock.desktop` with earlier, notice the line:

```
Exec=/home/duythanh/dock.sh &
```

Replace `/home/duythanh` with the result you copied earlier when executing `echo $HOME` command and keep everything else. For example, I have the result when I run command is: `/home/tester`, then the line of `Dock.desktop`:

```
Exec=/home/duythanh/dock.sh &
```

will changed to:

```
Exec=/home/tester/dock.sh &
```

Save the file and close Mousepad. Then, open Terminal, and type:

```
$ thunar ~/.config/autostart
```

Copy file `Dock.desktop` you have edited and paste into this directory, then close File Manager and Terminal.

Then, start `Settings -> Session and Startup -> Application Autostart`, then find the line say: `Dock (start dock at login`. If you see `Trigger` status say `on login`, you are ready to go!

### Other Desktop Environment (GNOME/KDE/etc.)

- At the root of this archive, go to the `Desktops` folder, where you will see the file named `Dock.desktop`. Open the file in gedit:

```
gedit Dock.desktop
```

You will see something look like this:

```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=Dock
Comment=Start dock at login
Exec=/home/duythanh/dock.sh &
StartupNotify=false
Terminal=false
Hidden=false
```

Now, open Terminal, then type the command:

```
echo $HOME
```

then copy the result then close the Terminal, for example:

```
$ echo $HOME
/home/tester
```

In my case, `/home/tester` are the result I need to copy

Now, going back to the Mousepad that we opened the `Dock.desktop` with earlier, notice the line:

```
Exec=/home/duythanh/dock.sh &
```

Replace `/home/duythanh` with the result you copied earlier when executing `echo $HOME` command and keep everything else. For example, I have the result when I run command is: `/home/tester`, then the line of `Dock.desktop`:

```
Exec=/home/duythanh/dock.sh &
```

will changed to:

```
Exec=/home/tester/dock.sh &
```

Close `gedit` app.

And follow the steps depending on the desktop environment you own to **enter the settings that configure the autostart applications.** 

Then add an entry that points to the `Dock.desktop` file located in the `Desktops` folder in this repository that you have edited earlier. 

Finally, set the **Trigger** to `on Login` or `when startup` according to your desktop environment and you are good to go!

## Running

- When you are completed all steps in **Configuration** section, now open Terminal then change directory to your `HOME` directory:

```
cd ~
```

then, type this command to mark shell scripts as executable:

```
chmod +x disable_second.sh
chmod +x enable_second.sh
chmod +x second_plank.sh
chmod +x dock.sh
chmod +x run.sh
```

Finally, type the command to launch shell script:

```
./run.sh
```

and then you are good to go! Now you can close Terminal window and continue working and enjoying!

# Issues

If you have any issues, feel free to open a new issue in `Issues` tab!

# Contribution

If you have any contributions to this repository or want to add features, please open a pull request in the `Pull Requests` section. All contributions are welcome and encouraged!

# Copyright

Copyright &copy; 2023 Nguyen Duy Thanh (segfault.e404). All right reserved.

# License

[GPLv3](https://github.com/Duy-Thanh/plank_dock_helper/blob/main/LICENSE)

