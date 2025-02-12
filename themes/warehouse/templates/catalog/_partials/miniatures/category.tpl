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
{block name='category_miniature_item'}
  <section class="category-miniature">
    <a href="{$category.url}">
    <picture>
      {if !empty($category.image.bySize.medium_default.sources.avif)}<source srcset="{$category.image.bySize.medium_default.sources.avif}" type="image/avif">{/if}
      {if !empty($category.image.bySize.medium_default.sources.webp)}<source srcset="{$category.image.bySize.medium_default.sources.webp}" type="image/webp">{/if}
      <img
              src="{$category.image.medium.url}"
              alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}"
              loading="lazy"
              width="{$image.bySize.medium.width}"
              height="{$image.bySize.medium.height}" />
    </picture>
    </a>

    <h1 class="h2">
      <a href="{$category.url}">{$category.name}</a>
    </h1>

    <div class="category-description">{$category.description nofilter}</div>
  </section>
{/block}
