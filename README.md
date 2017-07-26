# InstallScripts
Stuff for setting up a new OS X machine

TODO:
  Add a script thhat pulls upstream master from a list of directories containing git repos. Then, add an example of a cron job that can run this daily. Make sure it can read the list from an env variable

# Some useful aliases:

```
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" -a'
```
