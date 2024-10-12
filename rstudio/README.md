# RStudio

Compose will symlink your `/rstudio` (except `/home/rstudio`) to `/home` in the container. You must first

```sh
sudo mkdir /rstudio
sudo chown 1000:1000 /rstudio
```

You also have to recreate all users using `adduser.sh [USER]` in the RStudio terminal logged in with `rstudio` every time you rebuild the container.