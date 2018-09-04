module.exports = {

    tap: async function (accessibilityId) {
        console.debug("tapping: '" + accessibilityId + "'.");
        let el = app.elementByAccessibilityId(accessibilityId)
        await el.click();
    }

};