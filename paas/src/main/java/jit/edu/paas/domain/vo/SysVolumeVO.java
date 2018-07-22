package jit.edu.paas.domain.vo;

import com.spotify.docker.client.messages.Volume;
import jit.edu.paas.domain.entity.SysVolume;
import lombok.Data;

/**
 *
 * @author jitwxs
 * @since 2018/7/21 22:19
 */
@Data
public class SysVolumeVO extends SysVolume {
    private String typeName;

    private String objName;
    
    private Volume volume;
}
