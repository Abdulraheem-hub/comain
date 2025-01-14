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
<section id="order-summary-content" class="page-content page-order-confirmation">
  <div class="row">
    <div class="col-md-12">
      <h4 class="h4 black">{l s='Please check your order before payment' d='Shop.Theme.Checkout'}</h4>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12">
      <h5 class="h5">
      {l s='Addresses' d='Shop.Theme.Checkout'}
        <span class="step-edit step-to-addresses js-edit-addresses"><i class="fa fa-pencil" aria-hidden="true"></i> {l s='edit' d='Shop.Theme.Actions'}</span>
      </h5>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <div class="card noshadow address-block">
        <div class="card-body">
          <h4 class="h5 black addresshead">{l s='Your Delivery Address' d='Shop.Theme.Checkout'}</h4>
          {$customer.addresses[$cart.id_address_delivery]['formatted'] nofilter}
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card noshadow address-block">
        <div class="card-body">
          <h4 class="h5 black addresshead">{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</h4>
          {$customer.addresses[$cart.id_address_invoice]['formatted'] nofilter}
        </div>
      </div>
    </div>
  </div>


  {if !$cart.is_virtual}
  <div class="row">
    <div class="col-md-12">
      <h5 class="h5">
      {l s='Shipping Method' d='Shop.Theme.Checkout'}
        <span class="step-edit step-to-delivery js-edit-delivery"><i class="fa fa-pencil" aria-hidden="true"></i> {l s='edit' d='Shop.Theme.Actions'}</span>
      </h5>

      <div class="col-md-12 summary-selected-carrier">
        <div class="row small-gutters align-items-center">
          {if $selected_delivery_option.logo}
          <div class="col col-auto">
                <img src="{$selected_delivery_option.logo}" alt="{$selected_delivery_option.name}" class="img-fluid" loading="lazy">
          </div>
          {/if}
          <div class="col">
            <span class="carrier-name">{$selected_delivery_option.name}</span>
            <span class="text-muted">{$selected_delivery_option.delay}</span>
          </div>
          <div class="col col-auto">
            <span class="carrier-price">{$selected_delivery_option.price}</span>
          </div>
        </div>
      </div>
      {if $is_recyclable_packaging}
        <em>{l s='You have given permission to receive your order in recycled packaging.' d="Shop.Theme.Customeraccount"}</em>
      {/if}
    </div>
  </div>
  {/if}

  <div class="row">
    {block name='order_confirmation_table'}
      {include file='checkout/_partials/order-final-summary-table.tpl'
         products=$cart.products
         products_count=$cart.products_count
         subtotals=$cart.subtotals
         totals=$cart.totals
         labels=$cart.labels
         add_product_link=true
       }
    {/block}
  </div>
</section>
