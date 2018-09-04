const wd = require('wd');
const chai = require('chai');
const chaiAsPromised = require('chai-as-promised');
const capabilities = require('./caps').capabilities;
const logging = require('./logging');

chai.use(chaiAsPromised);
chai.should();
chaiAsPromised.transferPromiseness = wd.transferPromiseness;

wd.configureHttp({
    timeout: 240000,
    retryDelay: 15000,
    retries: 5
});

function _beforeEach(done) {
    app = wd.promiseChainRemote("localhost", 4723);
    // logging.configure(app);
    app.init(capabilities).nodeify(done);
};

function _afterEach(done) {
    app.quit().nodeify(done);
};

function makeSuite(description, callback) {
    describe(description, function () {
        var app;

        this.timeout(300000);
        this.beforeEach(_beforeEach);
        callback();
        this.afterEach(_afterEach);
    });
};

exports.makeSuite = makeSuite;