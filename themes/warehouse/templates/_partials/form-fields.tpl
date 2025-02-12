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


{if $field.type == 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value|default}">
  {/block}

{else}

  <div class="form-group row align-items-center {if !empty($field.errors)}has-error{/if}">
    <label class="col-md-2 col-form-label{if $field.required} required{/if}" for="field-{$field.name}">
      {if $field.type !== 'checkbox'}
        {$field.label}
      {/if}
    </label>
    <div class="col-md-8 js-input-column {if ($field.type === 'radio-buttons')} form-control-valign{/if}">

      {if $field.type === 'select'}

        {block name='form_field_item_select'}
            <div class="custom-select2">
                <select id="field-{$field.name}" class="form-control form-control-select" name="{$field.name}" {if $field.required}required{/if}>
                    <option value disabled selected>{l s='Please choose' d='Shop.Forms.Labels'}</option>
                    {foreach from=$field.availableValues item="label" key="value"}
                        <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
                    {/foreach}
                </select>
            </div>
        {/block}

      {elseif $field.type === 'countrySelect'}

        {block name='form_field_item_country'}
          <div class="custom-select2">
            <select  id="field-{$field.name}" class="form-control form-control-select js-country" name="{$field.name}"
            {if $field.required}required{/if}>
                <option value disabled selected>{l s='Please choose' d='Shop.Forms.Labels'}</option>
                {foreach from=$field.availableValues item="label" key="value"}
                    <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
                {/foreach}
            </select>
          </div>
        {/block}

      {elseif $field.type === 'radio-buttons'}

        {block name='form_field_item_radio'}
          {foreach from=$field.availableValues item="label" key="value"}
            <label class="radio-inline">
              <span class="custom-radio">
                <input
                  name="{$field.name}"
                  type="radio"
                  value="{$value}"
                  {if $field.required}required{/if}
                  {if $value eq $field.value} checked {/if}
                >
                <span></span>
              </span>
              {$label}
            </label>
          {/foreach}
        {/block}

      {elseif $field.type === 'checkbox'}

        {block name='form_field_item_checkbox'}
          <span class="custom-checkbox">
            <input name="{$field.name}" id="ff_{$field.name}" type="checkbox" value="1" {if $field.value}checked="checked"{/if} {if $field.required}required{/if}>
            <span><i class="fa fa-check rtl-no-flip checkbox-checked" aria-hidden="true"></i></span>
            <label for="ff_{$field.name}">{$field.label nofilter}</label >
          </span>
        {/block}

      {elseif $field.type === 'date'}

        {block name='form_field_item_date'}
          <input name="{$field.name}" class="form-control" type="date" value="{$field.value|default}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}">
          {if isset($field.availableValues.comment)}
            <span class="form-control-comment">
              {$field.availableValues.comment}
            </span>
          {/if}
        {/block}

      {elseif $field.type === 'birthday'}

        {block name='form_field_item_birthday'}
          <div class="js-parent-focus">
            {html_select_date
            field_order=DMY
            time={$field.value|default}
            field_array={$field.name}
            prefix=false
            reverse_years=true
            field_separator='<br>'
            day_extra='class="form-control form-control-select"'
            month_extra='class="form-control form-control-select"'
            year_extra='class="form-control form-control-select"'
            day_empty={l s='-- day --' d='Shop.Forms.Labels'}
            month_empty={l s='-- month --' d='Shop.Forms.Labels'}
            year_empty={l s='-- year --' d='Shop.Forms.Labels'}
            start_year={'Y'|date}-100 end_year={'Y'|date}
            }
          </div>
        {/block}

      {elseif $field.type === 'password'}

        {block name='form_field_item_password'}
          <div class="input-group js-parent-focus">
            <input id="field-{$field.name}"
              class="form-control js-child-focus js-visible-password"
              name="{$field.name}"
              aria-label="{l s='Password input' d='Shop.Forms.Help'}"
              title="{l s='At least 5 characters long' d='Shop.Forms.Help'}"
             {if isset($configuration.password_policy.minimum_length)}data-minlength="{$configuration.password_policy.minimum_length}"{/if}
             {if isset($configuration.password_policy.maximum_length)}data-maxlength="{$configuration.password_policy.maximum_length}"{/if}
             {if isset($configuration.password_policy.minimum_score)}data-minscore="{$configuration.password_policy.minimum_score}"{/if}
              {if isset($wishlistModal)}autocomplete="new-password" {else}
                    {if $field.autocomplete}autocomplete="{$field.autocomplete}"{/if}
              {/if}
              type="password"
              value=""
              pattern=".{literal}{{/literal}5,{literal}}{/literal}"
              {if $field.required}required{/if}
            >
            <span class="input-group-append">
              <button
                class="btn btn-outline-secondary"
                type="button"
                data-action="show-password"
              >
               <i class="fa fa-eye-slash" aria-hidden="true"></i>
              </button>
            </span>
          </div>
        {/block}

      {else}

        {block name='form_field_item_other'}
          <input
            id="field-{$field.name}"
            class="form-control"
            name="{$field.name}"
            type="{$field.type}"
            value="{$field.value|default}"
            {if $field.autocomplete}autocomplete="{$field.autocomplete}"{/if}
            {if isset($field.availableValues.placeholder)}placeholder="{$field.availableValues.placeholder}"{/if}
            {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
            {if $field.required}required{/if}
          >
          {if isset($field.availableValues.comment)}
            <span class="form-control-comment">
              {$field.availableValues.comment}
            </span>
          {/if}
        {/block}

      {/if}

      {block name='form_field_errors'}
        {include file='_partials/form-errors.tpl' errors=$field.errors}
      {/block}

    </div>

    <div class="col-md-2 form-control-comment">
      {block name='form_field_comment'}
        {if (!$field.required && !in_array($field.type, ['radio-buttons', 'checkbox']))}
         {l s='Optional' d='Shop.Forms.Labels'}
        {/if}
      {/block}
    </div>
  </div>

{/if}
