module.exports = {

    waitForAlert: function (title, timeout) {
        return app.waitForElementByXPath('//XCUIElementTypeAlert[@name="' + title + '"]', timeout || 10000)
    }

};