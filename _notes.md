# Blog Notes

## Local Jekyll Environment Using Docker (No Ruby on Your System)

To build the image
`docker build -t jekyll-blog .`

To run the image 
`docker run --rm -v "$(pwd):/site" -p 4000:4000 jekyll-blog`

Initialise a new jekyll website in a repo (only need to do this the first time)
`docker run --rm -v "$(pwd):/site" jekyll-blog jekyll new .`

Serve your site locally to view it in the browser
`docker run --rm -v "$(pwd):/site" -p 4000:4000 jekyll-blog`

[view blog](http://localhost:4000)
