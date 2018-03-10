package cn.com.retrans.utils;

import org.apache.commons.lang.StringUtils;

import java.io.*;
import java.util.*;

public class PropertiesUtil
{
  public static String CONFIG_PROPERTIES = "conf.properties";

  private static Map<String, Properties> propMap = Collections.synchronizedMap(new HashMap());

  private static Properties properties = null;

  static {
    properties = getProperties(CONFIG_PROPERTIES);
  }

  public static Properties loadProperties(String filename)
  {
    if (propMap.containsKey(filename)) {
      return ((Properties)propMap.get(filename));
    }
    Properties properties = getProperties(filename);
    propMap.put(filename, properties);
    return properties;
  }

  public static String getValue(String key,String defaultValue)
  {
    if (properties != null)
      return properties.getProperty(key,defaultValue);
    return "";
  }

  public static void putProperties(String key, Properties p)
  {
    propMap.put(key, p);
  }

  public static void updateProperties(String path, Map<String, String> map)
  {
    try
    {
      String strLine;
      if (StringUtils.isBlank(path)) {
        throw new Exception("文件路径为空");
      }
      File file = new File(path);
      FileInputStream inStream = new FileInputStream(file);
      BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inStream, "UTF-8"));

      StringBuffer sBuffer = new StringBuffer();
      String key = "";

      while ((strLine = bufferedReader.readLine()) != null)
      {
        key = getKeyFromProperties(strLine.trim());

        if ((key.length() != 0) && (map.containsKey(key))) {
          strLine = key + "=" + ((String)map.get(key));
        }

        sBuffer.append(strLine + "\r\n");
      }

      String[] common = sBuffer.toString().split("\r\n");

      BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
      for (String com : common) {
        bufferedWriter.write(com);
        bufferedWriter.newLine();
        bufferedWriter.flush();
      }
      bufferedReader.close();
      bufferedWriter.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  private static String getKeyFromProperties(String strLine)
  {
    int index;
    String key = "";

    int eqIndex = strLine.indexOf(61);
    int colonIndex = strLine.indexOf(58);

    if ((eqIndex > 0) && (colonIndex > 0))
    {
      index = (eqIndex > colonIndex) ? colonIndex : eqIndex;
    }
    else if ((eqIndex < 0) && (colonIndex < 0))
    {
      index = 0;
    }
    else {
      index = (eqIndex > 0) ? eqIndex : colonIndex;
    }

    key = strLine.substring(0, index);
    return key;
  }

  public static void addProperties(String path, Map<String, String> map)
  {
    try
    {
      if (StringUtils.isBlank(path)) {
        throw new Exception("文件路径为空");
      }
      File file = new File(path);

      String strLine = "";
      StringBuffer sBuffer = new StringBuffer();
      String key = "";

      Set keySet = map.keySet();

      Iterator iterator = keySet.iterator();

      while (iterator.hasNext()) {
        key = (String)iterator.next();
        if (key.length() != 0) {
          strLine = key + "=" + ((String)map.get(key));
        }
        sBuffer.append(strLine + "\r\n");
      }

      String[] common = sBuffer.toString().split("\r\n");

      BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file, true));
      for (String com : common) {
        bufferedWriter.write(com);
        bufferedWriter.newLine();
        bufferedWriter.flush();
      }
      bufferedWriter.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  public static Properties getProperties(String filename)
  {
    String fullName = SystemPathUtil.getFileFullPath(filename);
    File file = new File(fullName);
    InputStream in = null;

    Properties properties = new Properties();
    try
    {
      if ((fullName == null) || (!(file.exists())))
        in = SystemPathUtil.getInputStreamByJar(filename);
      else {
        in = new FileInputStream(fullName);
      }
      properties.load(in);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return properties;
  }
}