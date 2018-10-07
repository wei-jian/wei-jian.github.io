# grtlr.github.io
Personal webpage including CV and publications. You can find my website at: https://www.jgoertler.com

## Development

The `master` branch only contains the finished static version of the website. The actual *Haskell* code that generates the website lives in the `develop` branch. After pushing a new commit to the `develop` branch the site is automatically rebuild and deployed to the `master` branch using *Travis CI*.

For local development you can build the site by using `stack`:

    stack build
    stack exec site build
    
*Hakyll* also provides a development server, which can be started by:

    stack exec site watch
