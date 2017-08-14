(function ($, window) {
    var applicationPath =sy.pn();
    function SuiJiNum() {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    }

    function initWebUpload(item, options) {

        if (!WebUploader.Uploader.support()) {
            var error = "上传控件不支持您的浏览器！请尝试升级flash版本或者使用Chrome引擎的浏览器。<a target='_blank' href='http://se.360.cn'>下载页面</a>";
            if (window.console) {
                window.console.log(error);
            }
            $(item).text(error);
            return;
        }
        //创建默认参数
        var defaults = {
            auto:true,
            hiddenInputId: "uploadifyHiddenInputId", // input hidden id
            onAllComplete: function (event) { }, // 当所有file都上传后执行的回调函数
            onComplete: function (event) { },// 每上传一个file的回调函数
            innerOptions: {},
            fileNumLimit: undefined,//验证文件总数量, 超出则不允许加入队列
            fileSizeLimit: undefined,//验证文件总大小是否超出限制, 超出则不允许加入队列。
            fileSingleSizeLimit: undefined,//验证单个文件大小是否超出限制, 超出则不允许加入队列
            PostbackHold: false
        };
        var opts = $.extend(defaults, options);
        if(opts.fileSingleSizeLimit!=undefined){
        	opts.fileSingleSizeLimit=opts.fileSingleSizeLimit;
        }else{
        	opts.fileSingleSizeLimit=10;
        }
        
        opts.mimeTypes=null;
        
        if( opts.selectTitle==null){
        	opts.selectTitle="选择文件";
        }
       
     
        if(opts.fileType==undefined){
        	opts.fileType='*';
        	opts.mimeTypes="*";
        }else{
        	var fileTypes=opts.fileType.split(",");
        	var tempMimeTypes="";
        	for(var i=0;i<fileTypes.length;i++){
        		if(tempMimeTypes==""){
        			tempMimeTypes="."+fileTypes[i];
        		}else {
        			tempMimeTypes=tempMimeTypes+",."+fileTypes[i];
        		}
        		
        	}
        	opts.mimeTypes=tempMimeTypes;
        }
        
        var hdFileData = $("#" + opts.hiddenInputId);
        var target = $(item);//容器
        var pickerid = "";
        if (typeof guidGenerator36 != 'undefined')//给一个唯一ID
            pickerid = guidGenerator36();
        else
            pickerid = (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
        var uploaderStrdiv = '<div class="webuploader">'
        //debugger
        var upload_tip="";
        
        if(opts.imageId==undefined){
        	if(opts.fileType!="*"){
            	upload_tip = '上传文件类型为'+opts.fileType+'格式；单个文件大小不能超过'+opts.fileSingleSizeLimit+'M。最大上传数'+opts.fileNumLimit+'。';
            }else{
            	upload_tip='文件大小不能超过'+opts.fileSingleSizeLimit+'M。';
            }
        }
        
        	
        if (opts.auto) {
            uploaderStrdiv = 
            '<div id="Uploadthelist" class="uploader-list"></div>' +
            '<div class="btns">' +
            '<div id="' + pickerid + '">'+opts.selectTitle+'</div>' +
            '</div>'
            +'<div class="upload-tip" style="color:red">'+upload_tip+'<div>';

        } else {
            uploaderStrdiv = 
            '<div  class="uploader-list"></div>' +
            '<div class="btns">' +
            '<div id="' + pickerid + '">选择文件</div>' +
            '<button class="webuploadbtn">开始上传</button>' +
            '</div>'
        }
        uploaderStrdiv += '<div style="display:none" class="UploadhiddenInput" >\
                         </div>'
        uploaderStrdiv+='</div>';
        target.append(uploaderStrdiv);

        var $list = target.find('.uploader-list'),
             $btn = target.find('.webuploadbtn'),//手动上传按钮备用
             state = 'pending',
             $hiddenInput = target.find('.UploadhiddenInput'),
             uploader;
        var jsonData = {
            fileList: []
        };

        var webuploaderoptions = $.extend({

            // swf文件路径
            swf: applicationPath + '/static/lib/upload/Uploader.swf',
            // 文件接收服务端。
            server:  opts.serverPath,
            deleteServer:'/Home/DeleteFile',
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#' + pickerid,
            //不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            chunked: true,
            chunkSize: 512 * 1024,
            fileNumLimit: opts.fileNumLimit,
            accept: {
            	  title: 'Images',
                  extensions:opts.fileType,       
                  mimeTypes: opts.mimeTypes
            	},
            fileSizeLimit: opts.fileSizeLimit,//限制大小10M，所有被选文件，超出选择不上
            fileSingleSizeLimit: opts.fileSingleSizeLimit*1024*1024//限制大小10M，单文件
        },
        opts.innerOptions);
        var uploader = WebUploader.create(webuploaderoptions);

        //回发时还原hiddenfiled的保持数据
        var fileDataStr = hdFileData.val();
        if (fileDataStr && opts.PostbackHold) {
            jsonData = JSON.parse(fileDataStr);
            $.each(jsonData.fileList, function (index, fileData) {
                var newid = SuiJiNum();
                fileData.queueId = newid;
                $list.append('<div id="' + newid + '" class="item">' +
                '<div class="info">' + fileData.name + '</div>' +
                '<div class="state">已上传</div>' +
                '<div class="del"></div>' +
                '</div>');
            });
            hdFileData.val(JSON.stringify(jsonData));
        }



        if (opts.auto) {
            
            uploader.on('fileQueued', function (file) {
                //debugger;
            	if(opts.imageId==undefined){
            		 $list.append('<div id="' + $(item)[0].id + file.id + '" class="item">' +
                             '<span class="webuploadinfo">' + file.name + '</span>' +
                             '<span class="webuploadstate">正在上传...</span>' +
                             '<div class="webuploadDelbtn">删除</div><br />' +
                         '</div>');
            	}
               
                uploader.upload();
            });
        } else {
            uploader.on('fileQueued', function (file) {//队列事件
                $list.append('<div id="' + $(item)[0].id + file.id + '" class="item">' +
                    '<span class="webuploadinfo">' + file.name + '</span>' +
                    '<span class="webuploadstate">等待上传...</span>' +
                    '<div class="webuploadDelbtn">删除</div><br />' +
                '</div>');
            });
        }
    //  验证大小
        uploader.on("error",function (type){
             if(type == "F_DUPLICATE"){
            	 $.messager.alert('提示信息','请不要重复选择文件！');
                  //alert("请不要重复选择文件！");
             }else if(type == "Q_EXCEED_SIZE_LIMIT"){
            	 $.messager.alert('提示信息',"<span class='C6'>所选附件总大小</span>不可超过<span class='C6'>" + opts.fileSingleSizeLimit + "M</span>哦！<br>换个小点的文件吧！");
             }else if(type=="F_EXCEED_SIZE"){
            	 $.messager.alert('提示信息',"所选文件大小应小于" + opts.fileSingleSizeLimit + "M");
             }else if (type=="Q_TYPE_DENIED"){
            	 $.messager.alert('提示信息',"请上传"+opts.fileType+"格式文件");
             }else if (type=="Q_EXCEED_NUM_LIMIT"){
            	 $.messager.alert('提示信息',"上传数量已达最大值，无法再上传文件");
             }


         });
      
        uploader.on('uploadProgress', function (file, percentage) {//进度条事件
            var $li = target.find('#' + $(item)[0].id + file.id),
                $percent = $li.find('.progress .bar');

            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<span class="progress">' +
                    '<span  class="percentage"><span class="text"></span>' +
                  '<span class="bar" role="progressbar" style="width: 0%">' +
                  '</span></span>' +
                '</span>').appendTo($li).find('.bar');
            }

            $li.find('span.webuploadstate').html('上传中');
            $li.find(".text").text(Math.round(percentage * 100) + '%');
            $percent.css('width', percentage * 100 + '%');
        });
        uploader.on('uploadSuccess', function (file, response) {//上传成功事件
            //debugger
        	//alert(response.originName);
            if (response.state == "error") {
                target.find('#' + $(item)[0].id + file.id).find('span.webuploadstate').html(response.message);
            } else {
            	if(opts.imageId==undefined){
            		 target.find('#' + $(item)[0].id + file.id).find('span.webuploadstate').html('已上传');
            	}else{
            		$("#"+opts.imageId).attr("src",sy.localhostPath()+"/file/"+response.url+"/"+response.fileName);
            	}
            	$hiddenInput.append('<input type="text" id="hiddenInput'+$(item)[0].id + file.id + '" name="originName" class="hiddenInput" value="' + response.originName + '" />').append('<input type="text" id="hiddenInputUrl'+$(item)[0].id + file.id + '" name="url" class="hiddenInput" value="' + response.url + '" />').append('<input type="text" id="hiddenInputFileName'+$(item)[0].id + file.id + '" name="fileName" class="hiddenInput" value="' + response.fileName + '" />');
            }


        });

        uploader.on('uploadError', function (file) {
            target.find('#' + $(item)[0].id + file.id).find('span.webuploadstate').html('上传出错');
        });

        uploader.on('uploadComplete', function (file) {//全部完成事件
            target.find('#' + $(item)[0].id + file.id).find('.progress').fadeOut();

        });

        uploader.on('all', function (type) {
            if (type === 'startUpload') {
                state = 'uploading';
            } else if (type === 'stopUpload') {
                state = 'paused';
            } else if (type === 'uploadFinished') {
                state = 'done';
            }

            if (state === 'uploading') {
                $btn.text('暂停上传');
            } else {
                $btn.text('开始上传');
            }
        });

        //删除时执行的方法
        uploader.on('fileDequeued', function (file) {
            //debugger
            
            var fullName = $("#hiddenInput" + $(item)[0].id + file.id).val();
           /* if (fullName!=null) {
                $.post(webuploaderoptions.deleteServer, { fullName: fullName }, function (data) {
                    alert(data.message);
                })
            }*/
            $("#"+ $(item)[0].id + file.id).remove();
            $("#hiddenInput" + $(item)[0].id + file.id).remove();
            $("#hiddenInputUrl" + $(item)[0].id + file.id).remove();
            $("#hiddenInputFileName" + $(item)[0].id + file.id).remove();
            
        })

        //多文件点击上传的方法
        $btn.on('click', function () {
            if (state === 'uploading') {
                uploader.stop();
            } else {
                uploader.upload();
            }
        });

        //删除
        $list.on("click", ".webuploadDelbtn", function () {
            //debugger
            var $ele = $(this);
            var id = $ele.parent().attr("id");
            var id = id.replace($(item)[0].id, "");

            var file = uploader.getFile(id);
            uploader.removeFile(file);
        });

    }
    $.fn.GetFilesAddress = function (options) {
        var ele = $(this);
        var filesdata = ele.find(".UploadhiddenInput");
        var filesAddress = [];
        filesdata.find(".hiddenInput").each(function () {
            filesAddress.push($(this).val());
        })
        return filesAddress;
        
    }

    $.fn.powerWebUpload = function (options) {
        var ele = this;
        if (typeof WebUploader == 'undefined') {
        	
            var casspath = applicationPath + "/static/lib/upload/webuploader.css";
            $("<link>").attr({ rel: "stylesheet", type: "text/css", href: casspath }).appendTo("head");
            var jspath = applicationPath + "/static/lib/upload/webuploader.min.js";
            $.getScript(jspath) .done(function() {
                initWebUpload(ele, options);
            })
            .fail(function() {
                alert("请检查webuploader的路径是否正确!")
            });
           
        }
        else {
        	//alert(applicationPath);
            initWebUpload(ele, options);
        }
    }
})(jQuery, window);