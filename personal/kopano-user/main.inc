<?php
/*
   This code is part of GOsa (https://gosa.gonicus.de)
   Copyright (C) 2003  Cajus Pollmeier

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */


/* Remove locks created by this plugin
*/
$lock_msg="";
if ($remove_lock || isset($_POST['edit_cancel']))
{
    if(session::is_set('kopanoAccount') && session::is_set('edit'))
    {
        del_lock($ui->dn);
    }
}

/* Remove this plugin from session
*/
if ( $cleanup )
{
    session::un_set('kopanoAccount');
    session::un_set('edit');
}
else
{
    /* Reset requested? */
    if(isset($_POST['edit_cancel']))
    {
        session::un_set ('edit');
        session::un_set ('kopanoAccount');
    }

    /* Create mail object on demand */
    if(!session::is_set('kopanoAccount') ||
       (isset($_GET['reset']) && $_GET['reset'] == 1))
    {
        $kopanoAccount= new kopanoAccount ($config, $ui->dn);
        $kopanoAccount->enable_CSN_check();
        $kopanoAccount->set_acl_base($ui->dn);
        $kopanoAccount->set_acl_category("users");
        session::set('kopanoAccount',$kopanoAccount);
    }

    $kopanoAccount = session::get('kopanoAccount');

    /* save changes back to object */
    if (session::is_set('edit'))
    {
        $kopanoAccount->save_object ();
    }

    /* Enter edit mode? */
    if (isset($_POST['edit']) && preg_match("/r/",$ui->get_permissions($ui->dn,"users/kopanoAccount")))
    {
        /* Check locking */
        if (($username= get_lock($ui->dn)) != "")
        {
            session::set('back_plugin',$plug);
            session::set('LOCK_VARS_TO_USE',array("/^edit$/","/^plug$/"));
            $lock_msg =  gen_locked_message ($username, $ui->dn);
        }
        else
       {
            /* Lock the current entry */
            add_lock ($ui->dn, $ui->dn);
            session::set('edit',TRUE);
        }
    }

    /* save changes to LDAP and disable edit mode */
    if (isset($_POST['edit_finish']))
    {
        /* Perform checks */
        $message= $kopanoAccount->check();

        /* No errors, save object */
        if (count ($message) == 0)
        {
            $kopanoAccount->save ();
            del_lock ($ui->dn);
            session::un_set ('edit');

            /* Remove object */
            session::un_set ('kopanoAccount');
        }
        else
       {
            /* Errors found, show message */
            msg_dialog::displayChecks($message);
        }
    }

    /* Execute formular */
    if($lock_msg)
    {
        $display.= $lock_msg;
    }else{
        $display.= $kopanoAccount->execute ();
    }

    /* Store changes  in session */
    if (session::is_set('edit'))
    {
        session::set('kopanoAccount',$kopanoAccount);
    }

    $info= "";
    /* Show page footer depending on the mode */
    if (!$kopanoAccount->dialog && $kopanoAccount->is_account && empty($lock_msg))
    {
        $display.= "<p class=\"plugbottom\">";

        /* Are we in edit mode? */
        if (session::is_set('edit'))
        {
            $display.= "<input type=submit name=\"edit_finish\" style=\"width:80px\" value=\"".msgPool::okButton()."\">\n";
            $display.= "&nbsp;";
            $display.= "<input type=submit name=\"edit_cancel\" value=\"".msgPool::cancelButton()."\">\n";
            $info= "<img alt=\"\" align=\"middle\" src=\"".get_template_path('images/lists/locked.png').
                   "\"> ".$ui->dn."&nbsp;";
        }
        else
       {
            $info= "<img alt=\"\" align=\"middle\" src=\"".get_template_path('images/lists/unlocked.png').
                   "\"> ".$ui->dn."&nbsp;";

            $info.= "<img alt=\"\" align=\"middle\" src=\"".get_template_path('images/lists/on.png').
                    "\"> ".msgPool::clickEditToChange();

            if(preg_match("/r/",$ui->get_permissions($ui->dn,"users/kopanoAccount")))
            {
                $display.= "<input type=submit name=\"edit\" value=\"".msgPool::editButton()."\">\n";
            }

            $display.= "<input type=\"hidden\" name=\"ignore\">\n";
        }
        $display.= "</p>\n";
    }

    /* Page header*/
    $display= print_header(get_template_path('plugins/kopano/images/kopano.png'), _("User kopano settings"), $info).$display;
}

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
