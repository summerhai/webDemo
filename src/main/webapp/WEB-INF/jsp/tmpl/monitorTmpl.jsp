<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/4
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script id="sewerage1Tmpl" type="text/x-jquery-tmpl">

{{each data}}
   <tr>
			<td>
				<span   title="{{html name1}}" >{{html name1}}</span>
			</td>
			<td>
				<span   title="{{html value1}}" >{{html value1}}</span>
			</td>
			<td>
				<span   title="{{html name2}}" >{{html name2}}</span>
			</td>
			<td>
				<span   title="{{html value2}}" >{{html value2}}</span>
			</td>
		</tr>

{{/each}}

</script>

<script id="anhuanTmpl" type="text/x-jquery-tmpl">

{{each data}}
   <tr>
			<td>
				<span   title="{{html name}}" >{{html name}}</span>
			</td>
			<td>
				<span   title="{{html value}}" >{{html value}}</span>
			</td>
		</tr>

{{/each}}

</script>
