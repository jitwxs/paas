package jit.edu.paas.domain.vo;

import jit.edu.paas.domain.entity.ContainerNetwork;
import jit.edu.paas.domain.entity.SysNetwork;
import lombok.Data;

@Data
public class ContainerNetworkVO extends ContainerNetwork {
    private SysNetwork network;
}
