function Helper()
{

    this.GetQuerystring = function ()
    {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }

}


function FormatDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}
