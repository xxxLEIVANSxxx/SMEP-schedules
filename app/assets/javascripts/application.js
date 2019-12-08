// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery_ujs
//= require jquery.mask
//= require materialize
//= require materialize-form
//= require activestorage
//= require turbolinks
//= require calendar
//= require sync
//= require_tree .

$(document).ready(function() {
    M.AutoInit();
    $('#user_cpf').mask('999.999.999-99');
    $('#hour_date').mask('99-99-9999');
    $('#hour_time').mask('99');
    $('#hour_cost').mask('999');

    //fixBugsDeviseMaterialize();    
});

// TO DO
// function fixBugsDeviseMaterialize() {
//     let div = $('.field_with_errors').parent();
//     let elements = [];
//     let i = 0;
//     $('.field_with_errors').each(function() {
//         elements[i] = $(this).html();
//         i++;
//     });
//     div.find('div').remove();
//     i=0;
//     $('.input-field').each(function() {
//         if(i < elements.length) {
//             let html = $(this).html().split("</i>");
//             html[0] += "</i>";
//             $(this).html(html[0] + elements[i] + elements[i+1] + html[1]);
//         }
//         i += 2;
//     });
//     $('.character-counter').remove();
// }