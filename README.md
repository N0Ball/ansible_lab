# Introduction
This is a simple project for practicing ansible with docker

# Pre-requirements
```sh 
ls ~/.ssh
```

check if you have `id_rsa.pub` and `id_rsa`, if not simply just do `ssh-keygen`

# Usage
## Build Project
```sh
make build
```

## Start Project
```sh
make up
```

## Connect to controller
```sh
make con
```

## Test 
```sh
make run
```