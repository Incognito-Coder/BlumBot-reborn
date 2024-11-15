# Bot for [Blum](https://alexell.pro/cc/blum)

![img1](.github/images/demo.png)

> **UPDATED TO BLUM API VERSION 2**

> 🇷🇺 README на русском доступен [здесь](README-RU.md)

## Functionality
| Feature                                                        | Supported  |
|----------------------------------------------------------------|:----------:|
| Multithreading                                                 |     ✅     |
| Binding a proxy to a session                                   |     ✅     |
| Claim daily grant                                              |     ✅     |
| Claim reward for friends                                       |     ✅     |
| Claim reward for tasks                                         |     ✅     |
| Automatic answer youtube tasks                                 |     ✅     |
| Automatic farming                                              |     ✅     |
| Automatic games                                                |     ✅     |
| Docker                                                         |     ✅     |

## [Options](https://github.com/Incognito-Coder/BlumBot-reborn/blob/main/.env-example)
| Option                  | Description                                                                |
|-------------------------|----------------------------------------------------------------------------|
| **API_ID / API_HASH**   | Platform data for launching a Telegram session (default: Android)          |
| **GAMES_ENABLED**       | Games enabled (True / False)                                               |
| **GAME_POINTS**         | Random number of points per game (e.g. [100,200], max. 280)                |
| **SLEEP_BETWEEN_GAME**  | Random delay between games (e.g. [10,20])                                  |
| **SLEEP_BETWEEN_START** | Sleep before start each session (e.g. [20,360])                            |
| **ERRORS_BEFORE_STOP**  | The number of failed requests after which the bot will stop                |
| **USE_PROXY_FROM_FILE** | Whether to use proxy from the `proxies.txt` file (True / False)            |

You can obtain the **API_ID** and **API_HASH** after creating an application at [my.telegram.org/apps](https://my.telegram.org/apps)

## Quick start
### Windows
1. Ensure you have **Python 3.10** or a newer version installed.
2. Use `INSTALL.bat` to install, then specify your API_ID and API_HASH in the .env file.
3. Use `START.bat` to launch the bot (or in the console: `python main.py`).

### Linux
1. Clone the repository: `git clone https://github.com/Incognito-Coder/BlumBot-reborn.git && cd BlumBot-reborn`
2. Run the installation: `chmod +x INSTALL.sh START.sh && ./INSTALL.sh`, then specify your API_ID and API_HASH in the .env file.
3. Use `./START.sh` to run the bot (or in the console: `python3 main.py`).

## Running in Docker
```
$ git clone https://github.com/Incognito-Coder/BlumBot-reborn.git
$ cd BlumBot-reborn
$ cp .env-example .env
$ nano .env # specify your API_ID and API_HASH, the rest can be left as default
```
### Docker Compose (recommended)
```
$ docker-compose run bot -a 1 # first run for authorization (override arguments)
$ docker-compose start # start in background mode (default arguments: -a 2)
```
### Docker
```
$ docker build -t blum_bot .
$ docker run --name BlumBot -v .:/app -it blum_bot -a 1 # first run for authorization
$ docker rm BlumBot # remove container to recreate with default arguments
$ docker run -d --restart unless-stopped --name BlumBot -v .:/app blum_bot # start in background mode (default arguments: -a 2)
```

## Manual installation
You can download [**Repository**](https://github.com/Incognito-Coder/BlumBot-reborn) by cloning it to your system and installing the necessary dependencies:
```
$ git clone https://github.com/Incognito-Coder/BlumBot-reborn.git
$ cd BlumBot-reborn

# Linux
$ cd BlumPayloadGenerator && bash start.sh && cd ..
$ python3 -m venv venv
$ source venv/bin/activate
$ pip3 install -r requirements.txt
$ cp .env-example .env
$ nano .env # specify your API_ID and API_HASH, the rest can be left as default
$ python3 main.py

# Windows (first, install Python 3.10 or a newer version)
> # you should run payload server
> cd BlumPayloadGenerator
> start /MIN start.bat
> cd ..
> python -m venv venv
> venv\Scripts\activate
> pip install -r requirements.txt
> git submodule init
> git submodule update
> copy .env-example .env
> # specify your API_ID and API_HASH, the rest can be left as default
> python main.py
```

Also for quick launch you can use arguments:
```
$ python3 main.py --action (1/2)
# or
$ python3 main.py -a (1/2)

# 1 - Create session
# 2 - Run bot
```

## Running a bot in the background (Linux)
```
$ cd BlumBot-reborn

# with logging
$ setsid venv/bin/python3 main.py --action 2 >> app.log 2>&1 &

# without logging
$ setsid venv/bin/python3 main.py --action 2 > /dev/null 2>&1 &

# Now you can close the console, and the bot will continue its work.
```

### Find the bot process
```
$ ps aux | grep "python3 main.py" | grep -v grep
```