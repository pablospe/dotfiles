# How to build?

    docker build \
      --build-arg user=$USER   \
      --build-arg uid=$(id -u) \
      --build-arg gid=$(id -g) \
      --build-arg shell=$SHELL \
      -f Dockerfile.dev        \
      -t $(hostname)-docker .

# How to run?

## Detach mode for ssh usage

    docker run -it -d --rm          \
      -v ~/.ssh:/home/$USER/.ssh    \
      -v <code-dir-path>:/code   \
      -v <data-dir-path>:/data   \
      -p 2222:22                    \
      --hostname $(hostname)-docker \
      $(hostname)-docker

Note: this assume you have a `code` folder (where the code gets compiled with
the compiles/tools installed on the docker image), and a `data` folder (where
data for processing with the compiled code will live).

## Access with ssh

    ssh $USER@$(hostname) -p 2222

Note: this assume `~/.ssh/authorized_keys` has your local  `~/.ssh/id_rsa.pub`. See troubleshooting section.


## Attach a shell directly

    docker run -it --rm             \
      -v ~/.ssh:/home/$USER/.ssh    \
      -p 2222:22                    \
      --hostname $(hostname)-docker \
      $(hostname)-docker            \
      zsh



See: https://stackoverflow.com/questions/51809181/how-to-run-tmux-inside-a-docker-container/51814791#51814791

# Troubleshooting

This assumes one has a private/public key pairs in `~/.ssh/authorized_keys`,
otherwise just do:

    copy-id -i ~/.ssh/id_rsa.pub localhost

in case `localhost` exists in `~/.ssh/known_hosts`, it will complain saying you
should run the following command:

    ssh-keygen -f "/home/pablo/.ssh/known_hosts" -R "localhost"
