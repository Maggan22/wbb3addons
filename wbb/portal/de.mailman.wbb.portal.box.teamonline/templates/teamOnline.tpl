{include file="documentHeader"}
<head>
	<title>{lang}wbb.portal.box.teamonlinebox.pageTitle{/lang} - {PAGE_TITLE}</title>
	{include file='headInclude' sandbox=false}
	{if USERS_ONLINE_PAGE_REFRESH > 0}
		<meta http-equiv="refresh" content="{@USERS_ONLINE_PAGE_REFRESH}; url=index.php?page=TeamOnline&amp;sortField={$sortField}&amp;sortOrder={$sortOrder}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}" />
	{/if}
</head>
<body>
{include file='header' sandbox=false}

<div id="main">
	
	<ul class="breadCrumbs">
		<li><a href="index.php?page=Index{@SID_ARG_2ND}"><img src="icon/indexS.png" alt="" /> <span>{PAGE_TITLE}</span></a> &raquo;</li>
	</ul>
	
	<div class="mainHeadline">
		<img src="{@RELATIVE_WCF_DIR}icon/membersL.png" alt="" /> 
		<div class="headlineContainer">
			<h2>{lang}wbb.portal.box.teamonlinebox.pageTitle{/lang}</h2>
			{if $users|count > 0 && $usersOnlineMarkings|count > 0}
				<p class="smallFont">
				{lang}wcf.usersOnline.marking.legend{/lang} {implode from=$usersOnlineMarkings item=usersOnlineMarking}{@$usersOnlineMarking}{/implode}
				</p>
			{/if}
		</div>
	</div>
	
	{if $userMessages|isset}{@$userMessages}{/if}
	
    {if $canSeeTeamOnlineBox}
        <div class="userOnline">
        	{cycle values='container-1,container-2' print=false advance=false}
        	{if $users|count > 0}
        		<div class="border">
        			<div class="containerHead"><h3>{lang}wcf.usersOnline.members{/lang}</h3></div>
        		</div>
        		<div class="border borderMarginRemove">
        			<table class="tableList">
        				<thead>
        					<tr class="tableHead">
        						<th class="columnUsername{if $sortField == 'username'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=username&amp;sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.username{/lang}
        								{if $sortField == 'username'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						{if $canViewIpAddress}
        							<th class="columnIP{if $sortField == 'ipAddress'} active{/if}">
        								<div><a href="index.php?page=TeamOnline&amp;sortField=ipAddress&amp;sortOrder={if $sortField == 'ipAddress' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        									{lang}wcf.usersOnline.ipAddress{/lang}
        									{if $sortField == 'ipAddress'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        								</a></div>
        							</th>
        							<th class="columnUserAgent{if $sortField == 'userAgent'} active{/if}">
        								<div><a href="index.php?page=TeamOnline&amp;sortField=userAgent&amp;sortOrder={if $sortField == 'userAgent' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        									{lang}wcf.usersOnline.userAgent{/lang}
        									{if $sortField == 'userAgent'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        								</a></div>
        							</th>
        						{/if}
        						<th class="columnLastActivity{if $sortField == 'lastActivityTime'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=lastActivityTime&amp;sortOrder={if $sortField == 'lastActivityTime' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.lastActivity{/lang}
        								{if $sortField == 'lastActivityTime'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						<th class="columnLocation{if $sortField == 'requestURI'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=requestURI&amp;sortOrder={if $sortField == 'requestURI' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.location{/lang}
        								{if $sortField == 'requestURI'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						
        						{if $additionalColumns|isset}{@$additionalColumns}{/if}
        					</tr>
        				</thead>
        				<tbody>
        					{foreach from=$users item=user}
        						<tr class="{cycle}">
        							<td class="columnUsername" style="width: 20%"><p><a href="index.php?page=User&amp;userID={@$user.userID}{@SID_ARG_2ND}">{@$user.username}</a></p></td>
        							{if $canViewIpAddress}
        								<td class="columnIP"><p>{$user.ipAddress}</p></td>
        								<td class="columnUserAgent" style="width: 30%"><p>{$user.userAgent}</p></td>
        							{/if}
        							<td class="columnLastActivity"><p>{@$user.lastActivityTime|shorttime}</p></td>
        							<td class="columnLocation" style="width: {if $canViewIpAddress}50{else}80{/if}%;"><p>{@$user.location}</p></td>
        							
        							{if $user.additionalColumns|isset}{@$user.additionalColumns}{/if}
        						</tr>
        					{/foreach}
        				</tbody>
        			</table>
        		</div>
        	{/if}
        	
        	{if $guests|count > 0}
        		{cycle reset=true advance=false print=false}
        		<div class="border">
        			<div class="containerHead"><h3>{lang}wcf.usersOnline.guests{/lang}</h3></div>
        		</div>
        		<div class="border borderMarginRemove">
        			<table class="tableList">
        				<thead>
        					<tr class="tableHead">
        						<th class="columnUsername{if $sortField == 'username'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=username&amp;sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.guestname{/lang}
        								{if $sortField == 'username'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						{if $canViewIpAddress}
        							<th class="columnIP{if $sortField == 'ipAddress'} active{/if}">
        								<div><a href="index.php?page=TeamOnline&amp;sortField=ipAddress&amp;sortOrder={if $sortField == 'ipAddress' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        									{lang}wcf.usersOnline.ipAddress{/lang}
        									{if $sortField == 'ipAddress'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        								</a></div>
        							</th>
        							<th class="columnUserAgent{if $sortField == 'userAgent'} active{/if}">
        								<div><a href="index.php?page=TeamOnline&amp;sortField=userAgent&amp;sortOrder={if $sortField == 'userAgent' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        									{lang}wcf.usersOnline.userAgent{/lang}
        									{if $sortField == 'userAgent'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        								</a></div>
        							</th>
        						{/if}
        						<th class="columnLastActivity{if $sortField == 'lastActivityTime'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=lastActivityTime&amp;sortOrder={if $sortField == 'lastActivityTime' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.lastActivity{/lang}
        								{if $sortField == 'lastActivityTime'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						<th class="columnLocation{if $sortField == 'requestURI'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=requestURI&amp;sortOrder={if $sortField == 'requestURI' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.location{/lang}
        								{if $sortField == 'requestURI'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						
        						{if $additionalColumns|isset}{@$additionalColumns}{/if}
        					</tr>
        				</thead>
        				<tbody>
        					{foreach from=$guests item=guest}
        						<tr class="{cycle}">
        							<td class="columnUsername" style="width: 20%"><p>{$guest.guestname}</p></td>
        							{if $canViewIpAddress}
        								<td class="columnIP"><p>{$guest.ipAddress}</p></td>
        								<td class="columnUserAgent" style="width: 30%"><p>{$guest.userAgent}</p></td>
        							{/if}
        							<td class="columnLastActivity"><p>{@$guest.lastActivityTime|shorttime}</p></td>
        							<td class="columnLocation" style="width: {if $canViewIpAddress}50{else}80{/if}%"><p>{@$guest.location}</p></td>
        							
        							{if $guest.additionalColumns|isset}{@$guest.additionalColumns}{/if}
        						</tr>
        					{/foreach}
        				</tbody>
        			</table>
        		</div>
        	{/if}
        	
        	{if $spiders|count > 0}
        		{cycle reset=true advance=false print=false}
        		<div class="border">
        			<div class="containerHead"><h3>{lang}wcf.usersOnline.spiders{/lang}</h3></div>
        		</div>
        		<div class="border borderMarginRemove">
        			<table class="tableList">
        				<thead>
        					<tr class="tableHead">
        						<th class="columnUsername{if $sortField == 'username'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=username&amp;sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.spiderName{/lang}
        								{if $sortField == 'username'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						{if $canViewIpAddress}
        							<th class="columnLastActivity{if $sortField == 'ipAddress'} active{/if}">
        								<div><a href="index.php?page=TeamOnline&amp;sortField=ipAddress&amp;sortOrder={if $sortField == 'ipAddress' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        									{lang}wcf.usersOnline.ipAddress{/lang}
        									{if $sortField == 'ipAddress'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        								</a></div>
        							</th>
        							<th class="columnUserAgent{if $sortField == 'userAgent'} active{/if}">
        								<div><a href="index.php?page=TeamOnline&amp;sortField=userAgent&amp;sortOrder={if $sortField == 'userAgent' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        									{lang}wcf.usersOnline.userAgent{/lang}
        									{if $sortField == 'userAgent'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        								</a></div>
        							</th>
        						{/if}
        						<th class="columnLastActivity{if $sortField == 'lastActivityTime'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=lastActivityTime&amp;sortOrder={if $sortField == 'lastActivityTime' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.lastActivity{/lang}
        								{if $sortField == 'lastActivityTime'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						<th class="columnLocation{if $sortField == 'requestURI'} active{/if}">
        							<div><a href="index.php?page=TeamOnline&amp;sortField=requestURI&amp;sortOrder={if $sortField == 'requestURI' && $sortOrder == 'ASC'}DESC{else}ASC{/if}&amp;detailedSpiderList={@$detailedSpiderList}{if $additionalParameters|isset}{@$additionalParameters}{/if}{@SID_ARG_2ND}">
        								{lang}wcf.usersOnline.location{/lang}
        								{if $sortField == 'requestURI'}<img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}
        							</a></div>
        						</th>
        						
        						{if $additionalColumns|isset}{@$additionalColumns}{/if}
        					</tr>
        				</thead>
        				<tbody>
        					{foreach from=$spiders item=spider}
        						<tr class="{cycle}">
        							<td class="columnUsername" style="width: 20%"><p>{if $spider.spiderURL}<a href="{$spider.spiderURL}">{$spider.spiderName}</a>{else}{$spider.spiderName}{/if}{if $spider.count > 1} ({#$spider.count}x){/if}</p></td>
        							{if $canViewIpAddress}
        								<td class="columnIP"><p>{$spider.ipAddress}</p></td>
        								<td class="columnUserAgent" style="width: 30%"><p>{$spider.userAgent}</p></td>
        							{/if}
        							<td class="columnLastActivity"><p>{@$spider.lastActivityTime|shorttime}</p></td>
        							<td class="columnLocation" style="width: {if $canViewIpAddress}50{else}80{/if}%"><p>{@$spider.location}</p></td>
        							
        							{if $spider.additionalColumns|isset}{@$spider.additionalColumns}{/if}
        						</tr>
        					{/foreach}
        				</tbody>
        			</table>
        		</div>
        	{/if}
        </div>
    {else}
        <p class="error">{lang}wbb.portal.box.teamonlinebox.error{/lang}</p>
    {/if}
</div>

{include file='footer' sandbox=false}
</body>
</html>