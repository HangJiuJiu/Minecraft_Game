package com.ssm.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 统一返回类
 */
public class JsonMsg {

    private int code;
    private String msg;
    private Map<String, Object> extendInfo = new HashMap<>();
    private Object dataInfo;

    public static JsonMsg success() {
        JsonMsg res = new JsonMsg();
        res.setCode(100);
        res.setMsg("操作成功！");
        return res;
    }

    public static JsonMsg fail() {
        JsonMsg res = new JsonMsg();
        res.setCode(200);
        res.setMsg("操作失败！");
        return res;
    }

    public static JsonMsg fail(String msg) {
        JsonMsg res = new JsonMsg();
        res.setCode(200);
        res.setMsg(msg);
        return res;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtendInfo() {
        return extendInfo;
    }

    public void setExtendInfo(Map<String, Object> extendInfo) {
        this.extendInfo = extendInfo;
    }

    public Object getDataInfo() {
        return dataInfo;
    }

    public void setDataInfo(Object dataInfo) {
        this.dataInfo = dataInfo;
    }

    public JsonMsg addInfo(String key, Object obj) {
        this.extendInfo.put(key, obj);
        return this;
    }

    public JsonMsg addInfo(Object info) {
        this.dataInfo = info;
        return this;
    }
}
