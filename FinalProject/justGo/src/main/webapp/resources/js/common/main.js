/* 환율 jQuery 효과 */
$(document).ready(function () {
    var $countNum = $('.count-num'),
        countTo = $countNum.attr('data-count');

    $({ countNum: $countNum.text() }).animate({
        countNum: countTo
    },
    {
        duration: 1000,
        easing: 'linear',
        step: function () {
            $countNum.text(Math.floor(this.countNum));
        },
        complete: function () {
            // $countNum.text(this.countNum);
            $countNum.text(this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));  // 콤마
        }
    });
});