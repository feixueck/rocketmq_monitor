<#include 'emotion.ftl' />
<div class="dj-ads" data-ids="1006"></div>
<div class="comment">
    <div style="text-align: center; padding-bottom:20px; display: none;" id="show_feed_loading">
        <img src="<@url>/up/new-v2011/i/feed_loader.gif</@url>"/>
    </div>
</div>
<div style="text-align: center; padding-bottom:20px; display: none;" id="showmore_feed_loading">
    <img src="<@url>/up/new-v2011/i/feed_loader.gif</@url>"/>
</div>
<div class="feedMore" style="display:none"><a href="###">查看更多</a></div>
<@holder>
<script type="text/javascript">
    function load_feed(feed_url) {
        $('#show_feed_loading').show();
        $('.comment').load(feed_url, null, function() {
            $('.comment').append('<div style="text-align: center; padding-bottom:20px; display: none;" id="show_feed_loading"><img src="<@url>/up/new-v2011/i/feed_loader.gif</@url>"/></div>');
        });
    }
    function check_feed() {
        var first_feed =  $('.comment > ul >li:first');
        if(first_feed.length == 1) {
            var max_feed_id = first_feed.attr('maxfeedid');
            $.get('/feed/check', {feedId:max_feed_id,filter:filter}, function(r) {
                if ($.trim(r) == '1:用户未登录') {
                    window.location.href = 'http://${configs['domains.www']}/home';
                    return false;
                } else if ($.trim(r) != '') {
                    var obj = $('.comment > ul li').not('.topad').first();
                    var topad = obj.prevAll().length;
                    obj.before(r);
                    obj.prev().hide().fadeIn('slow');
                    first_feed.attr('maxfeedid', $('.comment > ul li:eq(' + topad + ')').attr('id').substr(3));
                }
            });
        }
    }
    load_feed('/feed/list');
    $(function(){
        var tot = 10, now = 0;
        $(window).bind('scroll.autonext',function(){
            if($(document).height() - $(document).scrollTop() < document.documentElement.clientHeight + 500){
                if(!$('#showmore_feed_loading:visible').length){
                    $('#showmore_feed_loading').show();
                    now += 1;
                    if (now <= tot) {
                        var last_feed = $('.comment > ul > li:last');
                        if (last_feed.length == 1) {
                            var min_feed_id = last_feed.attr('minfeedid');
                            $('#showmore_feed_loading').show();
                            var moreUrl = '/feed/more';
                            if(filter == 'corpIndex'){
                                moreUrl = '/corpfeed/more';
                            }
                            $.get(moreUrl, {feedId:min_feed_id,filter:filter,page:now}, function(r) {
                                if ($.trim(r) != '') {
                                    $('.comment > ul').append(r);
                                } else {
                                    $(window).unbind('scroll.autonext');
                                }
                                $('#showmore_feed_loading').hide();
                            });
                        } else {
                            $('#showmore_feed_loading').hide();
                        }
                    } else {
                        $('#showmore_feed_loading').hide();
                        $(window).unbind('scroll.autonext');
                    }
                }
            }
        })
    });
</script>
</@holder>