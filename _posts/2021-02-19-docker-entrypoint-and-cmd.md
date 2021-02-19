In this post I would like to discuss relationship of `ENTRYPOINT` and 
`CMD` commands in `Dockerfile`, since documentation on website lacks sufficient detail.

What we would like to find is how to construct a command line where some positional parameters can be inserted before fixed part of command, then other parameters can be appended.

Turns out this is possible with following docker file:

Imagine following docker file :
```dockerfile
{% include busybox.Dockerfile %}
```

Then we build container with 
```shell 
docker build . -f _includes/busybox.Dockerfile -t echo
``` 
And run it:
```shell
$ docker run --rm echo start rest of sentence
start fixed_part rest of sentence
```


And that's it!