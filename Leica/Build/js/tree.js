﻿var bc_Nodes; //節點id
var before; //節點id

$(function () {
    $('.ann_header')
        .hover(function () {
            cursorChange(this);
        })
        .click(function () {
            foldToggle(this);
        });
    //.trigger('click');

    $('.ann_sub_header')
        .hover(function () {
            cursorChange(this);
        })
        .click(function () {
            foldToggle(this);
        })
        .trigger('click');  // 預設是折疊起來

});

// 打開or摺疊選單
function foldToggle(element) {
    $(element).next('ul').slideToggle();
}

// 讓游標移到標題上時，圖案會變成手指
function cursorChange(element, cursorType) {
    $(element).css('cursor', 'pointer');
}
