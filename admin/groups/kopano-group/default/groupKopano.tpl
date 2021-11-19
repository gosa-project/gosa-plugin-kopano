<input type="hidden" name='kopanoedit' value='1'>
<div class="kopano-wrapper">
  <div class="row">
    <div class="col s12 xl6">
      <h3>{t}Kopano Settings{/t}</h3>

      <label>
        <input class="center" id='kopanoAccount' type=checkbox name="kopanoAccount" {$kopanoAccount}
          title="{t}Enable Kopano Account for this group{/t}">
        <span>{t}Enable Kopano{/t}</span>
      </label>

      {render acl=$kopanoSecurityGroupACL}
      <label>
        <input class="center" id='kopanoSecurityGroup' type=checkbox name="kopanoSecurityGroup" {$kopanoSecurityGroup}
          title="{t}Make this group a Kopano Securitygroup{/t}">
        <span>{t}Kopano Securitygroup{/t}</span>
      </label>
      {/render}

      {render acl=$kopanoHiddenACL}
      <label>
        <input class="center" id='kopanoHidden' type=checkbox name="kopanoHidden" {$kopanoHidden}
          title="{t}Hide from Kopano addressbook{/t}">
        <span>{t}Hide from addressbook{/t}</span>
      </label>
      {/render}
    </div>

    <div class="col s12 xl6">
      <h3>{t}Alternative addresses{/t}<h3>

          {render acl=$gosaMailAlternateAddressACL}
          <div class="input-field">
            <select id="alternates_list" name="dummy1" style="width:100%;height:100px;" multiple
              title="{t}List of alternative mail addresses{/t}">
              {html_options values=$gosaMailAlternateAddress output=$gosaMailAlternateAddress}
            </select>
          </div>
          {/render}
    </div>
  </div>

  <div class="row">
    <div class="col s12 xl6">
      <h3>{t}Send as privileges{/t}</h3>

      {render acl=$kopanoSendAsPrivilegeACL}
      <div class="input-field add">
        <select id="kopanoSendAsPrivilege" name="sendas_list[]" style="width:100%;height:100px;" multiple>
          {html_options values=$kopanoSendAsPrivilege output=$kopanoSendAsPrivilege}
        </select>
        <button class="btn-small" id='add_local_sendas' type="submit" name="add_local_sendas">{t}Add local{/t}</button>
        <button class="btn-small" id='delete_sendas' type="submit" name="delete_sendas">{msgPool type=delButton}</button>
      </div>
      {/render}
    </div>

    <div class="col s12 xl6">
      <h3>{t}Forwarding addresses{/t}</h3>

      {render acl=$gosaMailAlternateAddressACL}
      <div class="input-field">
        <select id="forwarding_list" name="dummyForwarding" style="width:100%;height:100px;" multiple
          title="{t}List of forwarding mail addresses{/t}">
          {html_options values=$gosaMailForwardingAddress output=$gosaMailForwardingAddress}
        </select>
      </div>
      {/render}
    </div>
  </div>

  <div class="row">
    <div class="col s12 xl6">
      <h3>{t}Kopano group members{/t}</h3>

      {$memberList}

      {render acl=$kopanoSendAsPrivilegeACL}
      <button class="btn-small" id='add_kopano_member' type="submit" name="add_kopano_member">{t}Add{/t}</button>
      {/render}

    </div>
  </div>
</div>

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