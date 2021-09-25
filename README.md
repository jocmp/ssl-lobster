# SSL Lobster

A demo site using the [Rack lobster](https://www.rubydoc.info/gems/rack/Rack/Lobster) application to demo local SSL certs in Rack.

```
                             ,.---._
                   ,,,,     /       `,
                    \\\\   /    '\_  ;
                     |||| /\/``-.__\;'
                     ::::/\/_
     {{`-.__.-'(`(^^(^^^(^ 9 `.=========🔒
    {{{{{{ { ( ( (  (   (-----:=
     {{.-'~~'-.(,(,,(,,,(__6_.'=========🔑
                     ::::\/\
                     |||| \/\  ,-'/,
                    ////   \ `` _/ ;
                   ''''     \  `  .'
                             `---'
```

## Getting Started

Install [Homebrew](https://docs.brew.sh/) on your system before continuing.

1. Add an entry to your `/etc/hosts` file for `example.test`. Only do this once!
   ```
   make echo-host
   ```

2. Install app dependencies from Homebrew, for Ruby and Bundler.
    ```
    make install
    ```

3. Setup the app. This will install a certificate for example.test using [mkcert](https://github.com/FiloSottile/mkcert) and create the certificate and key files in the current directory, ignored by Git.
    ```
    make setup
    ```

4. Run it!
    ```
    make run
    ```
    You should see a familiar nautical crustacean in your web browser at <https://example.com:3001>. Note the use of HTTPS instead of an unsecured connection.

## Attribution

Check out this nifty [AppSignal](https://blog.appsignal.com/2016/11/23/ruby-magic-building-a-30-line-http-server-in-ruby.html) article for the original lobster setup.
