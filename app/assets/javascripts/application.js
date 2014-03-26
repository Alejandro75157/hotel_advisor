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

jQuery(function ($) {
    var stars = $(".star");
    var bindRaty = function (el) {
        var score = star.data("score");
        star.raty({
            readOnly: true,
            path: '/assets',
            score: score
        });
    };
    $.each(stars, function (index, el) {
        bindRaty($(el));
    });
    bindRaty($("#user_rate"));
});
