/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.redress.core;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigFileReader {

    public ConfigParam getConfigParam() {
        ConfigParam configParam = new ConfigParam();

        Properties prop = new Properties();
        String propFileName = "redress_config.properties";
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

        if (inputStream != null) {
            try {
                prop.load(inputStream); 

                String userid = prop.getProperty("userid");
                String password = prop.getProperty("password");
                String host = prop.getProperty("host");
                String port = prop.getProperty("port");
                String dbName = prop.getProperty("dbName");

                configParam.setDbName(dbName);
                configParam.setHost(host);
                configParam.setPassword(password);
                configParam.setPort(port);
                configParam.setUserid(userid);
            } catch (IOException ex) {
                ex.printStackTrace();
            }

        } else {

        }

        return configParam;
    }

}
