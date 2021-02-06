# Oauth2 & OpenID
##### Dependencies
* `docker` + `docker-compose`: for jupiter notebook and pdf compilation

##### Compile tex files
```sh
$ docker-compose up xelatex
```

##### Start presentation
```sh
$ docker-compose up --build -d notebook
```
Now go to http://localhost:3333/notebooks/OAuth2-presentation.ipynb and you should see the presentation.

##### Disclaimer:
In order to make all steps work you have to configure a google cloud project (extra steps are required)

##### Useful links
* PDF tesi (spostato)
* [Scaletta tesi](./scaletta.md)
* [Official OAuth protocol documentation](https://oauth.net/2/)
