<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/page/share/taglib.jsp" %>
<html>
<head>
<title>产品类别管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/vip.css" type="text/css">
<script language="JavaScript">
<!--
	//到指定的分页页面
	function topage(page){
		var form = document.forms[0];
		form.page.value = page;
		form.submit();
	}
//-->
</script>
<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
<s:form action="/control/product/type/list" method="post">
	<s:hidden name="page" />
	<!-- query and type.name is prepared for query type name function -->
	<s:hidden name="query" />
	<s:hidden name="type.name" />
	<!--<s:hidden name="type.parent.typeid"></s:hidden>-->
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
   <tr ><td colspan="6" bgcolor="6f8ac4" align="right">
    	<%@ include file="/WEB-INF/page/share/paging.jsp" %>
   </td></tr>
    <tr>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">代号</font></div></td>
      <td width="5%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">修改</font></div></td>
      <td width="20%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">产品类别名称</font></div></td>
	  <td width="10%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">创建下级类别</font></div></td>
	  <td width="15%" bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">所属父类</font></div></td>
	  <td nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">备注</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<s:iterator value="pageView.qr.resultList" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center">${entry.typeid }</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href="<s:url value="/control/product/type/manage!editUI"/>?type.typeid=${entry.typeid }">
	  <img src="/images/edit.gif" width="15" height="16" border="0"></a></div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href='<s:url value="/control/product/type/list"/>?type.typeid=${entry.typeid}'>${entry.name } <s:if test="#entry.childtypes.size()!=0">( has ${entry.childtypes.size()} children types )</s:if>  </a> </div></td>
	  <td bgcolor="f5f5f5"> <div align="center"><a href="<s:url value="/control/product/type/manage!addUI"/>?type.parent.typeid=${entry.typeid}">创建子类别</a></div></td>
	  <td bgcolor="f5f5f5" align="center"></td>
	  <td bgcolor="f5f5f5">${entry.note }</td>
	</tr>
</s:iterator>
    <!----------------------LOOP END------------------------------->
    <tr> 
      <td bgcolor="f5f5f5" colspan="6" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="5%"></td>
              <td width="85%">
              <input name="AddDic" type="button" class="frm_btn" id="AddDic" onClick="javascript:window.location.href='<s:url action="/control/product/type/manage!addUI"/>?type.parent.typeid=${type.typeid}'" value="添加类别"> &nbsp;&nbsp;
			  <input name="query" type="button" class="frm_btn" id="query" onClick="javascript:window.location.href='<s:url action="/control/product/type/manage!queryUI"/>'" value=" 查 询 "> &nbsp;&nbsp;
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</s:form>
</body>
</html>