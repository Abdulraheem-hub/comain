
<div class="col-sm-8">
    <section class="contact-form">
        <form action="{$urls.pages.contact}" method="post"
              {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>

            {if $notifications}
                <div class="col-xs-12 alert {if isset($notifications.nw_error) && $notifications.nw_error}alert-danger{else}alert-success{/if}">
                    <ul>
                        {foreach $notifications.messages as $notif}
                            <li>{$notif}</li>
                        {/foreach}
                    </ul>
                </div>
            {/if}

            <section class="form-fields">

                <div class="form-group row">
                    <div class="col-md-9 col-md-offset-3">
                        <h4>{l s='Contact us' d='Shop.Theme.Global'}</h4>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-md-3 form-control-label" for="id_contact">{l s='Subject' d='Shop.Forms.Labels'}</label>
                    <div class="col-md-6">
                        <select name="id_contact"  id="id_contact"  class="form-control form-control-select">
                            {foreach from=$contact.contacts item=contact_elt}
                                <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-md-3 form-control-label" for="email">{l s='Email address' d='Shop.Forms.Labels'}</label>
                    <div class="col-md-6">
                        <input
                                class="form-control"
                                id="email"
                                name="from"
                                type="email"
                                value="{$contact.email}"
                                placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
                        >
                    </div>
                </div>

                {if $contact.orders}
                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="id-order">{l s='Order reference' d='Shop.Forms.Labels'}</label>
                        <div class="col-md-6">
                            <select id="id-order" name="id_order" class="form-control form-control-select">
                                <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
                                {foreach from=$contact.orders item=order}
                                    <option value="{$order.id_order}">{$order.reference}</option>
                                {/foreach}
                            </select>
                        </div>
                        <span class="col-md-3 form-control-comment">
            {l s='optional' d='Shop.Forms.Help'}
          </span>
                    </div>
                {/if}

                {if $contact.allow_file_upload}
                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="file-upload">{l s='Attachment' d='Shop.Forms.Labels'}</label>
                        <div class="col-md-6">
                            <input id="file-upload" type="file" name="fileUpload" class="filestyle" data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
                        </div>
                        <span class="col-md-3 form-control-comment">
            {l s='optional' d='Shop.Forms.Help'}
          </span>
                    </div>
                {/if}

                <div class="form-group row">
                    <label class="col-md-3 form-control-label" for="contactform-message">{l s='Message' d='Shop.Forms.Labels'}</label>
                    <div class="col-md-9">
          <textarea
                  class="form-control"
                  name="message"
                  id="contactform-message"
                  placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
                  rows="3"
          >{if $contact.message}{$contact.message}{/if}</textarea>
                    </div>
                </div>
                {if isset($id_module)}
                <div class="form-group row">
                    <div class="offset-md-3 col-md-9">
                {hook h='displayGDPRConsent' id_module=$id_module}
                    </div>   </div>
                {/if}
            {hook h='displayPaCaptcha' posTo='contact'}</section>

            <footer class="form-footer text-right">
                <style>
                    input[name=url] {
                        display: none !important;
                    }
                </style>
                <input type="text" name="url" value=""/>
                <input type="hidden" name="token" value="{$token}" />
                <input class="btn btn-primary" type="submit" name="submitMessage"
                       value="{l s='Send' d='Shop.Theme.Actions'}">
            </footer>

        </form>
    </section>
</div>
