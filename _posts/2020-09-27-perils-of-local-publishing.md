Today I want to share few issues I've encountered while setting up local publishing for GitHub pages with Jekyll & Suggested Cayman theme.

As you would have imagined, when publishing a blog post / site and rely on GitHub publishing mechanism one wants ability to see these pages renderred locally.
GitHub suggests running [Jekyll site transformer locally](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/testing-your-github-pages-site-locally-with-jekyll#updating-the-github-pages-gem), since I am not huge fan of installing Ruby packages left & right onto my system, I chose to do following:
1. Find jeckyll docker container
1. Run container & expose source code for Jekyll publishing from the host machine.
1. Look at published code 

GitHub offers link to [official Jekyll continer](https://hub.docker.com/r/jekyll/jekyll/tags), and it needs few tweaks to work efficiently:
1. Provide named volume for Ruby bundler, so filesystem changes to gems will persist over container life, via `-v "iggyzap-jekyll-cache:/usr/local/bundle"` parameter passed down to docker run command
1. Provide named volume for Ruby Gems, so gems downloaded & installed for Jekyll will be remembered between containers via `-v "iggyzap-gems:/usr/gem"`
1. Be explicit on port mappings for container `-p 4000:4000`
1. Run jekyll serve in verbose mode + enable configuration override for local build environment without polluting main `_config.yml` file which is used by GitHub pages publishing process

This results in following command line for docker (assuming container is started from root of the directory):
```bash
docker run --rm --volume "${PWD}:/srv/jekyll" \
-v "iggyzap-jekyll-cache:/usr/local/bundle" -v "iggyzap-gems:/usr/gem" \
-it -p 4000:4000 jekyll/builder:4.1.0 \
jekyll s --incremental -l -V -b /pages/iggyzap \
--config _config.yml,_config-local.yml
```

More on `--config` parameter: I am passing 2 config files to `--config` jekyll invocation, so I can override default settings that are good for GitHub Pages publishing process while maintaining local environment publishing configuration under source control.

NB: Right now README.md is not regenerated on newly published post, so I have to change it manually every time. I will be looking to solve this later.

[Reference material](https://github.com/iggyzap/iggyzap.github.io)
