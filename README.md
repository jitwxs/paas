# 无道云平台

## 基于Docker容器的PaaS系统

### 一、系统架构

![无道容器云系统架构](https://jitwxs-1252917613.cos.ap-shanghai.myqcloud.com/paas/%E7%B3%BB%E7%BB%9F%E6%9E%B6%E6%9E%84.png)

---

### 二、相关技术

#### 2.1 前端技术

- Vue
- Element-UI
- Echarts

#### 2.2 后端技术

- SpringBoot
- Spring Security
- JWT
- ActiveMQ
- Redis
- MySQL
- MyBatis Plus
- WebSocket
- Nginx

#### 2.3 Docker技术

- Docker CE
- Docker Remote API
- Docker Registry
- Docker Swarm

---

### 三、主要功能

本系统提供`用户` - `管理员`两套系统。

对于普通用户，提供：

- 镜像的导入/导出、上传/拉取
- 容器的部署、管理、监控
- 集群的部署、管理

对于管理员，提供：

- 用户管理
- 镜像管理
- 容器管理
- 集群管理
- Hub管理
- 网络管理
- 数据卷管理
- 监控管理

![仪表盘](https://jitwxs-1252917613.cos.ap-shanghai.myqcloud.com/paas/%E4%BB%AA%E8%A1%A8%E7%9B%98.png)

![容器监控](https://jitwxs-1252917613.cos.ap-shanghai.myqcloud.com/paas/%E5%AE%B9%E5%99%A8%E7%9B%91%E6%8E%A7.png)

![我的镜像](https://jitwxs-1252917613.cos.ap-shanghai.myqcloud.com/paas/%E6%88%91%E7%9A%84%E9%95%9C%E5%83%8F.png)

---

### 四、任务要求

#### 子任务1 实训题目讲解与答疑

- 根据题目要求，展示该题目的总体业务逻辑以及系统体系结构图，并给出系统的ER图

- 进行技术选型，给出相应的前端、后端、数据库等技术框架的选择

- 给出小组人员的职能划分

#### 子任务2 前后端通信协议的确立和接口文档的编写

为了开发过程的标准化，在深入了解题目需求后，前后端开发人员需确立一套可扩展的通信协议格式，以及编写前后端通信的接口文档。 

#### 子任务3 Docker容器的学习及部署

- 学习、了解docker容器技术

- 搭建docker环境，并进行镜像、容器的相关操作

#### 子任务4 Docker HTTP API的熟悉并运用

- docker默认不开启remote api接口，需要手动配置开启

- 利用HTTP接口实现docker的相关操作

- 利用http api实现mysql、nginx、java容器的创建、停止与删除等操作

#### 子任务5 实现Paas平台的后台管理系统

- 通过后台管理系统实现Paas平台用户的管理（资源配置、权限管理）

- 实现docker容器的信息展示（用户、配置信息、运行状态等）

- 实现用户容器的创建、启停、删除操作

- 为用户提供nginx、java环境、mysql等平台服务

#### 子任务6 用户使用Paas平台服务

- 用户登录到Paas平台管理系统，申请相关的容器服务（java环境、mysql、nginx等），并进行相应的信息配置（容器名、mysql密码等）

- 成功运行Paas平台的docker服务，并进行测试
