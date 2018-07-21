package jit.edu.paas.domain.vo;

import com.spotify.docker.client.messages.Network;
import jit.edu.paas.domain.entity.ContainerNetwork;
import jit.edu.paas.domain.entity.SysNetwork;
import lombok.Data;

import javax.annotation.security.DenyAll;

@Data
public class ContainerNetworkVO extends ContainerNetwork {
    private SysNetwork network;
}
