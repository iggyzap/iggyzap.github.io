#!/bin/bash
docker run --rm \
  --volume "${PWD}:/srv/jekyll" -v "iggyzap-jekyll-cache:/usr/local/bundle" -v "iggyzap-gems:/usr/gem" \
  -it -p 4000:4000 jekyll/builder:4.1.0 \
  jekyll s --incremental -l -V -b /pages/iggyzap \
  --config _config.yml,_config-local.yml 
