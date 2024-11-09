<div align="center">
    <h1>Fisco-WeBase-Docker</h1>
	<h3>一键部署</h3>
</div>


## ⚙️ 环境配置

<table style="text-align: center;">
        <tr>
            <td>
                <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
            </td>
            <td>
              <img src="https://img.shields.io/badge/Docker_Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
            </td>
        </tr>
        <tr>
            <td style="font-size: 18px;font-weight: 800;color:red">
                必备(Required)
            </td>
            <td style="font-size: 18px;font-weight: 800;color:orange">
                可选（Optional）
            </td>
        </tr>
    </table>

> [!NOTE]
>
> 在 Windows 下安装 Docker 默认自动安装 Docker-Compose.
>
> 在 Linux 下安装 Dokcer 后还需额外安装 Docker-Compose.
>
> 本项目使用 FISCO BCOS 2.0 进行部署

## 一、快速部署 🚀

> [!TIP]
>
> 最新版的资源都在github上，所以拉取时要科学上网

### 1、使用 Docker-Compose 部署（推荐）❗️

#### Windows

​	1、 双击 WindowsRun.bat  程序自动安装运行 **4** 个节点的 **fisco** 和 **webase-front** 至 Docker容器内.

#### Linux

​	1、 进入项目目录使用终端运行 ` bash LinuxRun.bat`  程序自动安装运行 **4** 个节点的 **fisco** 和 **webase-front** 至 Docker容器内.

> 等待程序运行完毕后请直接跳转到 **步骤二** 访问网页

### 2、使用 Docker File 部署（可选）

#### 1、构建镜像

> [!TIP]
>
> 以下操作均在项目文件目录下进行

```ini
docker build -t fisco-webase:latest .
```

#### 2、查看镜像ID（ IMAGE ID）

```ini
docker images -a
```

> [!TIP]
>
> 如镜像ID为 8bdeb7aac675 可简写为 **8b** , 同理

#### 3、运行容器

```ini
docker run -e JAVA_HOME=/usr -it --name=fisco-webase5002 -p 5002:5002 -p 20200:20200 -p 30300:30300 -p 8545:8545 <镜像ID> /bin/bash startup.sh
```

## 二、访问 WebUI 

> [!IMPORTANT]
>
> 一定要输入`http://` 进行访问

#### 🎉访问 WeBASE-Front 网页

> [!TIP]
>
> http://localhost:5002/WeBASE-Front

## 三、补充

- **5002** 为WeBase-Front前置节点访问端口，访问地址：http://localhost:5002/WeBASE-Front
- **20200** 为待连接节点URL端口
- **8545** 为PRC端口
- **30300** 为监听端口
- 使用 **Docker-compose** 部署可以到项目 **logs** 文件下获取节点运行日志**（DockerFile 无此挂载日志信息）**
- 为防止日志占用过大设置了每天 **晚上12点** 自动清除日志

## 四、相关

- [ FISCO BCOS 2.0 ](https://fisco-bcos-documentation.readthedocs.io/zh-cn/latest/docs/installation.html)
- [WeBASE v1.5.5 ](https://webasedoc.readthedocs.io/zh-cn/latest/docs/WeBASE-Install/developer.html)



<div align="center">
	<p>༼ つ ◕_◕ ༽つ   File design By <b>ZivYe</b></p>
</div>
