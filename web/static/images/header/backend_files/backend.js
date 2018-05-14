/**
 * Created by Administrator on 2017/12/4.
 */
$(document).ready(function () {
    $(".nav_list_div").toggle(function () {
        $(this).addClass("acitv_2");
        $(this).next(".nav_list_div_a").show();
    }, function () {
        $(this).next(".nav_list_div_a").hide();
        $(this).removeClass("acitv_2");
    })
    $(".nav_list_div").hover(function () {
        $(this).addClass("acitv_2");
    }, function () {
        $(this).removeClass("acitv_2");
    })
    $(".nav_list_div_a ul li").click(function () {
        $(this).addClass("acitv_2").siblings().removeClass("acitv_2");
    })
    $(".nav_list_div_a ul li").hover(function () {
        $(this).addClass("acitv_2");
    }, function () {
        $(this).removeClass("acitv_2");
    })


    $(".userslideDown").hover(function () {
        $(".userslideDown a").addClass("tri");
        $(".slidedownBox").addClass("show");
    }, function () {
        $(".userslideDown a").removeClass("tri");
        $(".slidedownBox").removeClass("show");
    })

    $(".ctab-Main-title ul li").click(function () {
        $(this).addClass("cur").siblings().removeClass("cur");
    })

    })