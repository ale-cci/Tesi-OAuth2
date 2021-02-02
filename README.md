# Tesi Oauth
> Working Progress

##### Dependencies
* docker-compose: start jupyter notebook presentation

##### Compile tex files
```sh
$ docker-compose up xelatex
```

##### Start presentation
```sh
$ docker-compose up --build -d notebook server     # Start notebook
$ docker-compose logs notebook                     # Copy access token login in via web
```

##### Useful links
* [PDF completo della tesi](./res/oauth2.pdf)
* [Scaletta tesi](./scaletta.md)
* [Official OAuth protocol documentation](https://oauth.net/2/)
