# armr
Docker ARM containers for R

## Usage
First build the base image in the root folder. On first build this can take some time.
```
docker build -t armr .
```

Then you can run it.
```
docker run -it armr
```

Or you can build another image that is based off _armr_.

```
cd plumber
docker build -t plumber .
docker run --rm -p 8000:8000 plumber
```

## Sub images
All these sub images rely on the base image, armr, and are experimental.

* plumber
* doparallel
* rstudioserver

## Notes
Plumber is a work in progress.
