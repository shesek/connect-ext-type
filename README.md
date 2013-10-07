## Install

    npm install connect-ext-type

## Example usage

    var express = require('express')
      , ext_type = require('connect-ext-type')
      , app = express();

    app.use(ext_type({ '.txt': 'text/plain', '.json': 'application/json' }));

    app.get('/foo', function(req, res, next) {
      res.format({
        text: function() { res.end('Plain text response'); },
        html: function() { res.json({ json: 'response' }); }
      });
    });


Then, requesting "/foo.txt" would return "Plain text response",
and requesting "/foo.json" would return "{ json: 'response' }".


## License

MIT
