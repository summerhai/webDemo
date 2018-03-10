package cn.com.retrans.utils;

public class DatabaseUtil {

    /**
     * 获取页面上DataTable点击的列与真实数据库中的列进行映射
     * tableName是指对应的表
     * index指的是在该表中点击的是哪个列
     *
     * @param tablenName
     * @param index
     * @return
     */
    public static String getColumnName(String tablenName, int index) {
        String columnString = PropertiesUtil.getValue(tablenName + ".table.display", "");
        if (index <= 0) {
            index = 1;
        }
        return columnString.split(",")[index - 1];
    }
}
