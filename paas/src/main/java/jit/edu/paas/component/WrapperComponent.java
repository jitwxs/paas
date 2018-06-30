package jit.edu.paas.component;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.select.UserProjectSelect;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

/**
 * 生成MyBatis Plus筛选条件
 * @author jitwxs
 * @since 2018/6/28 16:04
 */
@Component
public class WrapperComponent {

    /**
     * 生成用户项目筛选条件
     * @author jitwxs
     * @since 2018/6/29 15:16
     */
    public EntityWrapper<UserProject> genUserProjectWrapper(UserProjectSelect select) {
        EntityWrapper<UserProject> wrapper = new EntityWrapper<>();

        if(StringUtils.isNotBlank(select.getName())) {
            wrapper.like("name", select.getName());
        }
        if(StringUtils.isNotBlank(select.getUserId())) {
            wrapper.eq("user_id", select.getUserId());
        }
        if(select.getStartDate() != null && select.getEndDate() != null) {
            wrapper.between("create_date", select.getStartDate(), select.getEndDate());
        }

        return wrapper;
    }
}
