<@holder>
<script type="text/javascript">
    //

    var posOffset = 0;
    function queryGroupInfo() {
        $('#www-ajax-frame')[0].contentWindow.$.ajax({
            type:"get",
            url:"http://${configs['domains.www']}/home/exchangegroup",
            success:function(r) {
                if (r != null) {
                    $('body').append(r);
                    var removeItem = function(nowObj) {
                        var ref = nowObj.attr('ref');
                        var hasCard = parseInt($('#hasCard').val());
                        if (hasCard == 0) {
                            $('#lay-nocard .normal').attr('ref', ref);
                            $('#lay-nocard').show();
                            $lay = $('#lay-nocard'),
                                    pos = posOffset;
                            var cardWidth = $lay.outerWidth();
                            $lay.find('.pointer').css({
                                'right' : cardWidth - 40
                            });
                            $lay.css({
                                //left : pos.left - cardWidth + 105,
                                left : pos.left - 1,
                                top : pos.top - 162,
                                display: 'block'
                            });
                        }else{
                            commonAct(ref, 'redirect');
                        }
                    }
                    $.changeCard({
                        btnClass    : 'tocard',    // 弹出按钮的类名
                        nowBtnClass    : 'tocardnow', // 浮层对应的按钮的类名（由程序添加）
                        offsetLeft  : -15,          // 浮层相对于按钮的横向偏移量
                        offsetTop   : 30 ,          // 浮层相对于按钮的纵向偏移量
                        closeCallback : removeItem
                    });

                }
            }
        });
    }

    $(window).load(function(){
        queryGroupInfo();
    });

    // hook 需要根据具体情况，实现自己的方法，注意方法签名
    function spriteOnComplete(fuids) {
        if (typeof fuids != "object") {
            return;
        }
        for (index in fuids) {
            commonAct(fuids[index]);
        }
    }
    function commonAct(fuid,operation) {
        $('#rp'+fuid).fadeOut("normal",function(){
            if (operation == 'delete' || operation=="redirect") {
                // 为了解决推荐好友和可能认识的人冲突
                if ($('#rp' + fuid).is('div')) { // 推荐同学
                    var peopleSize = $("#lexon div.people");
                    if (peopleSize.length < 3) {
                        $('#www-ajax-frame')[0].contentWindow.$.get("http://${configs['domains.www']}/home/schoolmate", null, function(r) {
                            if ($.trim(r) == '') {
                                $("#lexon a.remove").click();
                            } else {
                                $("#buddy-list").empty().append(r);
                            }
                        });
                    }

                } else {  // 可能认识的人
                    $('#www-ajax-frame')[0].contentWindow.$.get("http://${configs['domains.www']}/home/maybeknows?type=1", function(r) {
                        if ($.trim(r) != '') {
                            $("#mayknowList").empty().append(r);
                        }
                        if ($("#mayknowList").children().size() <= 0) {
                            $("#maincolumn-bottomBox").remove();
                        }
                    });
                }
                $('#rp' + fuid).remove();
            } else {
                //location.href = 'http://${configs['domains.www']}/card/maybeknow';
            }
        });
    }
    $("#mayknowList .remove").live("click", function() {
        if ($("#lay-change-card").css("display") != "block") {
            var fuid = $(this).parent().attr("fuid");
            $('#www-ajax-frame')[0].contentWindow.$.get("http://${configs['domains.www']}/card/deletemayknow", {"uid":fuid}, function(r) {
                if (r == '0') {
                    commonAct(fuid, 'delete');
                }
            });
        }
    });
    $('#maincolumn-bottomBox a.green').sprite({title: '加联系人', width: 630, mask:true, mercy: false, stay: '#addme', ondisplay: function(){
        $(this).find('.titlebar h1').text($(this).find('.user').text());
    }, oncomplete: function(){
    }, onabort: function(){
        $('#step1submit, #step3submit').die("click");
        $.UI.destroy();
    }});

    layGroupOpen = function(a) {
        $('#lay-nocard').hide();
        var myInvitCnt = $('#inviteBuddyCnt').val(), //邀请
                myCnt = $('#myBuddyCnt').val(), //我的人脉
                maxCnt = $('#buddyMax').val(),
                ivCnt = $('#inviteMax').val();
        if (parseInt(myCnt) >= parseInt(maxCnt)) {
            $('#lay-overmax').show();
            var $this = $(a),
                    $lay = $('#lay-overmax'),
                    pos = $this.offset();
            var cardWidth = $lay.outerWidth();
            $lay.find('.pointer').css({
                'right' : cardWidth - 40
            });
            $lay.css({
                //left : pos.left - cardWidth + 105,
                left : pos.left - 3,
                top : pos.top - 145,
                display: 'block'
            });
            return false;
        } else if (parseInt(myInvitCnt) >= parseInt(ivCnt)) {
            $('#lay-overload').show();
            var $this = $(a),
                    $lay = $('#lay-overload'),
                    pos = $this.offset();
            var cardWidth = $lay.outerWidth();
            $lay.find('.pointer').css({
                'right' : cardWidth - 40
            });
            $lay.css({
                //left : pos.left - cardWidth + 105,
                left : pos.left - 3,
                top : pos.top - 145,
                display: 'block'
            });
            return false;
        }
    };

    layGroupAjax = function(data) {
        var ref = data[2].attr('ref');
        $('#www-ajax-frame')[0].contentWindow.$.post("http://${configs['domains.www']}/card/group/move", {buddyUids:ref, gidStr:data[0].join(',')}, function(r){});
    };

    layGroupOpenAfter = function(a) {
        var ref = $('.tocardnow').attr('ref');
        posOffset = $('.tocardnow').offset();
        $('.tocardnow:eq(0)').replaceWith('<span class="tocard-btn tocardnow">等待确认</span>');
        $('#www-ajax-frame')[0].contentWindow.$.post('http://${configs['domains.www']}/card/exchange/send', {uid:ref, gids:1}, function(r) {
            var myInviteCnt = parseInt($('#inviteBuddyCnt').val()) + 1;
            $('#inviteBuddyCnt').val(myInviteCnt);
        });
    }

    //人脉限制浮层
    $('#lay-overload .fresh').live("click", function() {
        $('#lay-overload').hide();
    });
    //无名片浮层事件
    $('#lay-nocard .normal').live("click", function() {
        $('#lay-nocard').hide();
        location.href = 'http://${configs['domains.www']}/card/maybeknow';
    });
    $('#lay-nocard .fresh').live("click", function() {
        $('#lay-nocard').hide();
        location.href = "http://${configs['domains.www']}/card/icard/create"
    });
    $('#lay-overmax .fresh').live("click", function() {
        $('#lay-overmax').hide();
        $('.tocardnow').removeClass('tocardnow');
        location.href = "http://${configs['domains.www']}/card/index"
    });
    $('#lay-overmax .normal').live("click", function() {
        $('#lay-overmax').hide();
    });

</script>
</@holder>