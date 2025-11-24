FROM ruby:3.3-slim

# Install dependencies for Jekyll
RUN apt-get update && \
    apt-get install -y build-essential nodejs git && \
    gem install bundler jekyll

WORKDIR /site
VOLUME ["/site"]

CMD ["jekyll", "serve", "--watch", "--drafts", "--livereload", "--host", "0.0.0.0"]

# docker build -t jekyll-blog .
# docker run --rm -v "$(pwd):/site" -p 4000:4000 jekyll-blog
