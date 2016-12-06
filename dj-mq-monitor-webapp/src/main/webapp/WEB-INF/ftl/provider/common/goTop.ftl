<a class="goTop" href="javascript:void(0);">回顶部</a>
<@holder>
<script type="text/javascript">
    //回到顶部
    (function() {
        var timer = null;
        $(window).scroll(function() {
            window.clearTimeout(timer);
            if (navigator.userAgent.indexOf("MSIE") > 0) {
                if ($(document).scrollTop() > $(window).height()) {
                    $('.goTop').hide();
                    function goTopSet() {
                        var top = $(window).height() + $(document).scrollTop() - 120;
                        $('.goTop').css({top: top + 'px'}).fadeIn('fast');
                    };

                    timer = setTimeout(goTopSet, 200);
                } else {
                    $('.goTop').hide();
                }
            } else {
                if ($(document).scrollTop() > $(window).height()) {
                    $('.goTop').css({'bottom':'50px','visibility':'visible','position':'fixed'}).fadeIn("slow");
                } else {
                    $('.goTop').fadeOut("slow");
                }
            }
        });
        $('.goTop').click(function() {
            if (navigator.userAgent.indexOf("Safari") > 0) {
                $('body').animate({scrollTop:0}, 'slow')
            } else {
                $('html').animate({scrollTop:0}, 'slow')
            }
        })
    })();
</script>
</@holder>