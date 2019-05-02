# game-controller-docker
Docker images built for running GameController of RoboCup Humanoid League

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
