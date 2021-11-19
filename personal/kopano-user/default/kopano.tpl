<div class="kopano-wrapper">
  <div class="row">
    <div class="col s12 xl6">
      <h3>{t}Generic{/t}</h3>

      <div class="input-field">
        <input disabled type='text' id="dummy" name="dummy" value="{$mail}">
        <label for="mail">{t}Primary address{/t}</label>
      </div>

      <div class="input-field">
        <input disabled type='text' id="dummy2" name="dummy2" value="{$gosaMailServer}">
        <label for="gosaMailServer">{t}Server{/t}</label>
      </div>
    </div>

    <div class="col s12 xl6">
      <h3>{t}Alternative addresses{/t}</h3>

      {render acl=$gosaMailAlternateAddressACL}
      <div class="input-field">
        <select id="alternates_list" style="width:100%;height:100px;" name="dummy4"
          title="{t}List of alternative mail addresses{/t}" multiple>
          {html_options values=$gosaMailAlternateAddress output=$gosaMailAlternateAddress}
        </select>
      </div>
      {/render}

    </div>
  </div>

  <hr class="divider">

  <div class="row">
    <div class="col s12 xl6">
      <h3>&nbsp;{t}Kopano specific settings{/t}</h3>

      {render acl=$kopanoAccountACL }
      <label>
        <input class="center" id='kopanoAccount' type="checkbox" name="kopanoAccount_posted" value="1" {$kopanoAccount}
          title="{t}Enable Kopano Account for this user{/t}">
        <span>{t}Enable Kopano{/t}</span>
      </label>
      {/render}

      {render acl=$kopanoAdminACL }
      <label>
        <input type="checkbox" name="kopanoAdmin" id="kopanoAdmin" value="1" {$kopanoAdmin}
          onChange="toogleAdminStore()" title="{t}Decide if the current user is an Administrator{/t}">
        <span>{t}Kopano Administrator{/t}</span>
      </label>
      {/render}

      {render acl=$kopanoSharedStoreOnlyACL }
      <label>
        <input type="checkbox" name="kopanoSharedStoreOnly" id="kopanoSharedStoreOnly" value="1"
          {$kopanoSharedStoreOnly} onChange="toogleAdminStore()" title="{t}User is only a shared store{/t}">
        <span>{t}Kopano shared store{/t}</span>
      </label>
      {/render}

      {render acl=$kopanoHiddenACL }
      <label>
        <input id='kopanoHidden' type="checkbox" name="kopanoHidden" value="1" {$kopanoHidden}
          title="{t}Hide from Kopano addressbook{/t}">
        <span>{t}Hide from addressbook{/t}</span>
      </label>
      {/render}

      {render acl=$kopanoQuotaOverrideACL }
      <label>
        <input type="checkbox" name="kopanoQuotaOverride" id="kopanoQuotaOverride" value="1" {$kopanoQuotaOverride}
          onChange="toogleQuotaRules()" title="{t}Override default quota settings{/t}">
        <span>{t}Override default quota{/t}</span>
      </label>
      {/render}

      <label>
        <input type="checkbox" name="kopanoContactAccount" id="kopanoContactAccount" value="1" {$kopanoContactAccount}
          title="{t}Use this account as kopano contact{/t}" onChange="toogleContact()">
        <span>{t}Define as contact{/t}</span>
      </label>
    </div>

    <div class="col s12 xl6">
      <h3>{t}Forward messages to{/t}</h3>

      {render acl=$gosaMailForwardingAddressACL}
      <div class="input-field">
        <select id="gosaMailForwardingAddress" style="width:100%; height:100px;" name="dummy3" multiple>
          {html_options values=$gosaMailForwardingAddress output=$gosaMailForwardingAddress}
        </select>
      </div>
      {/render}

    </div>
  </div>

  <hr class="divider">
  <div class="row">
    <div class="col s12 xl6">
      {render acl=$kopanoQuotaACL}
      <div class="input-field">
        <input type="text" id="kopanoQuotaHard" name="kopanoQuotaHard" {if !$kopanoQuotaOverride} disabled {/if}
          value="{$kopanoQuotaHard}">
        <label for="kopanoQuotaHard">{t}Hard quota size{/t} (MB)</label></td>
      </div>
      {/render}

      {render acl=$kopanoQuotaACL}
      <div class="input-field">
        <input type="text" id="kopanoQuotaSoft" name="kopanoQuotaSoft" {if !$kopanoQuotaOverride} disabled {/if}
          value="{$kopanoQuotaSoft}">
        <label for="kopanoQuotaSoft">{t}Soft quota size{/t} (MB)</label>
      </div>
      {/render}

      {render acl=$kopanoQuotaACL}
      <div class="input-field">
        <input type="text" id="kopanoQuotaWarn" name="kopanoQuotaWarn" {if !$kopanoQuotaOverride} disabled {/if}
          value="{$kopanoQuotaWarn}">
        <label for="kopanoQuotaWarn">{t}Warn quota size{/t} (MB)</label>
      </div>
      {/render}

      {render acl=$kopanoResourceACL}
      <div class="input-field">
        <select size="1" id="kopanoResourceType" name="kopanoResourceType">
          {html_options options=$kopanoResourceType_list selected=$kopanoResourceType}
        </select>
        <label>{t}Resource type{/t}</label>
      </div>
      {/render}

      {render acl=$kopanoResourceACL}
      <div class="input-field">
        <input type="text" id='kopanoResourceCapacity' name="kopanoResourceCapacity" value="{$kopanoResourceCapacity}">
        <label for="kopanoResourceCapacity">{t}Resource capacity{/t}</label>
      </div>
      {/render}
    </div>

    <div class="col s12 xl6">
      <h3>{t}Send as privileges{/t}</h3>

      {render acl=$kopanoSendAsPrivilegeACL}
      <div class="input-field add">
        <select id="kopanoSendAsPrivilege" style="width:100%; height:100px;" name="sendas_list[]" size=15 multiple>
          {html_options values=$kopanoSendAsPrivilege output=$kopanoSendAsPrivilege}
        </select>
        <button class="btn-small" id='add_local_sendas' type="submit" name="add_local_sendas">{t}Add local{/t}</button>
        <button class="btn-small" id='delete_sendas' type="submit" name="delete_sendas">{msgPool
          type=delButton}</button>
      </div>
      {/render}
    </div>
  </div>

  <hr class="divider">

  <div class="row">
    <div class="col s12 xl6">
      <h3>{t}Features{/t}</h3>

      <h4>{t}POP3:{/t}</h4>

      <label>
        <input type="radio" name="pop3" id="popA" value="default" checked>
        <span>{t}Default{/t}</span>
      </label>
      <label>
        <input type="radio" name="pop3" id="popB" value="on" {if in_array("pop3", $kopanoEnabledFeatures)} checked
          {/if}>
        <span>{t}On{/t}</span>
      </label>

      <label>
        <input type="radio" name="pop3" id="popC" value="off" {if in_array("pop3", $kopanoDisabledFeatures)} checked
          {/if}>
        <span>{t}Off{/t}</span>
      </label>

      <h4>{t}IMAP:{/t}</h4>

      <label>
        <input type="radio" name="imap" id="imapA" value="default" checked>
        <span>{t}Default{/t}</span>
      </label>

      <label>
        <input type="radio" name="imap" id="imapB" value="on" {if in_array("imap", $kopanoEnabledFeatures)} checked
          {/if}>
        <span>{t}On{/t}</span>
      </label>

      <label>
        <input type="radio" name="imap" id="imapC" value="off" {if in_array("imap", $kopanoDisabledFeatures)} checked
          {/if}>
        <span>{t}Off{/t}</span>
      </label>

      {if $zpushControl eq 'true'}
      <h4>{t}Z-Push:{/t}</h4>

      <label>
        <input type="radio" name="zpush" id="zpushA" value="on" {if in_array("zpush", $kopanoEnabledFeatures)} checked
          {/if}>
        <span>{t}On{/t}</span>
      </label>

      <label>
        <input type="radio" name="zpush" id="zpushB" value="off" {if in_array("zpush", $kopanoDisabledFeatures)} checked
          {/if}>
        <span>{t}Off{/t}</span>
      </label>
      {/if}
    </div>

    <div class="col s12 xl6">
      <h3>{t}Archive server{/t}</h3>

      <div class="input-field add">
        <select style="width: 200px" size="1" id="choosenArchiveServer" name="choosenArchiveServer">
          {* A selected archive server is not neede simply select the first one *}
          {* {html_options options=$availableArchiveServer selected=$choosenArchiveServerIdentifier} *}
          {html_options options=$availableArchiveServer selected=0}
        </select>
        <button id='add_archive' type="submit" name="add_archive">{t}Add archive server{/t}</button>
      </div>

      <div class="input-field add">
        <select id="archiveServerList" style="width:100%; height:100px;" name="archive_server_list[]" size=15 multiple>
          {html_options values=$kopanoUserArchiveServers output=$kopanoUserArchiveServers}
        </select>
        <button id='delete_archive' type="submit" name="delete_archive">{msgPool type=delButton}</button>
      </div>
    </div>
  </div>
</div>

<input type="hidden" name="kopanoTab" value="kopanoTab">

<script>
  var contactAccount_check = document.getElementById("kopanoContactAccount");
  var admin_check = document.getElementById("kopanoAdmin");
  var sharedStoreOnly_check = document.getElementById("kopanoSharedStoreOnly");
  var quotaOverride_check = document.getElementById("kopanoQuotaOverride");

  var resourceType_combo = document.getElementById("kopanoResourceType");
  var chooseArchiveServer_combo = document.getElementById("choosenArchiveServer");

  var resourceCapacity_line = document.getElementById("kopanoResourceCapacity");
  var quotaHard_line = document.getElementById("kopanoQuotaHard");
  var quotaSoft_line = document.getElementById("kopanoQuotaSoft");
  var quotaWarn_line = document.getElementById("kopanoQuotaWarn");

  var archiveServer_list = document.getElementById("archiveServerList");
  var mailForwardingAddresses_list = document.getElementById("gosaMailForwardingAddress");

  var deleteArchive_btn = document.getElementById("delete_archive");
  var addArchive_btn = document.getElementById("add_archive");

  var popA_rad = document.getElementById("popA");
  var popB_rad = document.getElementById("popB");
  var popC_rad = document.getElementById("popC");

  var imapA_rad = document.getElementById("imapA");
  var imapB_rad = document.getElementById("imapB");
  var imapC_rad = document.getElementById("imapC");


  /*
   * unused fields get deacivated 
   */
  function toogleContact() {
    if (contactAccount_check.checked) {
      admin_check.disabled = true;
      sharedStoreOnly_check.disabled = true;
      quotaOverride_check.disabled = true;

      resourceType_combo.disabled = true;
      chooseArchiveServer_combo.disabled = true;

      resourceCapacity_line.disabled = true;
      quotaHard_line.disabled = true;
      quotaSoft_line.disabled = true;
      quotaWarn_line.disabled = true;

      archiveServer_list.disabled = true;
      mailForwardingAddresses_list.disabled = true;

      deleteArchive_btn.disabled = true;
      addArchive_btn.disabled = true;

      popA.disabled = true;
      popB.disabled = true;
      popC.disabled = true;
      imapA.disabled = true;
      imapB.disabled = true;
      imapC.disabled = true;

    } else {
      if (!sharedStoreOnly_check.checked) admin_check.disabled = false;
      if (!admin_check.checked) sharedStoreOnly_check.disabled = false;

      quotaOverride_check.disabled = false;

      resourceType_combo.disabled = false;
      chooseArchiveServer_combo.disabled = false;

      resourceCapacity_line.disabled = false;

      if (!quotaOverride_check.disabled && quotaOverride_check.checked) {
        quotaHard_line.disabled = false;
        quotaSoft_line.disabled = false;
        quotaWarn_line.disabled = false;
      }

      archiveServer_list.disabled = false;
      mailForwardingAddresses_list.disabled = false;

      deleteArchive_btn.disabled = false;
      addArchive_btn.disabled = false;

      popA.disabled = false;
      popB.disabled = false;
      popC.disabled = false;
      imapA.disabled = false;
      imapB.disabled = false;
      imapC.disabled = false;
    }
  }

  function toogleQuotaRules() {
    if (quotaOverride_check.checked && !quotaOverride_check.disabled) {
      quotaHard_line.disabled = false;
      quotaSoft_line.disabled = false;
      quotaWarn_line.disabled = false;
    } else {
      quotaHard_line.disabled = true;
      quotaSoft_line.disabled = true;
      quotaWarn_line.disabled = true;
    }
  }

  function toogleAdminStore() {
    if (!contactAccount_check.checked) {
      sharedStoreOnly_check.disabled = (admin_check.checked) ? true : false;
      admin_check.disabled = (sharedStoreOnly_check.checked) ? true : false;
    }
  }

  toogleContact();
  toogleQuotaRules();
  toogleAdminStore();

</script>