// Fix for the following bugs
// - https://github.com/twbs/bootstrap/issues/10044
// - https://github.com/twbs/bootstrap/issues/5566
// - https://github.com/twbs/bootstrap/pull/7692
// - https://github.com/twbs/bootstrap/issues/8423
// - https://github.com/twbs/bootstrap/issues/7318
// - https://github.com/twbs/bootstrap/issues/8423
console.log("Loaded!");
if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {

    document._oldGetElementById = document.getElementById;
    document.getElementById = function(id) {

        if(id === undefined || id === null || id === '') {

            return undefined;

        }

        return document._oldGetElementById(id);
    };

}