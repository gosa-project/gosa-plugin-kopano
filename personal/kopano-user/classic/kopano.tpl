<table summary="" style="width:100%;">
  <tbody>
    <tr>
      <td style="width:50%;">
        <h3>&nbsp;{t}Generic{/t}</h3>
        <table>
          <tbody>
            <tr>
              <td>
                <label for="mail">{t}Primary address{/t}</label>
              </td>
              <td>
                <input disabled type='text' id="dummy" name="dummy" value="{$mail}">
              </td>
            </tr>
            <tr>
              <td>
                <label for="gosaMailServer">{t}Server{/t}</label>
              </td>
              <td>
                <input disabled type='text' id="dummy2" name="dummy2" value="{$gosaMailServer}">
              </td>
            </tr>
          </tbody>
        </table>
      </td>
      <td class="left-border">&nbsp;</td>
      <td>
        <h3><label for="alternates_list"> {t}Alternative addresses{/t}</label></h3>
        {render acl=$gosaMailAlternateAddressACL}
        <select id="alternates_list" style="width:100%;height:100px;" name="dummy4"
        title="{t}List of alternative mail addresses{/t}" multiple>
        {html_options values=$gosaMailAlternateAddress output=$gosaMailAlternateAddress}
        <option disabled>&nbsp;</option>
        </select>
        {/render}
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <hr/>
      </td>
    </tr>
    <tr>
      <td>
        <h3>&nbsp;{t}Kopano specific settings{/t}</h3>
        {render acl=$kopanoAccountACL }
        <input class="center" id='kopanoAccount'
        type="checkbox" name="kopanoAccount_posted" value="1" {$kopanoAccount} 
        title="{t}Enable Kopano Account for this user{/t}"> {t}Enable Kopano{/t}
        {/render}
        <br/>
        {render acl=$kopanoAdminACL }
        <input type="checkbox" name="kopanoAdmin" id="kopanoAdmin" value="1" {$kopanoAdmin} onChange="toogleAdminStore()"
        title="{t}Decide if the current user is an Administrator{/t}"> {t}Kopano Administrator{/t}</input>
        {/render}
        <br/>
        {render acl=$kopanoSharedStoreOnlyACL }
        <input type="checkbox" name="kopanoSharedStoreOnly" id="kopanoSharedStoreOnly" value="1" {$kopanoSharedStoreOnly}  onChange="toogleAdminStore()"
        title="{t}User is only a shared store{/t}"> {t}Kopano shared store{/t}</input>
        {/render}
        <br/>
        {render acl=$kopanoHiddenACL }
        <input id='kopanoHidden'
        type="checkbox" name="kopanoHidden" value="1" {$kopanoHidden}
        title="{t}Hide from Kopano addressbook{/t}"> {t}Hide from addressbook{/t}
        {/render}
        <br>
        {render acl=$kopanoQuotaOverrideACL }
        <input type="checkbox" name="kopanoQuotaOverride" id="kopanoQuotaOverride" value="1" {$kopanoQuotaOverride} onChange="toogleQuotaRules()"
        title="{t}Override default quota settings{/t}"> {t}Override default quota{/t}</input>
        {/render}
        <br/>
        <input type="checkbox" name="kopanoContactAccount" id="kopanoContactAccount" value="1" {$kopanoContactAccount}
        title="{t}Use this account as kopano contact{/t}" onChange="toogleContact()"> {t}Define as contact{/t}</input>
        <br/>
      </td>
      <td class="left-border">&nbsp;</td>
      <td>
        <h3><label for="forwarder_list">{t}Forward messages to{/t}</label></h3>
        {render acl=$gosaMailForwardingAddressACL}
        <select id="gosaMailForwardingAddress" style="width:100%; height:100px;" name="dummy3" multiple>
        {html_options values=$gosaMailForwardingAddress output=$gosaMailForwardingAddress}
        <option disabled>&nbsp;</option>
        </select>
        {/render}
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <hr/>
      </td>
    </tr>
    <tr>
      <td>
        <table>
          <tr>
            <td><label for="kopanoQuotaHard">{t}Hard quota size{/t}</label></td>
            <td>
              {render acl=$kopanoQuotaACL}
                <input type="text" id="kopanoQuotaHard" name="kopanoQuotaHard" {if !$kopanoQuotaOverride} disabled {/if} value="{$kopanoQuotaHard}"> MB
              {/render}
            </td>
          </tr>
          <tr>
            <td><label for="kopanoQuotaSoft">{t}Soft quota size{/t}</label></td>
            <td>
              {render acl=$kopanoQuotaACL}
              <input  type="text"  id="kopanoQuotaSoft" name="kopanoQuotaSoft" {if !$kopanoQuotaOverride} disabled {/if} value="{$kopanoQuotaSoft}"> MB
              {/render}
            </td>
          </tr>
          <tr>
            <td><label for="kopanoQuotaWarn">{t}Warn quota size{/t}</label></td>
            <td>
              {render acl=$kopanoQuotaACL}
                <input  type="text" id="kopanoQuotaWarn" name="kopanoQuotaWarn" {if !$kopanoQuotaOverride} disabled {/if} value="{$kopanoQuotaWarn}"> MB
              {/render}
            </td>
          </tr>
          <tr>
            <td><label for="kopanoResourceType">{t}Resource type{/t}</label></td>
            <td>
              {render acl=$kopanoResourceACL}
                <select size="1" id="kopanoResourceType" name="kopanoResourceType">
                  {html_options options=$kopanoResourceType_list selected=$kopanoResourceType}
                </select>
              {/render}
            </td>
          </tr>
          <tr>
            <td><label for="kopanoResourceCapacity">{t}Resource capacity{/t}</label></td>
            <td>
              {render acl=$kopanoResourceACL}
                <input type="text" id='kopanoResourceCapacity'
                name="kopanoResourceCapacity" value="{$kopanoResourceCapacity}">
              {/render}
            </td>
          </tr>
        </table>
      </td>
      <td class="left-border">&nbsp;</td>
      <td>
        <h3><label for="sendas_list">{t}Send as privileges{/t}</label></h3>
        {render acl=$kopanoSendAsPrivilegeACL}
           <select 
          id="kopanoSendAsPrivilege" style="width:100%; height:100px;" name="sendas_list[]" size=15 multiple>
          {html_options values=$kopanoSendAsPrivilege output=$kopanoSendAsPrivilege}
          <option disabled>&nbsp;</option>
           </select>
        {/render}
          <br/>
        {render acl=$kopanoSendAsPrivilegeACL}
          <input id='add_local_sendas' type="submit" value="{t}Add local{/t}" name="add_local_sendas"/>&nbsp;
        {/render}
        {render acl=$kopanoSendAsPrivilegeACL}
          <input id='delete_sendas' type="submit" value="{msgPool type=delButton}" name="delete_sendas"/>
        {/render}
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <hr/>
      </td>
    </tr>
    <tr>
      <td>
        <h2>{t}Features{/t}</h2>
        <table>
          <tr>
            <td>
              {t}POP3:{/t}
              <input type="radio" name="pop3" id="popA" value="default" checked >{t}Default{/t}</input>
              <input type="radio" name="pop3" id="popB"value="on" {if in_array("pop3", $kopanoEnabledFeatures)} checked {/if}>{t}On{/t}</input>
              <input type="radio" name="pop3" id="popC"value="off" {if in_array("pop3", $kopanoDisabledFeatures)} checked {/if}>{t}Off{/t}</input>
            </td>
          </tr>
          <tr>
            <td>
              {t}IMAP:{/t}
              <input type="radio" name="imap" id="imapA" value="default" checked >{t}Default{/t}</input>
              <input type="radio" name="imap" id="imapB" value="on" {if in_array("imap", $kopanoEnabledFeatures)} checked {/if}>{t}On{/t}</input>
              <input type="radio" name="imap" id="imapC" value="off" {if in_array("imap", $kopanoDisabledFeatures)} checked {/if}>{t}Off{/t}</input>
            </td>
          </tr>
          {if $zpushControl eq 'true'}
          <tr>
            <td>
              {t}Z-Push:{/t}
              <input type="radio" name="zpush" id="zpushA" value="on" {if in_array("zpush", $kopanoEnabledFeatures)} checked {/if}>{t}On{/t}</input>
              <input type="radio" name="zpush" id="zpushB" value="off" {if in_array("zpush", $kopanoDisabledFeatures)} checked {/if}>{t}Off{/t}</input>
            </td>
          </tr>
          {/if}
        </table>
      </td>
      <td class="left-border">&nbsp;</td>
      <td>
        <label for="choosenArchiveServer">{t}Archive server{/t}</label>
        <select style="width: 200px" size="1" id="choosenArchiveServer" name="choosenArchiveServer">
          {* A selected archive server is not neede simply select the first one *}
          {* {html_options options=$availableArchiveServer selected=$choosenArchiveServerIdentifier} *}
          {html_options options=$availableArchiveServer selected=0}
        </select>
        <input id='add_archive' type="submit" value="{t}Add archive server{/t}" name="add_archive" />
        <br/>
        <select id="archiveServerList" style="width:100%; height:100px;" name="archive_server_list[]" size=15 multiple>
          {html_options values=$kopanoUserArchiveServers output=$kopanoUserArchiveServers}
          <option disabled>&nbsp;</option>
        </select>
        <br/>
        <input id='delete_archive' type="submit" value="{msgPool type=delButton}" name="delete_archive"/>
      </td>
    </tr>
  </tbody>
</table>

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
  function toogleContact(){
    if(contactAccount_check.checked){
      admin_check.disabled           = true; 
      sharedStoreOnly_check.disabled = true; 
      quotaOverride_check.disabled   = true; 

      resourceType_combo.disabled        = true;
      chooseArchiveServer_combo.disabled = true;

      resourceCapacity_line.disabled = true;
      quotaHard_line.disabled        = true;
      quotaSoft_line.disabled        = true;
      quotaWarn_line.disabled        = true;

      archiveServer_list.disabled           = true;
      mailForwardingAddresses_list.disabled = true;

      deleteArchive_btn.disabled = true;
      addArchive_btn.disabled    = true;

      popA.disabled = true;
      popB.disabled = true;
      popC.disabled = true;
      imapA.disabled = true;
      imapB.disabled = true;
      imapC.disabled = true;

    } else {
      if(!sharedStoreOnly_check.checked)admin_check.disabled = false; 
      if(!admin_check.checked)sharedStoreOnly_check.disabled = false; 

      quotaOverride_check.disabled   = false;

      resourceType_combo.disabled        = false;
      chooseArchiveServer_combo.disabled = false;

      resourceCapacity_line.disabled = false;

      if(!quotaOverride_check.disabled && quotaOverride_check.checked){        
        quotaHard_line.disabled        = false;
        quotaSoft_line.disabled        = false;
        quotaWarn_line.disabled        = false;
      }

      archiveServer_list.disabled           = false;
      mailForwardingAddresses_list.disabled = false;

      deleteArchive_btn.disabled = false;
      addArchive_btn.disabled    = false;

      popA.disabled = false;
      popB.disabled = false;
      popC.disabled = false;
      imapA.disabled = false;
      imapB.disabled = false;
      imapC.disabled = false;
    }
  }

  function toogleQuotaRules(){
    if(quotaOverride_check.checked && !quotaOverride_check.disabled){
      quotaHard_line.disabled = false;
      quotaSoft_line.disabled = false;
      quotaWarn_line.disabled = false;
    } else {
      quotaHard_line.disabled = true;
      quotaSoft_line.disabled = true;
      quotaWarn_line.disabled = true;
    }
  }

  function toogleAdminStore(){
    if(!contactAccount_check.checked){
      sharedStoreOnly_check.disabled = (admin_check.checked) ? true : false;
      admin_check.disabled = (sharedStoreOnly_check.checked) ? true : false;
    }
  }

  toogleContact();
  toogleQuotaRules();
  toogleAdminStore();
  
</script>

