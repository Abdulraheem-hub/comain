{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<!doctype html>
<html lang="">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    {block name='head_seo'}
      <title>{block name='head_seo_title'}{/block}</title>
      <meta name="description" content="{block name='head_seo_description'}{/block}">
      <meta name="keywords" content="{block name='head_seo_keywords'}{/block}">
    {/block}
    <meta name="viewport" content="width=device-width, initial-scale=1">

    {block name='head_icons'}
      <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
      <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
    {/block}

    {block name='stylesheets'}
      {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
    {/block}

  </head>

  {block name='body_tag'}
  <body>
  {/block}

  {block name='layout_error_tag'}
    <div id="layout-error">
  {/block}
      {block name='content'}
        <p>Hello world! This is HTML5 Boilerplate.</p>
      {/block}
    </div>

  {block name='maintenance_js'}
  {/block}


  {block name='hook_fonts'}
    {if $iqitTheme.typo_bfont_t == 'google' || $iqitTheme.typo_hfont_t == 'google'}
      <link rel="preconnect"
            href="https://fonts.gstatic.com"
            crossorigin />
    {/if}
    {if $iqitTheme.typo_bfont_t == 'google'}
      <link rel="preload"
            as="style"
            href="{$iqitTheme.typo_bfont_g_url}" />

      <link rel="stylesheet"
            href="{$iqitTheme.typo_bfont_g_url}"
            media="print" onload="this.media='all'" />

    {/if}
    {if $iqitTheme.typo_hfont_t == 'google'}
      <link href="{$iqitTheme.typo_hfont_g_url}" rel="stylesheet">
      <link rel="preload"
            as="style"
            href="{$iqitTheme.typo_hfont_g_url}" />

      <link rel="stylesheet"
            href="{$iqitTheme.typo_hfont_g_url}"
            media="print" onload="this.media='all'" />
    {/if}
  {/block}

  </body>

</html>
