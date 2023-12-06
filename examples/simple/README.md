# simple

This is a very basic example of how to use labdiscoverylib.

Do not use it as a basis, since the other examples are easier to maintain (e.g., configuration in a different file, etc.).

So as to run it, in Linux / Mac OS X:

```shell

 $ export FLASK_DEBUG=1
 $ export FLASK_APP=example.py
 $ flask run

```

In Microsoft Windows:
```shell
 C:\...\> set FLASK_DEBUG=1
 C:\...\> set FLASK_APP=example.py
 C:\...\> flask run
```

And you can test it using [LabDiscoveryEngine](https://developers.labsland.com/labdiscoveryengine/en/stable/) or using the labdiscoverylib command line interface in other terminal:

```shell

 $ export FLASK_APP=example.py
 $ flask weblab fake new
```
