# game-controller-docker
Docker images built for running GameController of RoboCup Humanoid League.

## Build
```bash
$ docker build -t corenel/game-controller:latest -f Dockerfile  .
```

## Run

```bash
$ git clone https://github.com/ZJUDancer/game-controller.git
$ docker pull corenel/game-controller
$ ./run.sh
```

## Tips

You can specify arguments for the GameController by modifying the `run.sh` or directly passing them.

The supported arguments are listed in the following:

```
Usage: java -jar GameController.jar {options}
  (-h | --help)                   display help
  (-t | --test)                   use test-mode - currently only disabling the delayed switch to playing in SPL
  (-i | --interface) <interface>  set network interface (default is a connected IPv4 interface)
  (-l | --league) (hl_kid | hl_teen | hl_adult | hl_dropin | hl_dropin | hl_dropin | hl_dropin)
                                  select league (default is spl)
  (-w | --window)                 select window mode (default is fullscreen)
```

The most important arguments are `--interface` and `--league`. For example, you can use:

```bash
$ ./run.sh -l hl_kid -i eth0
```

