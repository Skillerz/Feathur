<div id="Status" style="margin:5px;">
	<script type="text/javascript">
        function uptime() {
                $(function() {
                        $.getJSON("admin.php?json=1",function(result){
                                $("#Status").html(result.content);
                        });
                });
        }
        {%if isset|Status == false}
                setInterval(uptime, {%?RefreshTime}000);
        {%/if}
	</script>
	<div align="center">Welcome to Feathur, here is a quick system report:</div><br><br>
	{%if isset|Statistics == true}
		{%foreach server in Statistics}
			<div class="simplebox grid360-{%if isempty|server[type] == true}right{%/if}{%if isempty|server[type] == false}left{%/if}" style="padding:3px;padding-bottom:10px;">
				<div class="titleh">
					<h3>
						<div style="width:49%;float:left;">
							<img src="./templates/status/{%if isempty|server[status] == true}offline{%/if}{%if isempty|server[status] == false}online{%/if}.png" style="width:10px;height:10px;">{%?server[name]}
						</div>
						<div style="width:49%;float:right;padding-right:5px;" align="right">
							Load: {%?server[load_average]}
						</div>
					</h3>
				</div>
				<div class="body padding10">
					<div align="center" style="height:50px;">
						Uptime: {%?server[uptime]}
						<hr>
						<div style="width:40%;float:left;">
							<strong>Memory Usage:</strong>
							<div class="progress" style="padding:0;margin:0;">
								<div class="bar bar-warning" style="width: {%?server[ram_usage]}%;padding-top:5px;">U</div>
								<div class="bar bar-success" style="width: {%?server[ram_free]}%;padding-top:5px;">F</div>
							</div>
						</div>
						<div style="width:40%;float:right;">
							<strong>Disk Usage:</strong>
							<div class="progress" style="padding:0;margin:0;">
								<div class="bar bar-warning" style="width: {%?server[disk_usage]}%;padding-top:5px;">U</div>
								<div class="bar bar-success" style="width: {%?server[disk_free]}%;padding-top:5px;">F</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			{%if isempty|server[type] == true}<div class="clear"></div>{%/if}
		{%/foreach}
	{%/if}
	{%if isset|Statistics == false}
		<br><br>
		<div align="center">
			Add a server to Feathur so updates will appear here.
		</div>
	{%/if}
</div>