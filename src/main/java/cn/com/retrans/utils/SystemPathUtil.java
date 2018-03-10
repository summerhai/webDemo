package cn.com.retrans.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;

public class SystemPathUtil
{
  private static final Logger logger = LoggerFactory.getLogger(SystemPathUtil.class);

  private static String _webinfPath = null;

  private static String _systemPath = null;
  private static final String DEFAULT_OS_KEY = "os.name";

  public static InputStream getInputStreamByJar(String filePath)
  {
    return Thread.currentThread().getContextClassLoader().getResourceAsStream(filePath);
  }

  public static String getWebinfPath()
  {
    if (_webinfPath == null) {
      String res = null;

      ClassLoader cl = SystemPathUtil.class.getClassLoader();
      if (cl != null) {
        URL url = cl.getResource("");
        if (url != null) {
          String path = url.getPath();
          logger.info("path-----------------" + path);
          int fileStrPosition = path.indexOf("file:/");
          int begin = 0;
          int end = path.length();

          if (fileStrPosition >= 0) {
            begin = fileStrPosition + 5;
          }

          end = path.indexOf("classes/");
          if (end < 0)
          {
            end = path.indexOf("lib/");
            if (end < 0)
            {
              int tmpend = path.indexOf("!/");
              if (tmpend < 0) {
                return _webinfPath;
              }
              end = path.substring(0, tmpend).lastIndexOf("/");
            }
          }

          String rf = path.substring(begin, end);
          res = new File(rf).getAbsolutePath().replace('\\', '/') + "/";
        }
      }
      try {
        _webinfPath = URLDecoder.decode(res, "UTF-8");
      } catch (Exception ex) {
        logger.error("getWebinfPath error" + ex);
      }
    }
    return _webinfPath;
  }

  public static String getSystemPath()
  {
    if (_systemPath == null) {
      String res = getWebinfPath();

      logger.info("getSystemPath :" + res);

      _systemPath = res;
    }
    return _systemPath;
  }

  public static String getRootPath()
  {
    String res = getWebinfPath();
    if ((res.indexOf("WEB-INF") > 0) && (res.length() > 10))
      res = res.substring(0, res.lastIndexOf("/", res.length() - 12)) + File.separator;
    else {
      return _systemPath;
    }
    logger.info("getRootPath :" + res);
    _systemPath = res;
    return _systemPath;
  }

  public static String getFileFullPath(String filename)
  {
    ClassLoader classLoader = Thread.currentThread().getContextClassLoader();

    String path = classLoader.getResource(filename).getPath();
    try
    {
      path = URLDecoder.decode(path, "UTF-8");
    } catch (UnsupportedEncodingException e) {
      logger.error(e.toString());
      e.printStackTrace();
    }

    return path;
  }

  public static boolean getOs()
  {
    String os = System.getProperty("os.name").toLowerCase();

    return (os.indexOf("windows") > -1);
  }

  public static boolean isPASMandUCASTogether(String appName)
  {
    String fullName = getFileFullPath("security.properties");

    String pasmFileName = "";
    appName = appName.toLowerCase();

    if (appName.equals("ucas"))
    {
      if (fullName.indexOf("ucas") > -1)
        pasmFileName = fullName.replaceAll("ucas", "pasm");
      else {
        pasmFileName = fullName.replaceAll("ultracas", "ultrapasm");
      }

    }

    if (fullName.indexOf("ultrapasm") > -1)
      pasmFileName = fullName.replaceAll("ultrapasm", "ultracas");
    else {
      pasmFileName = fullName.replaceAll(appName, "ucas");
    }

    File file = new File(pasmFileName);

    boolean flag = file.exists();

    return flag;
  }
}