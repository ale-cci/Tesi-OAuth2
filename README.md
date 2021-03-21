# OAuth2 & OpenID
##### Dependencies
* `docker` + `docker-compose`: for jupiter notebook and pdf compilation

##### Compile tex files
```sh
$ docker-compose up latex-tesi latex-summary
```

##### Jupiter Notebook
This repo contains a useful notebook that will be my presentation.
With it you could play around with JWTs, see what they contain and
call interactively APIs using OAuth2.
```sh
$ docker-compose up --build -d notebook
```
Now go to [http://localhost:3333](http://localhost:3333/notebooks/OAuth2-presentation.ipynb) and start playing around with it.

###### Disclaimer:
In order to make all steps work you have to configure a google cloud project (extra steps are required)

##### Useful links
* [Summary (IT)](https://bitbucket.org/ale-cci/tesi-oauth2/downloads/summary.pdf)
* [PDF](https://bitbucket.org/ale-cci/tesi-oauth2/downloads/oauth2.pdf)
* [Official OAuth protocol documentation](https://oauth.net/2/)
