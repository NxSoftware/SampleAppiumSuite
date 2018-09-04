require('colors');

exports.configure = function (app) {
    // See whats going on
    app.on('status', function (info) {
      console.log(info.cyan);
    });
    app.on('command', function (meth, path, data) {
      console.log(' > ' + meth.yellow, path, data || '');
    });
  };