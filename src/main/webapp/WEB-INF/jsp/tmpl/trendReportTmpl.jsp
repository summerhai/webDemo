<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/4
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script id="device1Tmpl" type="text/x-jquery-tmpl">

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
			<td>
				<span   title="{{html name3}}" >{{html name3}}</span>
			</td>
		</tr>

{{/each}}

</script>

<script id="device1SumTmpl" type="text/x-jquery-tmpl">

{{each data}}
   <tr>
			<td>
				<span   title="{{html name1}}" style="font-weight:bold">{{html name1}}</span>
			</td>
			<td>
				<span   title="{{html value1}}" style="font-weight:bold">{{html value1}}</span>
			</td>
			<td>
				<span   title="{{html name2}}" style="font-weight:bold">{{html name2}}</span>
			</td>
			<td>
				<span   title="{{html value2}}" style="font-weight:bold">{{html value2}}</span>
			</td>
		</tr>

{{/each}}

</script>
