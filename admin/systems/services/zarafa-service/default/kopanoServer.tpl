<div class="kopanoServer-wrapper">
    <div class="row">
        <div class="col s12 xl6">
            <h3>Kopano server settings</h3>

            <label>
                <input type="checkbox" name="kopanoAccount" id="kopanoAccount" value="1" {$kopanoAccount}
                    title="{t}Make this server a Kopano-server{/t}">
                <span>{t}Enable Kopano service{/t}</span>
            </label>

            <label>
                <input type="checkbox" name="kopanoHidden" id="kopanoHidden" value="1" {$kopanoHidden}
                    title="{t}Hide server from address book. Administrators will see it anyway{/t}">
                <span>{t}Hide server from address book{/t}</span>
            </label>

            {assign var="publicStoreText" value="Enable public store on this server
            (On a multi - server configuration keep in mind only one node is allowed to enable this feature)"}

            <label>
                <input type="checkbox" name="kopanoContainsPublic" id="kopanoContainsPublic" value="1"
                    {$kopanoContainsPublic} title="{t}{$publicStoreText}{/t}">
                <span>{t}Enable public store{/t}</span>
            </label>

            <label>
                <input type="checkbox" name="goKopanoArchiveServer" id="goKopanoAchriveServer" value="1"
                    {$goKopanoArchiveServer} title="{t}Make this server a Kopano-archive-server{/t}">
                <span>{t}Set archive server{/t}</span>
            </label>

            <table>
                <thead>
                    <tr>
                        <th>HTTP Port:</th>
                        <th>SSL Port:</th>
                        <th>Kopano file path:</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input type="text" id="kopanoHttpPort" name="kopanoHttpPort" value="{$kopanoHttpPort}">
                        </td>
                        <td>
                            <input type="text" id="kopanoSslPort" name="kopanoSslPort" value="{$kopanoSslPort}">
                        </td>
                        <td>
                            <input type="text" id="kopanoFilePath" name="kopanoFilePath" value="{$kopanoFilePath}">
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
</div>

<input type='hidden' name='kopano-server-plugin' value='1' />

<div class="card-action">
    <button class="btn-small primary" type='submit' name='SaveService'>{msgPool type=saveButton}</button>
    <button class="btn-small primary" type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>