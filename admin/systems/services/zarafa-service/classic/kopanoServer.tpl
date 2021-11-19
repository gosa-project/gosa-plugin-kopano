<table summary="" style="width:100%; vertical-align:top; text-align:left;" cellpadding="0" border="0">
    <tr>
        <td>
            <h3>Kopano server settings</h3>
            <br />
            <input type="checkbox" name="kopanoAccount" id="kopanoAccount" value="1" {$kopanoAccount}
                title="{t}Make this server a Kopano-server{/t}"> {t}Enable Kopano service{/t}
            <br />
            <input type="checkbox" name="kopanoHidden" id="kopanoHidden" value="1" {$kopanoHidden}
                title="{t}Hide server from address book. Administrators will see it anyway{/t}"> {t}Hide server from
            address book{/t}
            <br />
            {assign var="publicStoreText"
            value="Enable public store on this server (On a multi - server configuration keep in mind only one node is
            allowed to enable this feature)"}
            <input type="checkbox" name="kopanoContainsPublic" id="kopanoContainsPublic" value="1"
                {$kopanoContainsPublic} title="{t}{$publicStoreText}{/t}"> {t}Enable public store{/t}
            <br />
            <input type="checkbox" name="goKopanoArchiveServer" id="goKopanoAchriveServer" value="1"
                {$goKopanoArchiveServer} title="{t}Make this server a Kopano-archive-server{/t}"> {t}Set archive
            server{/t}
        </td>
        <td class="left-border">&nbsp;</td>
        <td>
            <table>
                <tr>
                    <td>
                        HTTP Port:
                    </td>
                    <td>
                        <input type="text" id="kopanoHttpPort" name="kopanoHttpPort" value="{$kopanoHttpPort}">
                    </td>
                </tr>
                <tr>
                    <td>
                        SSL Port:
                    </td>
                    <td>
                        <input type="text" id="kopanoSslPort" name="kopanoSslPort" value="{$kopanoSslPort}">
                    </td>
                </tr>
                <tr>
                    <td>
                        Kopano file path:
                    </td>
                    <td>
                        <input type="text" id="kopanoFilePath" name="kopanoFilePath" value="{$kopanoFilePath}">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <hr />
        </td>
    </tr>
</table>

<div class="plugin-actions">
    <button type='submit' name='SaveService'>{msgPool type=saveButton}</button>
    <button type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
    <input type='hidden' name='kopano-server-plugin' value='1' />
</div>