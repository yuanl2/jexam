<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>参与考试</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${request.contextPath}/css/per-center.css"/>
</head>

<body>

<div id="wrapper">
    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top navbar-bg" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${request.contextPath}">首页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li><a href="${request.contextPath}/user/stu/exercises"><i class="fa fa-plus"></i> 习题收藏</a></li>
                <li><a href="${request.contextPath}/user/stu/exams"><i class="fa fa-edit"></i> 我的考试</a></li>
                <li class="active-bg"><a href="#"><i class="fa fa-edit"></i> 参与考试</a></li>
            </ul>

            <h3 style="text-align: center;color: #ffffff;"> 参与考试</h3>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div id="page-wrapper">
        <br>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <div class="time-item">
                    <strong>倒计时：</strong>
                    <strong id="hour_show">0时</strong>
                    <strong id="minute_show">0分</strong>
                    <strong id="second_show">0秒</strong>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-lg-12">
                           <#list exercises as item>
                               <#if  item.type == "single_choose">
                     <div class="form-group">
                         <div class="panel panel-info">
                             <div class="panel-heading">
                                 <h3 class="panel-title">${item_index + 1}. ${item.title!}</h3>
                             </div>
                             <div class="panel-body">
                                 ${item.content!}
                                 <div class="form-group jexam-exercise ans-radio" data-type="${item.type}" data-id="${item.id}">
                                     <label>请选择答案(单选):</label>
                                     <#list item.chooseList!?keys as key>
                                                <div class="form-group">
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="answer" value="${key}">
                                                            ${key}: ${item.chooseList[key]}
                                                        </label>
                                                    </div>
                                                </div>
                                     </#list>
                                 </div
                             </div>
                         </div>
                     </div>

                               <#elseif item.type == "multi_choose">
                     <div class="form-group">
                         <div class="panel panel-success">
                             <div class="panel-heading">
                                 <h3 class="panel-title">${item_index + 1}. ${item.title!}</h3>
                             </div>
                             <div class="panel-body">
                                 ${item.content!}
                                 <div class="form-group jexam-exercise ans-mul" data-type="${item.type}" data-id="${item.id}">
                                     <label>请选择答案(多选):</label>
                                     <#list item.chooseList!?keys as key>
                                                    <div class="form-group">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" name="answer" value="${key}">
                                                                ${key}: ${item.chooseList[key]}
                                                            </label>
                                                        </div>
                                                    </div>
                                     </#list>
                                 </div
                             </div>
                         </div>
                     </div>
                               <#elseif item.type== "completion">
                     <div class="form-group">
                         <div class="panel panel-warning">
                             <div class="panel-heading">
                                 <h3 class="panel-title">${item_index + 1}. ${item.title!}</h3>
                             </div>
                             <div class="panel-body">
                                 ${item.content!}
                                 <div class="form-group jexam-exercise">
                                     <label>请填写答案(填空):</label>
                                     <input type="text" class="form-control ans-input" name="answer" data-type="${item.type}" data-id="${item.id}">
                                 </div
                             </div>
                         </div>
                     </div>
                               <#else>
                    <div class="form-group">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">${item_index + 1}. ${item.title!}</h3>
                            </div>
                            <div class="panel-body">
                                ${item.content!}
                                <div class="form-group jexam-exercise">
                                    <label>请填写答案(简答):</label>
                                    <textarea class="form-control ans-textArea" rows="3" name="answer" data-type="${item.type}" data-id="${item.id}"></textarea>
                                </div
                            </div>
                        </div>
                    </div>
                               </#if>
                           </#list>
                <div class="form-group">
                    <input type="submit" class="form-control" value="提交" id="paper-submit" onclick="exerciseSubmit()">
                </div>
            </div>
        </div><!-- /.row -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="${request.contextPath}/js/jquery.min.js"></script>
    <script src="${request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        var intDiff = parseInt(${time} * 60);
        function timer(intDiff){
            var timeID = window.setInterval(function(){
                if (intDiff < 0) {
                    window.clearInterval(timeID);
                    exerciseSubmit();
                }
                var hour=0, minute=0, second=0;//时间默认值
                if(intDiff > 0){
                    hour = Math.floor(intDiff / (60 * 60));
                    minute = Math.floor(intDiff / 60) - (hour * 60);
                    second = Math.floor(intDiff) - (hour * 60 * 60) - (minute * 60);
                }
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
                $('#hour_show').html('<s id="h"></s>'+hour+'时');
                $('#minute_show').html('<s></s>'+minute+'分');
                $('#second_show').html('<s></s>'+second+'秒');
                intDiff--;
            }, 1000);
        }

        $(function(){
            document.oncontextmenu = function(){
                event.returnValue = false;
            }
            document.onselectStart = function(){
                event.returnValue = false;
            }
            document.oncopy = function(){
                event.returnValue = false;
            }
            timer(intDiff);
        });

        function formPost(URL, ANSWER) {
            var temp = document.createElement("form");
            temp.action = URL;
            temp.method = "post";
            temp.style.display = "none";
            var opt = document.createElement("input");
            opt.setAttribute("name", "answers");
            opt.setAttribute("value", ANSWER);
            temp.appendChild(opt);
            document.body.appendChild(temp);
            temp.submit();
            return temp;
        }

        function exerciseSubmit() {
            var ans_radio_arr = $('.ans-radio');
            var ans_mul_arr = $('.ans-mul');
            var ans_input_arr = $('.ans-input');
            var ans_textArea_arr = $('.ans-textArea');
            var res = [];
            for (var i = 0, l = ans_radio_arr.length; i < l; i++) {
                var obj = {
                    value: $('input:radio:checked', ans_radio_arr[i]).val(),
                    type: $(ans_radio_arr[i]).attr('data-type'),
                    id: $(ans_radio_arr[i]).attr('data-id'),
                };
                res.push(obj);
            }
            for (var i = 0, l = ans_mul_arr.length; i < l; i++) {
                var obj = {
                    value: this.getMulValue($('input:checkbox:checked', ans_mul_arr[i])),
                    type: $(ans_mul_arr[i]).attr('data-type'),
                    id: $(ans_mul_arr[i]).attr('data-id'),
                };
                res.push(obj);
            }
            for (var i = 0, l = ans_input_arr.length; i < l; i++) {
                var obj = {
                    value: $(ans_input_arr[i]).val(),
                    type: $(ans_input_arr[i]).attr('data-type'),
                    id: $(ans_input_arr[i]).attr('data-id'),
                };
                res.push(obj);
            }
            for (var i = 0, l = ans_textArea_arr.length; i < l; i++) {
                var obj = {
                    value: $(ans_textArea_arr[i]).val(),
                    type: $(ans_textArea_arr[i]).attr('data-type'),
                    id: $(ans_textArea_arr[i]).attr('data-id'),
                };
                res.push(obj);
            }
            var json = JSON.stringify(res);
            formPost("${request.contextPath}/user/stu/papers/${paperId}", json);
        }

        function getMulValue(origin) {
            var arr = [];
            origin.each(function(){
                arr.push($(this).val());
            });
            return arr.join();
        }
    </script>
</body>
</html>