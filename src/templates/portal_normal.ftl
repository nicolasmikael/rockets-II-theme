<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key=" lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>
		${html_title}
	</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"]
		page=top_head_include />
</head>

<body class="${css_class}">
	<@liferay_ui["quick-access"]
		contentId="#main-content" />
	<@liferay_util["include"]
		page=body_top_include />
	<@liferay.control_menu />
	<div class="container-fluid position-relative" id="wrapper">
		<header id="banner" role="banner" class="navbar navbar-expand-lg navbar-light shadow-sm p-3">
			<div id="heading" class="d-flex align-items-center">
				<div aria-level="1" class="site-title" role="heading">
					<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments=" ${site_name}" key="go-to-x" />">
					<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" class="img-fluid" />
					</a>
					<#if show_site_name>
						<span class="site-name ml-3 font-weight-bold text-dark" title="<@liferay.language_format arguments=" ${site_name}" key="go-to-x" />">
						${site_name}
						</span>
					</#if>
				</div>
			</div>
			<div class="ml-auto d-flex align-items-center">
				<
					<label class="theme-switch mr-3" for="theme-toggle">
					<input type="checkbox" id="theme-toggle" />
					<span class="slider round"></span>
					</label>
					<#if !is_signed_in>
						<a href="${sign_in_url}" id="sign-in" class="btn btn-outline-primary btn-sm mr-3" rel="nofollow" title="Sign In">
							${sign_in_text}
						</a>
					</#if>
					<#if has_navigation && is_setup_complete>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<#include "${full_templates_path}/navigation.ftl" />
						</div>
					</#if>
			</div>
		</header>
		<section id="content">
			<h2 class="hide-accessible sr-only" role="heading" aria-level="1">
				${htmlUtil.escape(the_title)}
			</h2>
			<#if selectable>
				<@liferay_util["include"]
					page=content_include />
				<#else>
					${portletDisplay.recycle()}
					${portletDisplay.setTitle(the_title)}
					<@liferay_theme["wrap-portlet"]
						page="portlet.ftl">
						<@liferay_util["include"]
							page=content_include />
						</@>
			</#if>
		</section>
		<footer id="footer" role="contentinfo">
			<p class="powered-by">
				<@liferay.language_format
					arguments='<a href="http://www.liferay.com" rel="external">Liferay</a>'
					key="powered-by-x" />
			</p>
		</footer>
	</div>
	<@liferay_util["include"]
		page=body_bottom_include />
	<@liferay_util["include"]
		page=bottom_include />
</body>

</html>