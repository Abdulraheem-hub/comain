<div id="product-short-details" data-product="{$product.embedded_attributes|json_encode}" class="clearfix">
	
{block name='product_features'}
    {if $product.grouped_features}
		{assign 'myArray' [2,3, 6,10]}
        <section class="product-features">
            <dl class="data-sheet">
                {foreach from=$product.grouped_features item=feature}
				{if in_array($feature.id_feature,$myArray)}
                    <dt class="name">{$feature.name}</dt>
                    <dd class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
				{/if}
                {/foreach}
            </dl>
        </section>
    {/if}
{/block}



</div>