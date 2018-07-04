package jit.edu.paas.commons.component;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.select.SysImageSelect;
import jit.edu.paas.domain.select.UserProjectSelect;
import jit.edu.paas.domain.select.UserSelect;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

/**
 * 生成MyBatis Plus筛选条件
 *
 * @author jitwxs
 * @since 2018/6/28 16:04
 */
@Component
public class WrapperComponent {

    /**
     * 生成用户项目筛选条件
     *
     * @author jitwxs
     * @since 2018/6/29 15:16
     */
    public EntityWrapper<UserProject> genUserProjectWrapper(UserProjectSelect select) {
        EntityWrapper<UserProject> wrapper = new EntityWrapper<>();

        if (StringUtils.isNotBlank(select.getName())) {
            wrapper.like("name", select.getName());
        }
        if (StringUtils.isNotBlank(select.getUserId())) {
            wrapper.eq("user_id", select.getUserId());
        }
        if (select.getStartDate() != null && select.getEndDate() != null) {
            wrapper.between("create_date", select.getStartDate(), select.getEndDate());
        }

        return wrapper;
    }

    /**
     * 生成用户筛选条件
     *
     * @author zj
     * @since 2018/6/30 15:16
     */
    public EntityWrapper<SysLogin> genUserWrapper(UserSelect select) {
        EntityWrapper<SysLogin> wrapper = new EntityWrapper<>();

        if (StringUtils.isNotBlank(select.getUsername())) {
            wrapper.like("username", select.getUsername());
        }

        if (StringUtils.isNotBlank(select.getId())) {
            wrapper.eq("id", select.getId());
        }

        if (StringUtils.isNotBlank(select.getEmail())) {
            wrapper.like("email", select.getEmail());
        }

        if(select.getHasFreeze() != null) {
            wrapper.eq("has_freeze", select.getHasFreeze());
        }

        if (select.getStartDate() != null && select.getEndDate() != null) {
            wrapper.between("create_date", select.getStartDate(), select.getEndDate());
        }
        return wrapper;
    }

    /**
     * 生成用户项目筛选条件
     * @author jitwxs
     * @since 2018/6/29 15:16
     */
    public EntityWrapper<SysImage> genSysImageWrapper(SysImageSelect select) {
        EntityWrapper<SysImage> wrapper = new EntityWrapper<>();

        if(StringUtils.isNotBlank(select.getId())) {
            wrapper.eq("id", select.getId());
        }
        if(StringUtils.isNotBlank(select.getName())) {
            wrapper.like("name", select.getName());
        }
        if(StringUtils.isNotBlank(select.getUserId())) {
            wrapper.eq("user_id", select.getUserId());
        }
        if(StringUtils.isNotBlank(select.getTag())) {
            wrapper.eq("tag",select.getTag());
        }
        if(StringUtils.isNotBlank(select.getHasOpen())) {
            wrapper.eq("has_open",select.getHasOpen());
        }
        if(select.getStartDate() != null && select.getEndDate() != null) {
            wrapper.between("create_date", select.getStartDate(), select.getEndDate());
        }
        if(select.getType() != null) {
            wrapper.eq("type",select.getType());
        }
        return wrapper;
    }
}
