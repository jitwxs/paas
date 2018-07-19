package jit.edu.paas.domain.vo;

import com.spotify.docker.client.messages.Volume;
import jit.edu.paas.domain.entity.SysVolume;
import lombok.Data;

@Data
public class SysVolumeVO extends SysVolume {
    private Volume volume;
}
