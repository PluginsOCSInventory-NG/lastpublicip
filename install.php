<?php

/**
 * This function is called on installation and is used to create database schema for the plugin
 */
function extension_install_lastpublicip()
{
    $commonObject = new ExtensionCommon;

    $commonObject -> sqlQuery("CREATE TABLE lastpublicip (ID INTEGER NOT NULL AUTO_INCREMENT, HARDWARE_ID INTEGER NOT NULL,
                                IP VARCHAR(255) NOT NULL,
                                CITY VARCHAR(255) NOT NULL,
                                ORG VARCHAR(255) DEFAULT NULL,
                                PRIMARY KEY (ID,HARDWARE_ID)) ENGINE=INNODB;");
}

/**
 * This function is called on removal and is used to destroy database schema for the plugin
 */
function extension_delete_lastpublicip()
{
    $commonObject = new ExtensionCommon;
    $commonObject -> sqlQuery("DROP TABLE IF EXISTS `lastpublicip`");
}

/**
 * This function is called on plugin upgrade
 */
function extension_upgrade_lastpublicip()
{

}
