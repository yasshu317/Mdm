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
//= require bootstrap-datepicker
//= require_tree .

$(document).on('ready page:load',function(){
    $('[data-behaviour~=datepicker]').datepicker();
});
$(document).on('ready page:load',function(){
    $("#send_to_one").hide();
    $("input:radio[name='profile[set_password]']").change(function(){
        if(this.value == '1' && this.checked){
            $("#send_to_one").show();
        }else{
            $("#send_to_one").hide();
        }
    });
});
$(document).on('ready page:load',function(){
    $("#send_to_one").hide();
    $("input:radio[name='profile[set_password]']").change(function(){
        if(this.value == '0' && this.checked){
            $("#send_to_one").hide();
        }else{
            $("#send_to_one").show();
        }
    });
});

function popup(value1) {
    $.ajax({
        type: "POST",
        url: 'dashboard/pushnotify',
        data: {
            value: value1
        }
    });
    return false;
};
$(document).on('ready page:load',function(){
    $("#expandAll").click(function(){
        $(".panel-heading").removeClass("collapsed");
        $(".panel-heading").addClass("expand");
        $(".panel-primary").find(".panel-collapse").addClass("collapse in").removeClass("collapse");
        $(".panel-group").css("overflow","hidden");
    });

    $("#collapseAll").click(function(){
        $(".panel-heading").addClass("collapsed");
        $(".panel-heading").removeClass("expand");
        $(".panel-primary").find(".panel-collapse").removeClass("collapse in").addClass("collapse");
        $(".panel-group").css("overflow","hidden");
    });
    //	$('.panel-heading').addClass('collapsed');
    $(".panel-heading").click(function(){
        $(this).addClass('expand');
        /*
         if($('.panel-heading').hasClass('collapsed')){
         $('.panel-heading').addClass('expand');
         } else {
         $('.panel-heading').addClass('expand');
         }
         */
    });
});