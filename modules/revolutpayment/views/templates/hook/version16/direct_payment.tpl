{*
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    Revolut
 * @copyright Since 2020 Revolut
 * @license   https://opensource.org/licenses/AFL-3.0  Academic Free License (AFL 3.0)
*}

<div class="row">
    <div class="col-xs-12">
        <div class="revolut-payment">
            {if $cardWidgetIsEnabled}
                <div class="revolut-payment-form">
                    {if isset($nbProducts) && $nbProducts <= 0}
                        <p class="warning">{l s='Shopping cart is empty.' mod='revolutpayment'}</p>
                    {else}
                        {if $card_widget_currency_error}
                            <div id="revolutError">
                                <div class="error">
                                    <ul>
                                        <li>
                                            {$selected_currency|escape:'htmlall':'UTF-8'} {l s='currency is not supported for card payments, please use a different currency to check out. You can check the supported currencies in the ' mod='revolutpayment'}
                                            <a target="_blank"
                                               href="{$support_link|escape:'htmlall':'UTF-8'}">{l s='[following link]' mod='revolutpayment'}</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        {else}
                            <form class="revForm" id="revolutForm" method="post" action="{$action_link|escape:'htmlall':'UTF-8'}">
                                <input type="hidden" name="revolut_payment_title" id="revolutPaymentTitle"
                                       value="{$revolut_payment_title|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="merchant_type" id="revolutMerchantType"
                                       value="{$merchant_type|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="public_id" id="revolutPublicId"
                                       value="{$public_id|escape:'htmlall':'UTF-8'}"/>
                                <div id="revolut_card"></div>
                                {if $is_banner_enabled}
                                <div id="revolut-upsell-banner"></div>
                                {/if}
                                <input type="hidden" name="email" value="{$customer_email|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="customer_name"
                                       value="{$customer_name|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="country"
                                       value="{$country->iso_code|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="state" value="{$state->iso_code|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="city" value="{$address->city|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="line1"
                                       value="{$address->address1|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="line2"
                                       value="{$address->address2|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" name="postal"
                                       value="{$address->postcode|escape:'htmlall':'UTF-8'}"/>
                                <input type="hidden" id="revolutLocale" name="locale"
                                       value="{$locale|escape:'htmlall':'UTF-8'}"/>

                                <div class="error hidden"></div>

                                <div class="action" id="cart_navigation">
                                    <button type="button" class="btn btn-default">
                                        <span>{l s='Buy now' mod='revolutpayment'}</span>
                                    </button>
                                    <img class="visa-logo" src="{$revolutpayment_path|escape:'htmlall':'UTF-8'}views/img/visa-logo.svg"/>
                                    <img class="mastercard-logo" src="{$revolutpayment_path|escape:'htmlall':'UTF-8'}views/img/master-card-logo.svg"/>
                                    {if $amex_availability}
                                    <img class="amex-logo" src="{$revolutpayment_path|escape:'htmlall':'UTF-8'}views/img/amex.svg"/>
                                    {/if}
                                </div>
                            </form>
                        {/if}
                    {/if}
                </div>
            {/if}
            {if $payWidgetIsEnabled}
                <div class="revolut-payment-form">
                    <div class="row">
                        <div class="col-xs-12">
                            {assign var="revolut_pay_button_path" value= $revolutpayment_include_path|cat: 'views/templates/hook/revolut_pay_button.tpl'}
                            {include $revolut_pay_button_path}
                        </div>
                    </div>
                </div>
            {/if}
            <div class="revolut-payment-form revolut-logo-container">
                <div class="author">
                    <img src="{$revolutpayment_path|escape:'htmlall':'UTF-8'}views/img/Powered_by_Revolut.svg"/>
                </div>
            </div>
        </div>
    </div>
</div>