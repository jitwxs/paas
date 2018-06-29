package jit.edu.paas.commons.activemq;

import java.io.Serializable;
import java.util.Map;

/**
 * 任务实体类
 * @author jitwxs
 * @since 2018/5/8 15:24
 */
public class Task implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 任务描述
     */
    private String info;

    /**
     * 任务实体
     */
    private Map<String,Object> data;

    public Task() {

    }

    public Task(String info, Map<String, Object> data) {
        this.info = info;
        this.data = data;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Task{" +
                "info='" + info + '\'' +
                ", data=" + data +
                '}';
    }
}
