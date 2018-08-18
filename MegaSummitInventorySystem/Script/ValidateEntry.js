


function isDate(txtDate) {
    var currVal = txtDate;
    if (currVal == '')
        return false;

    //Declare Regex  
    var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
    var dtArray = currVal.match(rxDatePattern); // is format OK?

    if (dtArray == null)
        return false;

    //Checks for mm/dd/yyyy format.
    dtMonth = dtArray[1];
    dtDay = dtArray[3];
    dtYear = dtArray[5];

    if (dtMonth < 1 || dtMonth > 12)
        return false;
    else if (dtDay < 1 || dtDay > 31)
        return false;
    else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
        return false;
    else if (dtMonth == 2) {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay > 29 || (dtDay == 29 && !isleap))
            return false;
    }
    return true;
}

String.prototype.format = String.prototype.f = function () {
    var s = this,
        i = arguments.length;

    while (i--) {
        s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i]);
    }
    return s;
};

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    return pattern.test(emailAddress);
};


function Getgender(sex) {
    var gen = '';
    //male
    if (sex == true) {
        gen = 'male';
    }
    else {
        gen = 'female';
    }

    return gen;
}


function FormatDate(date) {

    var date = new Date(date);
    var jsonDate = (date.getMonth() + 1) + '/' + date.getDate() + '/' + date.getFullYear();
    return jsonDate;

    //var a = /^\/Date\((-?[0-9]+)\)\/$/.exec(date);
    //var dt = new Date(parseInt(a[1], 10));
    //return (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + dt.getFullYear();
}

function isDecimal(str) {
    if (isNaN(str) || str.indexOf(".") < 0) {
        return false; // alert("Invalid");
    }
    else {
        str = parseFloat(str);
        return true; //alert("Entered number is decimal")
    }
}

function CreateElipsis(msg) {
    var org = msg;
    var ret = msg;
    if (ret.length >= 30) {
        ret = ret.substring(0, 30) + "...." + "<a href=\"javascript:alert('" + org + "');\">  read more</a>";
    }

    return ret;
}

(function ($) {

    $.session = {

        _id: null,

        _cookieCache: undefined,

        _init: function () {
            if (!window.name) {
                window.name = Math.random();
            }
            this._id = window.name;

            // See if we've changed protcols

            var matches = (new RegExp(this._generatePrefix() + "=([^;]+);")).exec(document.cookie);
            if (matches && document.location.protocol !== matches[1]) {
                window.sessionStorage.clear();
                this._initCache();
                for (var key in this._cookieCache) {
                    window.sessionStorage.setItem(key, this._cookieCache[key])
                }
            }

            document.cookie = this._generatePrefix() + "=" + document.location.protocol + ';path=/';

        },

        _generatePrefix: function () {
            return '__session:' + this._id + ':';
        },

        _initCache: function () {
            var cookies = document.cookie.split(';');
            this._cookieCache = {};
            for (var i in cookies) {
                var kv = cookies[i].split('=');
                if ((new RegExp(this._generatePrefix() + '.+')).test(kv[0]) && kv[1]) {
                    this._cookieCache[kv[0].split(':', 3)[2]] = kv[1];
                }
            }
        },

        _setFallback: function (key, value) {
            document.cookie = this._generatePrefix() + key + "=" + value + ";path=/";
        },

        _getFallback: function (key) {
            if (!this._cookieCache) {
                this._initCache();
            }
            return this._cookieCache[key];
        },

        _clearFallback: function () {
            for (var i in this._cookieCache) {
                document.cookie = this._generatePrefix() + i + '=;path=/';
            }
            this._cookieCache = undefined;
        },

        _deleteFallback: function (key) {
            document.cookie = this._generatePrefix() + key + '=' + undefined;
            delete this._cookieCache[key];
        },

        get: function (key) {
            return window.sessionStorage.getItem(key) || this._getFallback(key);
        },

        set: function (key, value) {
            window.sessionStorage.setItem(key, value);
            this._setFallback(key, value);
            return this;
        },

        'delete': function (key) {
            window.sessionStorage.removeItem(key);
            this._deleteFallback(key);
            return this;
        },

        clear: function () {
            window.sessionStorage.clear();
            this._clearFallback();
            return this;
        }

    };

    $.session._init();

})(jQuery);

