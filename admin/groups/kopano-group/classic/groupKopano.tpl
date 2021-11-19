<input type="hidden" name='kopanoedit' value='1'>
<table summary="" style="width:100%; vertical-align:top; text-align:left;" cellpadding="0" border="0">
  <tr>
    <td style="width:50%;">
      <h3>{t}Kopano Settings{/t}</h3>
      <input class="center" id='kopanoAccount' type=checkbox name="kopanoAccount" {$kopanoAccount}
        title="{t}Enable Kopano Account for this group{/t}"> {t}Enable Kopano{/t}
      <br>
      {render acl=$kopanoSecurityGroupACL}
      <input class="center" id='kopanoSecurityGroup' type=checkbox name="kopanoSecurityGroup" {$kopanoSecurityGroup}
        title="{t}Make this group a Kopano Securitygroup{/t}"> {t}Kopano Securitygroup{/t}
      {/render}
      <br>
      {render acl=$kopanoHiddenACL}
      <input class="center" id='kopanoHidden' type=checkbox name="kopanoHidden" {$kopanoHidden}
        title="{t}Hide from Kopano addressbook{/t}"> {t}Hide from addressbook{/t}
      {/render}
    </td>
    <td class="left-border">&nbsp;</td>
    <td>
      <h3><label for="alternates_list"> {t}Alternative addresses{/t}</label></h3>
      {render acl=$gosaMailAlternateAddressACL}
      <select id="alternates_list" name="dummy1" style="width:100%;height:100px;" multiple
        title="{t}List of alternative mail addresses{/t}">
        {html_options values=$gosaMailAlternateAddress output=$gosaMailAlternateAddress}
        <option disabled>&nbsp;</option>
        {/render}
      </select>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr />
    </td>
  </tr>
  <tr>
    <td>
      <h3>{t}Send as privileges{/t}</h3>
      {render acl=$kopanoSendAsPrivilegeACL}
      <select id="kopanoSendAsPrivilege" name="sendas_list[]" style="width:100%;height:100px;" multiple>
        {html_options values=$kopanoSendAsPrivilege output=$kopanoSendAsPrivilege}
        <option disabled>&nbsp;</option>
      </select>
      {/render}
      <br />
      {render acl=$kopanoSendAsPrivilegeACL}
      <input id='add_local_sendas' type="submit" value="{t}Add local{/t}" name="add_local_sendas">&nbsp;
      {/render}
      {render acl=$kopanoSendAsPrivilegeACL}
      <input id='delete_sendas' type="submit" value="{msgPool type=delButton}" name="delete_sendas">
      {/render}
    </td>
    <td class="left-border">&nbsp;</td>
    <td>
      <h3><label for="forwarding_list"> {t}Forwarding addresses{/t}</label></h3>
      {render acl=$gosaMailAlternateAddressACL}
      <select id="forwarding_list" name="dummyForwarding" style="width:100%;height:100px;" multiple
        title="{t}List of forwarding mail addresses{/t}">
        {html_options values=$gosaMailForwardingAddress output=$gosaMailForwardingAddress}
        <option disabled>&nbsp;</option>
        {/render}
      </select>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr />
    </td>
  </tr>
  <tr>
    <td>
      <h3>{t}Kopano group members{/t}</h3>
      {$memberList}
      {render acl=$kopanoSendAsPrivilegeACL}
      <input id='add_kopano_member' type="submit" value="{t}Add{/t}" name="add_kopano_member">&nbsp;
      {/render}
    </td>
    <td class="left-border">&nbsp;</td>
  </tr>
</table>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  // First input field on page
  focus_field('mail');

  function changeStates() {
    if ($('kopanoSecurityGroup').checked) {
      $("gosaMailForwardingAddress", "gosaMailAlternateAddress").invoke("disable");
    }
  }

  changeStates();

</script>