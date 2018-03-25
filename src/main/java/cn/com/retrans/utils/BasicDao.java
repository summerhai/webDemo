package cn.com.retrans.utils;


import java.io.Closeable;
import java.sql.*;
import java.util.ArrayList;
import java.util.Random;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BasicDao implements Closeable{

    public static String database = "";
    private static final String enCoding = "?useUnicode=true&characterEncoding=utf8&autoReconnect=true&maxReconnects=3&useSSL=false";
	public Connection conn = null;
	public PreparedStatement pst = null;

    public BasicDao(String database){
        this.database = database;
    }
    public BasicDao(){

    }
	public void setDatabase(String database) {
		this.database = database;
	}
    public Connection open() {
        try{
            String dbHost = PropertiesUtil.getValue("jdbc.host", "localhost");
            String dbPort = PropertiesUtil.getValue("jdbc.port", "3306");
            String dbUser = PropertiesUtil.getValue("jdbc.username", "root");
            String dbPassword = PropertiesUtil.getValue("jdbc.password", "112358");
            String dbDriver = PropertiesUtil.getValue("jdbc.driver", "com.mysql.jdbc.Driver");
            String url = "";
            if(database.equals("")){
                url = "jdbc:mysql://" + dbHost + ":" + dbPort + enCoding;
            }else {
                url = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + database + enCoding;
            }
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(url, dbUser, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }


	
	public ResultSet get(String sql) {
		ResultSet ret = null;
		try {
			pst = conn.prepareStatement(sql);
			ret = pst.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}

	public int create(String sql) {
		int ret = 0;
		try {
			pst = conn.prepareStatement(sql);
			ret = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public int update(String sql) {
		int ret = 0;
		try {
			pst = conn.prepareStatement(sql);
			ret = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public int put(String sql) {
		int ret = 0;
		try {
			pst = conn.prepareStatement(sql);
			ret = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public int delete(String sql) {
		int ret = 0;
		try {
			pst = conn.prepareStatement(sql);
			ret = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public void close() {
		try{
			if(conn != null)
				this.conn.close();
			if(pst != null)
				this.pst.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	private static Date randomDate(String beginDate, String endDate) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date start = format.parse(beginDate);// 构造开始日期
			Date end = format.parse(endDate);// 构造结束日期
			// getTime()表示返回自 1970 年 1 月 1 日 00:00:00 GMT 以来此 Date 对象表示的毫秒数。
			if (start.getTime() >= end.getTime()) {
				return null;
			}
			long date = random(start.getTime(), end.getTime());

			return new Date(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private static long random(long begin, long end) {
		long rtn = begin + (long) (Math.random() * (end - begin));
		// 如果返回的是开始时间和结束时间，则递归调用本函数查找随机值
		if (rtn == begin || rtn == end) {
			return random(begin, end);
		}
		return rtn;
	}

	public static void main(String[] args) throws SQLException {

		BasicDao basicDao = new BasicDao();
		String database = "wz";
		basicDao.setDatabase(database);

			basicDao.open();
			String colname = "";
			String sql = "select column6 from " + database + ".人员信息表";
			//String sql = "select distinct "+colname +" from "+database+"."+tableName;
			String[] jizhan ={"10014135","10014656","147614135","154656754","6536436","588776","3578868865","56547","5733333","7699994"};
			ArrayList<String> list = new ArrayList<String>();
			ResultSet set = basicDao.get(sql);
			while(set.next()){
				list.add(set.getString(1));
			}
			for(int i=0;i<50;i++){
				int n = (int) (Math.random() * (jizhan.length-1));
				String src = jizhan[n];
				int m = (int) (Math.random() * (list.size()-1));

//				while (m==n){
//					m = (int) (Math.random() * (list.size()-1));
//				}
				String des = list.get(m);
				String time  = randomDate("2017-03-01", "2017-03-08").toString();
				sql = "insert into wz.基站库 (jizhan,phone,time) values ('"+src+"','"+des+"','"+time+"')";
				System.out.println(sql);
				basicDao.put(sql);

			}
			basicDao.close();
	}

}

