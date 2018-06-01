# BASH PROFILE

## Installation:

Open Terminal or CLI and run the following to clone and install:
`git clone https://github.com/trvswgnr/taw-bash-profile.git ~/taw-bash-profile && cd ~/taw-bash-profile && sh ./install.sh`

-- OR --

Download this repo. Open Finder. Move this folder to your home folder (i.e. "/Users/travis/") and rename the folder "bash_profile". Move `bash_profile` to your home folder, rename file to `.bash_profile`, and replace file if prompted.


## Dependencies / Package Managers

**[Homebrew][brew]**
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**Python**
```bash
brew install python && ln -s /usr/local/bin/python3 /usr/local/bin/python
```

**PIP**
```bash
sudo -H python get-pip.py
```

**Go**
```bash
brew install go
```

**Wget**
```bash
brew install wget
```

[brew]: https://brew.sh/

## Packages List:
* [rtv][reddit] - Great reddit client
* [pm][pm] - Quickly define project folders and navigate to them
* [spotctl][spotify] - Spotify player
* [trash][trash] - Safe alternative to `rm`
* [slackadaisical][slack] - Basic Slack client
* [rainbowstream][twitter] - Twitter stream
* [w3m][w3m] - Web browser

[reddit]: https://github.com/michael-lazar/rtv
[trash]: https://github.com/sindresorhus/trash-cli
[spotify]: https://github.com/jingweno/spotctl
[slack]: https://github.com/bkanber/Slackadaisical
[twitter]: http://lmgtfy.com/?q=rainbowstream
[w3m]: http://brewformulas.org/W3m
[pm]: https://github.com/Angelmmiguel/pm