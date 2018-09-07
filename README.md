# Bash GNOME

### `rm gnome*` 
Did you realise after updating your system that some features provided by GNOME apps were not working anymore? – Arch users you know what I'm talking about!  
Do you have a need for extensively customising your system and you are not satisfied by bloatware preventing you to see what is happening under the hood?  
Or do you intend to run GUI apps on a machine lacking horsepower?  
Then this project is meant for you!

The aim is to replace a significant part of the GNOME desktop environment with highly modulable, lightweight and KISS-compliant components in order to give more control to the powerful user you are over the functioning of your environment.

This project consists of my Fluxbox configuration which fits the Numix theme, along with homemade scripts and a list of carefully selected pieces of software.  
The current solution relies on the good old X server, though I plan to explore solutions around Wayland.

---

### Dependencies
+ [`fluxbox`](https://github.com/fluxbox/fluxbox): ultralight window manager
  + [`maim`](https://github.com/naelstrof/maim): powerful screen capture tool, very nice alternative to `gnome-screenshot`
  + `kbd_brightness`: changes keyboard brightness
    + designed for Asus laptops but it shouldn't be tricky to adapt it for other configurations
	+ Polkit rule to gain root privileges temporarily (`org.bash-gnome.kbd-brightness.policy`)
  + `gmrun`: textual app launcher
+ `compton`: standalone compositor
+ GTK theme: Numix
+ `libcanberra`: used by scripts for playing notification sounds
+ `conky`: see my config [here](https://github.com/Tumlinh/conky-config)
+ Standalone scripts:
  + `battman.sh`
    + locks screen after inactivity (requires [`xprintidle`](https://github.com/g0hl1n/xprintidle) and [`slock`](https://github.com/chjj/slock))
    + alarm on low battery
  + `chwp.sh`: changes your wallpaper (periodically or not)

### How to
+ Install dependencies
+ Copy `kbd_brightness` to `/usr/bin`
+ Copy `org.bash-gnome.kbd-brightness.policy` to `/usr/share/polkit-1/actions`
+ Overwrite your `~/.fluxbox` configuration with this repo's
+ Add standalone scripts to startup

### Going further
Here is a small list of alternatives to some GNOME applications:  

GNOME app           | Alternative
--------------------|------------
`nautilus`          | `pcmanfm`
`gedit`             | `medit`, `vim`
`gnome-terminal`    | [`tilda`](https://github.com/lanoxx/tilda)
Notification server | `dunst`
Network manager     | `systemd-networkd`, `systemd-resolved`, `wifi-menu`
Wallpaper setter    | [`nitrogen`](https://github.com/l3ib/nitrogen)