﻿<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="../internal.js"></script>
    <script type="text/javascript" src="../common.js"></script>
    <%=WebMvc.Common.Tools.IncludeFiles %>
</head>
<body>
<% 
    WebMvc.Common.Tools.CheckLogin();
    Business.Platform.WorkFlowForm workFlowFrom = new Business.Platform.WorkFlowForm(); 
%>
<br />
<table cellpadding="0" cellspacing="1" border="0" width="95%" class="formtable">
    <tr>
        <th style="width:80px;">绑定字段：</th>
        <td><select class="myselect" id="bindfiled" style="width:227px"></select></td>
    </tr>
    <tr>
        <th>宽度：</th>
        <td><input type="text" id="width" class="mytext" style="width:150px" /></td>
    </tr>
    <tr>
        <th>文件类型：</th>
        <td>
            <div style="margin-top:3px;">格式：*.jpg;*.png;*.gif;*.doc;*.docx</div>
            <div style="margin-top:3px;"><input type="text" id="filetype" class="mytext" style="width:227px" /></div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    var text = getElement(editor, "flow_files", "formfilesDialog");
    var attJSON = parent.formattributeJSON;
    var textid = text ? text.id : "";
    $(function ()
    {
        biddingFileds(attJSON, textid, $("#bindfiled"));
        if (text)
        {
            $text = $(text);
            if ($text.attr('width1')) $("#width").val($text.attr('width1'));
            $("#filetype").val($text.attr('filetype'));
        }
    });
    dialog.onok = function ()
    {
        var bindfiled = $("#bindfiled").val();
        var id = attJSON.dbconn && attJSON.dbtable && bindfiled ? attJSON.dbtable + '.' + bindfiled : "";
        var width = $("#width").val();
        var filetype = $("#filetype").val();
        
        var html = '<input ondblclick="if(editor.ui._dialogs.formfilesDialog.iframeUrl.indexOf(\'?\')==-1){editor.ui._dialogs.formfilesDialog.iframeUrl=editor.ui._dialogs.formfilesDialog.iframeUrl+\'?edit=1\';}editor.ui._dialogs.formfilesDialog.open();" title="双击可设置属性" type="text" type1="flow_files" id="' + id + '" name="' + id + '" value="附件管理" ';
        if (width)
        {
            html += 'style="width:' + width + '" ';
            html += 'width1="' + width + '" ';
        }
       
        html += 'filetype="' + filetype + '" ';
        html += '/>';
        if (text)
        {
            $(text).remove();
        }
        editor.execCommand("formfiles", html);
        dialog.close();
    }
</script>
</body>
</html>