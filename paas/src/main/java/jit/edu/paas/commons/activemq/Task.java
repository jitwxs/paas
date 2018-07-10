package jit.edu.paas.commons.activemq;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Map;

/**
 * 任务实体类
 * @author jitwxs
 * @since 2018/5/8 15:24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Task implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 任务描述
     */
    private String info;

    /**
     * 任务实体
     */
    private Map<String,String> data;
}
