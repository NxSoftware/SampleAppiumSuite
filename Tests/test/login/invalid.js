const makeSuite = require('../../helpers/setup').makeSuite;
const actions = require('../../actions');

makeSuite('login with invalid credentials', function () {

    it('should show Access Denied prompt', async function () {
        await actions.enterText("usernameTextField", "test");
        await actions.enterText("passwordTextField", "test");
        await actions.tap('loginButton');
        await actions.waitForAlert('Access Denied', 500);
    });

});
