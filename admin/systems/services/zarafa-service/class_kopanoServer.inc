<?php

/*
 * This plugin will add some new functionallity to
 * manage your kopano -server/s.
 */
class kopanoServer extends goService
{
    //needed ldap attributes
    var $attributes = array("kopanoAccount", "kopanoHidden", "kopanoHttpPort", "kopanoSslPort", "kopanoFilePath",
                            "kopanoContainsPublic", "goKopanoArchiveServer");

    //needed ldap object classes
    var $objectclasses = array("kopano-server", "goKopanoAddons");

    //various other member
    var $plHeadline = "Kopano server plugin";
    var $plDescrition = "Kopano server settings";
    var $DisplayName = "Kopano server";

    //boolean attributes
    var $kopanoAccount = 0;
    var $kopanoHidden = 0;
    var $kopanoContainsPublic = 0;
    var $goKopanoArchiveServer = 0;
    //integer attributes
    var $kopanoHttpPort = 80;
    var $kopanoSslPort = 443;

    //string attributes
    var $kopanoFilePath = "";

    var $count;

    /*
     * Constructor
     */
    public function __construct(&$config, $dn = NULL)
    {
        goService::__construct($config, $dn);
        $this->config = $config;
        $this->DisplayName = _("Kopano server");
    }

    public function execute()
    {
        //get smarty engine and assign smarty variables
        $smarty = get_smarty();

        $smarty->assign("kopanoAccount", ($this->kopanoAccount)?"checked":"");
        $smarty->assign("kopanoHidden", ($this->kopanoHidden)?"checked":"");
        $smarty->assign("kopanoHttpPort", $this->kopanoHttpPort);
        $smarty->assign("kopanoSslPort", $this->kopanoSslPort);
        $smarty->assign("kopanoContainsPublic", ($this->kopanoContainsPublic)?"checked":"");
        $smarty->assign("kopanoFilePath", $this->kopanoFilePath);
        $smarty->assign("goKopanoArchiveServer", ($this->goKopanoArchiveServer)?"checked":"");

        return($smarty->fetch(get_template_path('kopanoServer.tpl', TRUE, dirname(__FILE__))));
    }

    /*
     * Add the kopano service entry to the services list
     */
    public function getListEntry()
    {
        $fields = goService::getListEntry();
        $fields['Message']    = _("Kopano service");
        #$fields['AllowEdit']  = false;
        return($fields);
    }

    public function save_object()
    {
        if(!isset($_POST['kopano-server-plugin']))
        {
            return;
        }

        goService::save_object();

        //transform checkboxes to 1 or 0
        foreach(array("kopanoAccount", "kopanoHidden", "kopanoContainsPublic", "goKopanoArchiveServer") as $val)
        {
            if(isset($_POST[$val]))
            {
                $this->$val = 1;
            }
            else
          {
               $this->$val = 0;
            }
        }
    }

    /*
     * Save values to ldap
     */
    public function save()
    {
        //call parent implementation
        goService::save();

        //get ldap link
        $ldap= $this->config->get_ldap_link();

        /* Save data to LDAP */
        $ldap->cd($this->dn);
        $this->cleanup();
        $ldap->modify($this->attrs);

        if(!$ldap->success())
            msg_dialog::display(_("LDAP error"), msgPool::ldaperror($ldap->get_error(), $this->dn, LDAP_MOD, __CLASS__));
    }

    /* Return plugin informations for acl handling */
    static function plInfo()
    {
        return (array(
                    "plShortName"   => _("Kopano"),
                    "plDescription" => _("kopano service")." ("._("Services").")",
                    "plSelfModify"  => FALSE,
                    "plDepends"     => array(),
                    "plPriority"    => 100,
                    "plSection"     => array("administration"),
                    "plCategory"    => array("server"),

                    "plProvidedAcls"=> array(
                            "start"                 => _("Start"),
                            "stop"                  => _("Stop"),
                            "restart"               => _("Restart"),
                            "kopanoAccount"         => _("Kopano server"),
                            "kopanoHidden"          => _("Kopano hidden"),
                            "kopanoHttpPort"        => _("Kopano HTTP port"),
                            "kopanoSslPort"         => _("Kopano SSL port"),
                            "kopanoConatinsPublic"  => _("Kopano node contains public store"),
                            "kopanoFilePath"        => _("Kopano file path"),
                            "goKopanoArchiveServer" => _("Kopano Archvie Server"),
                        )
                    ));
    }
}
