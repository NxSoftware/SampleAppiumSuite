module.exports = {

    enterText: async function (accessibilityId, text) {
        console.debug("enterText: '" + text + "' in '" + accessibilityId + "'.");
        let el = app.elementByAccessibilityId(accessibilityId)
        await el.click();
        await el.sendKeys(text);
    },

    clearText: async function (accessibilityId) {
        await app.elementByAccessibilityId(accessibilityId).clear();
    }

};