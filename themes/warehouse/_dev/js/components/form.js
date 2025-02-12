/**
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
 */
import $ from 'jquery';

export default class Form {
  init() {
    this.parentFocus();
    this.togglePasswordVisibility();
  }

  parentFocus() {
    $('.js-child-focus').on('focus', function () {
      $(this).closest('.js-parent-focus').addClass('focus');
    });
    $('.js-child-focus').on('focusout', function () {
      $(this).closest('.js-parent-focus').removeClass('focus');
    });
  }

  togglePasswordVisibility() {
    $('button[data-action="show-password"]').on('click', function () {
      const elm = $(this).closest('.input-group').children('input.js-visible-password');

      if (elm.attr('type') === 'password') {
        elm.attr('type', 'text');
        $(this).find('i').removeClass('fa-eye-slash').addClass('fa-eye');
      } else {
        elm.attr('type', 'password');
        $(this).find('i').removeClass('fa-eye').addClass('fa-eye-slash');
      }
    });
  }
}
