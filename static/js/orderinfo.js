$(function () {
    total()
    function total() {
        var sum = 0
        // 遍历操作
        $('.listyle').each(function () {
            var $jiage = $(this).find('.f2-5')
            var $shuliang = $(this).find('.f2-6')

            var price = $jiage.find('.price').attr('price')
            var num = $shuliang.find('.number').attr('number')

            sum += price * num

        })
        $('.d-2 .d2-2').html(parseInt(sum))
    }

    $('#pay').click(function () {
        console.log('支付')
        var identifier = $(this).attr('identifier')

        $.get('/pay/', {'identifier':identifier},function (response) {
            console.log(response['alipay_url'])
            window.open(response['alipay_url'], target='_self')
        })
    })
})