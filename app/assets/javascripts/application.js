// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require jquery.raty.js
//= require jquery.jcarousel.js
//= require modernizr.js

jQuery(document).on('page:change', function () {
    var $ = jQuery;
    var bindRaty = function(index, el) {
        var element = $(el);
        element.raty({
            readOnly: true,
            path: '/assets',
            score: element.data("score")
        });
    };
    $.each($(".star"),bindRaty);
    $.each($("#hotel_star"),bindRaty);

    $.each($("#star_save"), function (index, el) {
        var element = $(el);
        element.raty({
            path: '/assets',
            click: function(score, evt) {
                $(this).next().val(score);
            }
        });
    });


    (function($, Modernizr) {
        $(function() {
            $('.jcarousel').jcarousel({
                wrap: 'circular',
                transitions: Modernizr.csstransitions ? {
                    transforms:   Modernizr.csstransforms,
                    transforms3d: Modernizr.csstransforms3d,
                    easing:       'ease'
                } : false
            });

            $('.jcarousel-prev').jcarouselControl({
                target: '-=1'
            });

            $('.jcarousel-next').jcarouselControl({
                target: '+=1'
            });
        });
    })(jQuery, Modernizr);
});
