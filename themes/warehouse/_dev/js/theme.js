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
/* eslint-disable */
//import 'expose-loader?Tether!tether';
import 'bootstrap/dist/js/bootstrap.min';
import 'flexibility';
import 'bootstrap-touchspin';
import 'waypoints/lib/jquery.waypoints.min';
import 'waypoints/lib/shortcuts/sticky.min';
import Swiper from './lib/swiper-bundle.min';
window.Swiper = Swiper;
import './selectors';

import './responsive';
import './checkout';
import './customer';
import './listing';
import './product';
import './cart';

import usePasswordPolicy from './components/usePasswordPolicy';
import ThemeCompontents from './components/theme-components';
import ThemeOptions from './components/theme-options';
import MobileAccordion from './components/mobile-accordion';
import BlockSearch from './components/block-search';
import DropDown from './components/drop-down';
import Form from './components/form';
import ProductMinitature from './components/product-miniature';
import ProductSelect from './components/product-select';
import MobileMenu from './components/MobileMenu';

import prestashop from 'prestashop';
import EventEmitter from 'events';

import './lib/bootstrap-filestyle.min';
import './lib/footer-reveal.min';
import './lib/jquery.sticky-up-header.min';


import './components/block-cart';
import $ from 'jquery';

/* eslint-enable */

// "inherit" EventEmitter
// eslint-disable-next-line
for (const i in EventEmitter.prototype) {
  prestashop[i] = EventEmitter.prototype[i];
}

const themeOptions = new ThemeOptions();

$(document).ready(() => {
  const dropDownEl = $('.js-dropdown');
  const mobileAccordionEl = $('.js-block-toggle');
  const form = new Form();
  const mobileAccordion = new MobileAccordion(mobileAccordionEl);
  const dropDown = new DropDown(dropDownEl);
  const productMinitature = new ProductMinitature();
  const productSelect = new ProductSelect();
  const themeCompontents = new ThemeCompontents();

  const blockSearch = new BlockSearch();

  mobileAccordion.init();
  blockSearch.init();
  dropDown.init();
  form.init();
  productMinitature.init();
  productSelect.init();
  themeCompontents.init();
  usePasswordPolicy('.field-password-policy');

  const mobileMenu = new MobileMenu('.js-mobile-menu');

});

themeOptions.init();
// eslint-disable-next-line
window._BStooltip  = jQuery.fn.tooltip;
