# Docker-ruby-node-phantomjs

Starting point for running Rails specs - includes ruby 2.3.3, node 6.10.1 and
webkit

## What's inside

The supplied `Dockerfile` will create an images for docker containers
with ruby, nodejs and libwebkit. Mainly to run the headless tests of karma.

This README assume a working docker environment,
for OSX ([boot2docker](http://boot2docker.io/)) provides a adequate way to set this up.

## Getting started

### Getting the image

```
$ docker pull prograils/ruby-node-webkit
```

### Building the image (locally)

```
$ docker build prograils/ruby-node-webkit
```

### Running

```
$ docker run -t -i prograils/ruby-node-webkit
```

### Testing
```
$ bundle exec rspec
```


## References

* [Test Drive Your Dockerfiles with RSpec and ServerSpec](https://robots.thoughtbot.com/tdd-your-dockerfiles-with-rspec-and-serverspec)
* [PhantomJS binairy for Ubuntu 14.04](https://github.com/edwinvdgraaf/phantomjs-build)

## Based on

* [edwinvdgraaf/docker-ruby-node-phantomjs](https://github.com/edwinvdgraaf/docker-ruby-node-phantomjs)
* [mlitwiniuk/docker-ruby-node-phantomjs](https://github.com/mlitwiniuk/docker-ruby-node-phantomjs)
