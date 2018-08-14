(function ($) {

    $.frontend = {
        init: function () {
            $this = $.frontend;

            $this.resize();
            $this.initDpicker();

            var toolbar_button = $('#toolbar a');

            toolbar_button.click(function (event) {
                if ($(this).hasClass('disabled')) event.preventDefault();
            });

            ///* TAB NAVIGATION  */
            //$('.tabs > li > a').live('click', function (event) {
            //    event.preventDefault();

            //    //find actived navigation and remove 'active' css
            //    var actived_nav = $('.tabs > li.active');
            //    var parent_nav = $(this).parents('li');

            //    actived_nav.removeClass('active');
            //    parent_nav.addClass('active');

            //    var type = ($('.tabs li.active').hasClass('view')) ? 'view' : 'form';

            //    $this.loadData($this.getObject(type));

            //    /* TOOLBAR SETTINGS */
            //    var active_tab_class = $(this).attr('class');

            //    if (typeof (active_tab_class) === 'undefined') {
            //        toolbar_button.addClass('disabled');
            //    }
            //    else {
            //        var toolbar_states = active_tab_class.split('-');
            //        toolbar_button.addClass('disabled');
            //        for (var i = 0; i < toolbar_states.length; i++) {
            //            $('#toolbar button.' + toolbar_states[i]).removeClass('disabled');
            //        }
            //    }
            //});

            ///* SUBTAB NAVIGATION  */
            //$('.subtabs > li > a').live('click', function (event) {
            //    event.preventDefault();

            //    //find actived navigation and remove 'active' css
            //    var actived_nav = $('.subtabs > li.active');
            //    var parent_nav = $(this).parents('li');

            //    actived_nav.removeClass('active');
            //    parent_nav.addClass('active');

            //    var type = ($('.subtabs li.active').hasClass('view')) ? 'view' : 'form';

            //    $this.loadData($this.getObject(type, 'subtab'), '', 'subtab-content-holder');
            //});

            ///* SUBTAB WITH TEXT NAVIGATION  */
            //$('.subtabs.withtext > li').live('click', function (event) {
            //    event.preventDefault();

            //    //find actived navigation and remove 'active' css
            //    var actived_nav = $('.subtabs.withtext li.active');
            //    actived_nav.removeClass('active');
            //    $(this).addClass('active');

            //    var type = ($('.subtabs.withtext li.active').hasClass('view')) ? 'view' : 'form';

            //    $this.loadData($this.getObject(type, 'subtab'), '', 'subtab-content-holder');
            //});

            ///* SUBTAB WITH TEXT NAVIGATION  */
            //$('.subtabs-extra > li').live('click', function (event) {
            //    event.preventDefault();

            //    //find actived navigation and remove 'active' css
            //    var actived_nav = $('.subtabs-extra li.active');
            //    actived_nav.removeClass('active');
            //    $(this).addClass('active');

            //    var type = ($('.subtabs-extra li.active').hasClass('view')) ? 'view' : 'form';

            //    $this.loadData($this.getObject(type, 'subtab-extra'), '', 'subtab-extra-content-holder');
            //});

            ///* PAYMENT OPTION TAB NAVIGATION  */
            //$('.potabs > li > a').live('click', function (event) {
            //    event.preventDefault();

            //    //find actived navigation and remove 'active' css
            //    var actived_nav = $('.potabs > li.active');
            //    var parent_nav = $(this).parents('li');

            //    actived_nav.removeClass('active');
            //    parent_nav.addClass('active');

            //    var type = ($('.potabs li.active').hasClass('view')) ? 'view' : 'form';

            //    $this.loadData($this.getObject(type, 'potab'), '', 'potab-content-holder');
            //});




            //// Sidebar User
            //$('a[id^=user]').live('click', function (event) {
            //    event.preventDefault();

            //    var data = $(this).attr('id').split('-');
            //    var id = data[1];
            //    var dataparams = "id=" + id;

            //    $this.loadData($this.getObject('form', 'sidebar'), '', 'content-holder');
            //    $this.disableAllButtons();
            //    $this.enableButton('save');
            //    $this.enableButton('new');
            //    $this.enableButton('delete');
            //});
            

            //// Company Users Form
            //$('#company_company_users_form').live('submit', function (event) {
            //    event.preventDefault();

            //    $this.loadData($this.getObject('view', 'submit'), '', 'content-holder');
            //    $this.disableAllButtons();
            //    $this.enableButton('save');
            //    $this.resetForm();
            //});

            //// Links
            //$('.link a').live('click', function (event) {
            //    event.preventDefault();
            //    var target = $(this).attr('href');

            //    if ($(this).hasClass('right')) {
            //        $(this).removeClass('right').addClass('left');
            //        $(this).attr('href', '#form1');
            //    }
            //    else {
            //        $(this).removeClass('left').addClass('right');
            //        $(this).attr('href', '#form2');
            //    }

            //    $('.form-content').removeClass('active');
            //    $(target).addClass('active');

            //});

            //// Slide Button
            //$('#slidebtn').live('click', function (event) {
            //    event.preventDefault();
            //    var target = $(this).attr('href');

            //    if ($(this).hasClass('down')) {
            //        $(this).removeClass('down').addClass('up');
            //        $(this).attr('href', '#pane1');
            //    }
            //    else {
            //        $(this).removeClass('up').addClass('down');
            //        $(this).attr('href', '#pane2');
            //    }

            //    $('.pane-content').removeClass('active');
            //    $(target).addClass('active');

            //});

            //// Button Link
            //$('.btnlink').live('click', function (event) {
            //    event.preventDefault();

            //    var type = ($(this).hasClass('view')) ? 'view' : 'form';
            //    var main_class = $('#main').attr('class');
            //    var target = $(this).attr('href');

            //    var object_name = main_class + '-' + target + '-' + type;

            //    $this.loadData(object_name, '', 'content-holder');

            //    $('#main').find('.subtabs .active').removeClass('active');
            //});

            //// Customers Form
            //$('#customer_customers_form').live('submit', function (event) {
            //    event.preventDefault();

            //    $this.loadData($this.getObject('form', 'submit'), '', 'main');
            //    $this.disableAllButtons();
            //    $this.enableButton('new');
            //    $this.enableButton('find');
            //    $this.enableButton('delete');
            //    $this.resetForm();
            //});

            //// Products Form
            //$('#products_product_form').live('submit', function (event) {
            //    event.preventDefault();

            //    $this.loadData($this.getObject('form', 'submit'), '', 'main');
            //    $this.disableAllButtons();
            //    $this.enableButton('save');
            //    $this.enableButton('new');
            //    $this.enableButton('delete');
            //    $this.resetForm();
            //});

            // Suppliers Form
            //$('#suppliers_suppliers_form').live('submit', function (event) {
            //    event.preventDefault();

            //    $this.loadData($this.getObject('form', 'submit'), '', 'main');
            //    $this.disableAllButtons();
            //    $this.enableButton('save');
            //    $this.enableButton('new');
            //    $this.enableButton('delete');
            //    $this.resetForm();
            //});

            //$('#commission_type').live('change', function (event) {
            //    var selected = $(this).val();

            //    if (selected == 'fixed') {
            //        $('.tabular-data').fadeOut();
            //    }
            //    else {
            //        $('.tabular-data').fadeIn();
            //    }
            //});

            // AJAX SUBMENU
            //$('.submenu.ajax li a').live('click', function (event) {
            //    event.preventDefault();

            //    var actived_submenu = $('.submenu.ajax li.active');
            //    var submenu_nav = $('.submenu.ajax li.active');

            //    submenu_nav.removeClass('active');
            //    $(this).parents('li').addClass('active');
            //    var type = ($('.submenu.ajax li.active').hasClass('view')) ? 'view' : 'form';

            //    $this.loadData($this.getObject(type, 'submenu'), '', 'main');

            //    var active_submenu_class = $(this).attr('class');

            //    if (typeof (active_submenu_class) === 'undefined') {
            //        toolbar_button.addClass('disabled');
            //    }
            //    else {
            //        var toolbar_states = active_submenu_class.split('-');
            //        toolbar_button.addClass('disabled');
            //        for (var i = 0; i < toolbar_states.length; i++) {
            //            $('#toolbar a.' + toolbar_states[i]).removeClass('disabled');
            //        }
            //    }
            //});

            // SUBOPTIONS
            //$('.suboptions li a').live('click', function (event) {
            //    event.preventDefault();

            //    var suboption_nav = $('.suboptions li.active');

            //    suboption_nav.removeClass('active');
            //    $(this).parents('li').addClass('active');

            //    var type = ($('.suboptions li.active').hasClass('form')) ? 'form' : 'view';

            //    $this.loadData($this.getObject(type, 'suboption'), '', 'content-holder');
            //});

            //// SUBLISTS
            //$('.sublists li a').live('click', function (event) {
            //    event.preventDefault();

            //    var sublist_nav = $('.sublists li.active');

            //    sublist_nav.removeClass('active');
            //    $(this).parents('li').addClass('active');

            //    var type = ($('.sublists li.active').hasClass('form')) ? 'form' : 'view';

            //    $this.loadData($this.getObject(type, 'sublist'), '', 'sublist-content-holder');
            //})

            //// SIDE PANE
            //$('.subsublists li a').live('click', function (event) {
            //    event.preventDefault();

            //    var subsublist_nav = $('.subsublists li.active');

            //    subsublist_nav.removeClass('active');
            //    $(this).parents('li').addClass('active');

            //    var type = ($('.subsublists li.active').hasClass('form')) ? 'form' : 'view';

            //    $this.loadData($this.getObject(type, 'subsublist'), '', 'subsublist-content-holder');
            //});

            //// TABULAR DATA
            //$('.tblholder tr[id^=rec]').live('click', function (event) {
            //    event.preventDefault();

            //    var data = $(this).attr('id').split('-');
            //    var id = data[1];
            //    var dataparams = "id=" + id;
            //    var container = $('.tblholder').hasClass('main') ? 'main' : 'tab-content-holder';

            //    $this.loadData($this.getObject('form', 'table'), dataparams, container);
            //    $this.disableAllButtons();
            //    $this.enableButton('save');
            //    $this.enableButton('new');
            //    $this.enableButton('delete');
            //});

            //var check;

            //$('input[type="radio"]').live('hover', function () {
            //    check = $(this).is(':checked');
            //});

            //$('input[type="radio"]').live('click', function () {
            //    check = !check;
            //    $(this).attr("checked", check);
            //});

            /* TIME TABLE STATE */
            $('.timetable a').live('click', function (event) {
                event.preventDefault();
                $(this).toggleClass("on");
            });
        },

        /*----------------------------------------------------------------*/
        // MISC
        /*----------------------------------------------------------------*/

        loadData: function (object_name, dataparams, container) {
            var base_url = $this.getBaseURL();

            var holder = (typeof (container) === 'undefined') ? 'tab-content-holder' : container;
            var data = (typeof (dataparams) === 'undefined') ? '' : dataparams;

            $.ajax({
                type: 'POST',
                url: base_url + 'ajax/' + object_name + '.php',
                dataparams: data,
                success: function (content) {
                    $('#' + holder).empty().html(content);
                    $this.resize();
                    $this.initDpicker();
                }
            });
        },

        getObject: function (type, trigger) {
            var action = (typeof (trigger) === 'undefined') ? 'tab' : trigger;
            var main_class = $('#main').attr('class');
            var object_name = main_class + '-' + type;

            switch (action) {
                case 'tab':
                    if ($('.tabs').length > 0) {
                        var active_tab_name = $('.tabs li.active a').attr('href').split('#tab-');
                        var tab_name = active_tab_name[1];
                        object_name = main_class + '-' + tab_name + '-' + type;
                    }
                    break;

                case 'subtab':
                    if ($('.subtabs').length > 0) {
                        var active_subtab_name = $('.subtabs li.active a').attr('href').split('#subtab-');
                        var subtab_name = active_subtab_name[1];
                        var object_name = main_class + '-' + subtab_name + '-' + type;
                    }
                    break;

                case 'subtab-extra':
                    if ($('.subtabs').length > 0) {
                        var active_subtab_name = $('.subtabs-extra li.active a').attr('href').split('#subtab-');
                        var subtab_name = active_subtab_name[1];
                        var object_name = main_class + '-' + subtab_name + '-' + type;
                    }
                    break;

                case 'potab':
                    if ($('.potabs').length > 0) {
                        var active_potab_name = $('.potabs li.active a').attr('href').split('#potab-');
                        var potab_name = active_potab_name[1];
                        var object_name = main_class + '-' + potab_name + '-' + type;
                    }
                    break;

                case 'submenu':
                    if ($('.submenu.ajax').length > 0) {
                        var active_submenu_name = $('.submenu.ajax li.active a').attr('href').split('#submenu-');
                        var main_class = active_submenu_name[1];
                        $('#main').removeClass().addClass(main_class);
                        var object_name = main_class + '-' + type;
                    }
                    break;

                case 'suboption':
                    if ($('.suboptions').length > 0) {
                        var active_suboption_name = $('.suboptions li.active a').attr('href').split('#suboption-');
                        var suboption_name = active_suboption_name[1];
                        var object_name = main_class + '-' + suboption_name + '-' + type;
                    }
                    break;

                case 'sublist':
                    if ($('.sublists').length > 0) {
                        var active_sublist_name = $('.sublists li.active a').attr('href').split('#sublist-');
                        var sublist_name = active_sublist_name[1];
                        var object_name = main_class + '-' + sublist_name + '-' + type;
                    }
                    break;

                case 'subsublist':
                    if ($('.subsublists').length > 0) {
                        var active_subsublist_name = $('.subsublists li.active a').attr('href').split('#subsublist-');
                        var subsublist_name = active_subsublist_name[1];
                        var object_name = main_class + '-' + subsublist_name + '-' + type;
                    }
                    break;

                case 'table':
                    var table = $('.tblholder');
                    var table_id = $('.tblholder').attr('id');

                    if (table.hasClass('main')) {
                        var object_name = (typeof (table_id) === 'undefined') ? main_class + '-' + type : main_class + '-' + table_id + '-' + type;
                    }
                    else {
                        if ($('.tabs').length > 0) {
                            var active_tab_name = $('.tabs li.active a').attr('href').split('#tab-');
                            var tab_name = active_tab_name[1];
                            var object_name = main_class + '-' + tab_name + '-' + type;
                        }
                    }
                    break;

                case 'btnlink':
                    if ($('.sidetabs').length > 0) {
                        var active_sidetab_name = $('.sidetabs li.active a').attr('href').split('#sidetab-');
                        var sidetab_name = active_sidetab_name[1];
                        var object_name = main_class + '-' + sidetab_name + '-' + type;
                    }
                    break;

                case 'submit':
                    var btn_id = $('.submit').attr('id').split('btn-');
                    var btn_name = btn_id[1];
                    var object_name = main_class + '-' + btn_name + '-' + type;
                    break;
            }

            return object_name;
        },

        enableButton: function (state) {
            $("#btn-" + state).removeClass('disabled');
        },

        disableButton: function (state) {
            $("#btn-" + state).addClass('disabled');
        },

        enableAllButtons: function () {
            $('#toolbar a').removeClass('disabled');
        },

        disableAllButtons: function () {
            $('#toolbar a').addClass('disabled');
        },

        resetForm: function () {
            setTimeout(function () {
                $('form').find(':input').each(function () {
                    switch (this.type) {
                        case 'password':
                        case 'select-multiple':
                        case 'select-one':
                        case 'text':
                        case 'textarea':
                            $(this).val('');
                            break;
                        case 'checkbox':
                        case 'radio':
                            this.checked = false;
                            break;
                    }
                });
            }, 1000);
        },

        initDpicker: function () {
            $('.date').each(function () {
                $(this).datepicker({
                    dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                });
            });

            $('.birthdate').datepicker({
                dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
            });
        },

        resize: function () {
            $(window).resize(function () {
                /* Equalize Boxes */
                var width = $(window).width();
                $('.equalize').css('height', 'auto');

                var maxHeight = 0;
                $('.equalize').each(function () {
                    maxHeight = $(this).height() > maxHeight ? $(this).height() : maxHeight;
                }).css('height', maxHeight + 'px');

                /* EQUAL TAB WIDTH */
                var maxWidth = 0;
                $('.tabs li, .subtabs li, .subtabs-extra li').css('width', '127px');
                $('.subtabs.withtext li').css('width', '195px');
                $('.style2 .subtabs.withtext li').css('width', '127px');
                $('.company-company-company .tabs li').css('width', '90px');
                $('.company-company-users .tabs li').css('width', '75px');
                $('.employees-employee .tabs li').css('width', '78px');


                /* TOTAL TAB WIDTH */
                var tab_width = 0;
                $(".tabs li").each(function () {
                    var current_tab_width = $(this).outerWidth();
                    tab_width = tab_width + current_tab_width;
                });
                $('.tabs').css('width', tab_width + 'px');

                /* TOTAL SUBTAB WIDTH */
                var subtab_width = 0;
                $(".subtabs li").each(function () {
                    var current_subtab_width = $(this).outerWidth();
                    subtab_width = subtab_width + current_subtab_width;
                });
                $('.subtabs').css('width', subtab_width + 'px');

                var subtab_width = 0;
                $(".subtabs-extra li").each(function () {
                    var current_subtab_width = $(this).outerWidth();
                    subtab_width = subtab_width + current_subtab_width;
                });
                $('.subtabs-extra').css('width', subtab_width + 'px');

                /* SCROLLBAR */
                $('.scroll').slimscroll({
                    size: '8px',
                    wheelStep: 5
                });

                /* GENERAL INIT */
                var win = $(window);
                var header = $('#header');
                var subheader = $('#subheader');
                var submenu = $('.submenu');
                var suboptions = $('.suboptions');
                var main_pad = $('#main .ym-wbox');
                var container = $('#main .container');
                var subcontainer = $('#main .subcontainer');
                var footer = $('#footer');


                var sidebar = $('.ym-col3 .sidebar');
                var sidebar_scroll_div = $('.ym-col3 .slimScrollDiv');
                var sidebar_scroll = $('.ym-col3 .scroll');

                /* CONTENT */
                var box_holder = $('.box-holder');

                var subtab_container = $('#main .subtab-container');
                var subtab_box_holder = $('#main .subtab-container .box-holder');
                var subtab_box_holder_half = $('#main .subtab-container.half .box-holder');

                var content = $('.content');
                var content_vmiddle = $('.content.vmiddle');
                var content_tabular = $('.content.tabular');
                var cleft = $('.cleft');

                var subtabcontent_vmiddle = $('.subtab-container .content.vmiddle');
                var subtabcontent_tabular = $('.subtab-container .content.tabular');

                var subcontainer = $('.subcontainer');
                var subcontainer_pads = $('.subcontainer .pads');
                var subcontainer_pane_holder = $('.subcontainer .pane-holder');
                var subcontainer_sidebar = $('.subcontainer .ym-col3 .sidebar');
                var subcontainer_sidebar_scroll_div = $('.subcontainer .ym-col3 .slimScrollDiv');
                var subcontainer_sidebar_scroll = $('.subcontainer .ym-col3 .scroll');

                var pay_option = $('.payment-options');
                var pay_option_tab = $('.potabs');
                var pay_option_holder = $('.payment-options .holder');
                var pay_option_subholder = $('.payment-options .subholder');
                var pay_option_content_vmiddle = $('.payment-options .subholder .content.vmiddle');
                var pay_option_tabular = $('.payment-options .subholder .content.tabular');

                var sc_pay_option = $('.subcontainer .payment-options');
                var sc_pay_option_tab = $('.subcontainer .potabs');
                var sc_pay_option_holder = $('.subcontainer .payment-options .holder');
                var sc_pay_option_subholder = $('.subcontainer .payment-options .subholder');
                var sc_pay_option_content_vmiddle = $('.subcontainer .payment-options .subholder .content.vmiddle');
                var sc_pay_option_tabular = $('.subcontainer .payment-options .subholder .content.tabular');

                var return_pane_holder = $('.return .pane-holder .slimScrollDiv');
                var return_tbl_scroll_half_div = $('.return .scroll-half .tblholder .slimScrollDiv');
                var return_tbl_scroll_half = $('.return .scroll-half .scroll');

                var popupcontent_vmiddle = $('.popup .content.vmiddle');

                /* TABLE */
                var tbl_scroll_div = $('.tblholder .slimScrollDiv');
                var tbl_scroll = $('.tblholder .scroll');

                var cust_tbl_holder = $('.tblholder.custom');
                var cust_tbl_scroll_div = $('.tblholder.custom .slimScrollDiv');
                var cust_tbl_scroll = $('.tblholder.custom .scroll');

                var list_scroll_div = $('.listitem .slimScrollDiv');
                var list_scroll = $('.listitem .scroll');

                var subtab_tbl_scroll_div = $('.subtab-container .tblholder .slimScrollDiv');
                var subtab_tbl_scroll = $('.subtab-container .scroll');

                var subtab_tbl_scroll_half_div = $('.subtab-container.half .tblholder .slimScrollDiv');
                var subtab_tbl_scroll_half = $('.subtab-container.half .scroll');

                var tbl_scroll_half_div = $('.scroll-half .tblholder .slimScrollDiv');
                var tbl_scroll_half = $('.scroll-half .tblholder .scroll');

                var sc_tbl_scroll_div = $('.subcontainer .tblholder .slimScrollDiv');
                var sc_tbl_scroll = $('.subcontainer .scroll');

                var po_tbl_scroll_div = $('.payment-options .subholder .tblholder .slimScrollDiv');
                var po_tbl_scroll = $('.payment-options .subholder .scroll');

                var sc_po_tbl_scroll_div = $('.subcontainer .payment-options .subholder .tblholder .slimScrollDiv');
                var sc_po_tbl_scroll = $('.subcontainer .payment-options .subholder .scroll');

                /* COLUMN PAD  */
                var one_col_pad = $('.one-column .inner');
                var two_col1_pad = $('.two-column-sidebar .ym-col1 .ym-cbox');

                var addup = $('.addup');
                var addup_total = 0;

                $('.addup').each(function () { addup_total += $(this).innerHeight(); });

                var container_height = win.height() - (header.height() + subheader.height() + submenu.outerHeight(true) + parseInt(main_pad.css('padding-top')) + parseInt(main_pad.css('padding-bottom')) + suboptions.outerHeight(true) + footer.innerHeight());
                var cheight = (container_height <= 480) ? container_height : 480;
                var col_pad = (container.hasClass('two-column-sidebar')) ? two_col1_pad : one_col_pad;
                var box_holder_height = cheight - (parseInt(col_pad.css('padding-top')) + parseInt(col_pad.css('padding-bottom'))) - (parseInt(box_holder.css('padding-top')) + parseInt(box_holder.css('padding-bottom')));
                var tbl_height = box_holder_height - parseInt(box_holder.css('padding-top')) - addup_total;

                var subtab_box_holder_height = cheight - (parseInt(col_pad.css('padding-top')) + parseInt(col_pad.css('padding-bottom'))) - (parseInt(subtab_box_holder.css('padding-top')) + parseInt(subtab_box_holder.css('padding-bottom'))) - addup_total;
                var subtab_tbl_height = (subtab_container.hasClass('half')) ? subtab_box_holder_height - parseInt(subtab_box_holder.css('padding-top')) - 30 : subtab_box_holder_height - parseInt(subtab_box_holder.css('padding-top')) - 5;

                var subcontainer_height = subtab_container.height() - (parseInt(subtab_box_holder.css('padding-top')) + parseInt(subtab_box_holder.css('padding-bottom')));
                var subcontainer_pane_holder_height = subcontainer_height - 3;
                var sc_tbl_height = subcontainer_height - (parseInt(subcontainer_pads.css('padding-top')) + parseInt(subcontainer_pads.css('padding-bottom'))) - 22;
                var sc_sidebar_height = subtab_container.height() - 30;

                var pay_option_subholder_height = pay_option.height() - (parseInt(pay_option_holder.css('padding-top')) + parseInt(pay_option_holder.css('padding-bottom'))) - (parseInt(pay_option_subholder.css('padding-top')) + parseInt(pay_option_subholder.css('padding-bottom'))) - pay_option_tab.height() - 25;
                var sc_pay_option_subholder_height = subcontainer_pane_holder_height - (parseInt(sc_pay_option_holder.css('padding-top')) + parseInt(sc_pay_option_holder.css('padding-bottom'))) - (parseInt(sc_pay_option_subholder.css('padding-top')) + parseInt(sc_pay_option_subholder.css('padding-bottom'))) - sc_pay_option_tab.height();

                var po_tbl_height = pay_option_subholder_height - (parseInt(pay_option_subholder.css('padding-top')) + parseInt(pay_option_subholder.css('padding-bottom'))) - 8;
                var sc_po_tbl_height = sc_pay_option_subholder_height - (parseInt(sc_pay_option_subholder.css('padding-top')) + parseInt(sc_pay_option_subholder.css('padding-bottom'))) - 8;

                var return_pane_holder_height = box_holder_height - 245;
                var cleft_height = cheight;

                /* CONTAINER HEIGHT */
                container.height(cheight);
                subcontainer.height(subcontainer_height);
                subcontainer_pane_holder.height(subcontainer_pane_holder_height);

                /* SIDEBAR HEIGHT */
                sidebar_scroll_div.height(cheight);
                sidebar_scroll.height(cheight);

                subcontainer_sidebar.height(sc_sidebar_height);
                subcontainer_sidebar_scroll_div.height(sc_sidebar_height);
                subcontainer_sidebar_scroll.height(sc_sidebar_height);

                /* CONTENT HEIGHT */
                box_holder.height(box_holder_height);
                cleft.height(cleft_height);

                list_scroll_div.height(box_holder_height);
                list_scroll.height(box_holder_height);

                subtab_box_holder.height(subtab_box_holder_height);
                subtab_box_holder_half.height(subtab_box_holder_height / 2);

                content_vmiddle.width(box_holder.width()).height(box_holder.height());
                subtabcontent_vmiddle.width(subtab_box_holder.width()).height(subtab_box_holder.height());

                pay_option_subholder.height(pay_option_subholder_height);
                pay_option_content_vmiddle.width(pay_option_subholder.width()).height(pay_option_subholder_height);

                sc_pay_option_subholder.height(sc_pay_option_subholder_height);
                sc_pay_option_content_vmiddle.width(sc_pay_option_subholder.width()).height(sc_pay_option_subholder_height);

                popupcontent_vmiddle.width(400).height(160);

                /* TABLE HEIGHT */
                tbl_scroll_div.height(tbl_height);
                tbl_scroll.height(tbl_height);

                tbl_scroll_half_div.height(tbl_height / 2);
                tbl_scroll_half.height(tbl_height / 2);

                var scroll_object = '';
                var scroll_height = 0;

                $(cust_tbl_holder).each(function () {
                    scroll_object = $(this).attr('id').split('cheight-');
                    scroll_height = scroll_object[1];

                    cust_tbl_scroll_div.height(scroll_height);
                    cust_tbl_scroll.height(scroll_height);
                });

                subtab_tbl_scroll_div.height(subtab_tbl_height);
                subtab_tbl_scroll.height(subtab_tbl_height);

                subtab_tbl_scroll_half_div.height(subtab_tbl_height / 2);
                subtab_tbl_scroll_half.height(subtab_tbl_height / 2);

                sc_tbl_scroll_div.height(sc_tbl_height);
                sc_tbl_scroll.height(sc_tbl_height);

                po_tbl_scroll_div.height(po_tbl_height);
                po_tbl_scroll.height(po_tbl_height);

                sc_po_tbl_scroll_div.height(sc_po_tbl_height);
                sc_po_tbl_scroll.height(sc_po_tbl_height);

                return_tbl_scroll_half_div.height(return_pane_holder_height / 2);
                return_tbl_scroll_half.height(return_pane_holder_height / 2);

            });
            $(window).resize();
        },

        getBaseURL: function () {
            var defaultPorts = { "http:": 80, "https:": 443 };
            return window.location.protocol + "//" + window.location.hostname
            + (((window.location.port)
            && (window.location.port != defaultPorts[window.location.protocol]))
            ? (":" + window.location.port) : "") + "/megasummit/";
        }
    };

    $.frontend.init();
})(jQuery);