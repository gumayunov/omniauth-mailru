# OmniAuth Mail.ru

This gem contains the unofficial Mail.ru OAuth2 strategy for [OmniAuth](http://github.com/intridea/omniauth).

[![Build Status](https://secure.travis-ci.org/gumayunov/omniauth-mailru.png)](http://travis-ci.org/gumayunov/omniauth-mailru)

## Basic Usage

    use OmniAuth::Builder do
      provider :mailru, ENV['MAILRU_KEY'], ENV['MAILRU_PRIVATE_KEY']
    end

Callback url can be passed in order to match specified one on Mail.ru side in application preferences.

    use OmniAuth::Builder do
      provider :mailru, ENV['MAILRU_KEY'], ENV['MAILRU_PRIVATE_KEY'], {
        :authorize_options => {
          :callback_url => ENV['MAILRU_CALLBACK_URL']
        }
      }
    end

## Links

* http://api.mail.ru/docs/guides/oauth/

## License

Copyright (c) 2011 by Victor Gumayunov

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

