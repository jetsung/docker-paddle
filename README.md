# PaddlePaddle
PaddlePaddle 镜像   
- PaddlePaddle 官网：https://www.paddlepaddle.org.cn/
- PaddleOCR 仓库：https://github.com/PaddlePaddle/PaddleOCR
- PaddleSpeech 仓库：https://github.com/PaddlePaddle/PaddleSpeech

## 环境
- 基础镜像：`debian:11.4`
- 内置程序包：`paddle, paddleocr, paddlespeech`

## 产物镜像
```bash
# Jihulab：https://jihulab.com/jetsung/docker-paddle/container_registry/
registry.jihulab.com/jetsung/docker-paddle:0.1

# Aliyun
registry.cn-guangzhou.aliyuncs.com/devcto/paddle:0.2
```

## PaddleOCR 教程
- https://github.com/PaddlePaddle/PaddleOCR/blob/release/2.5/doc/doc_ch/quickstart.md
```bash
# 检测+方向分类器+识别全流程：--use_angle_cls true 设置使用方向分类器识别180度旋转文字，--use_gpu false 设置不使用GPU
paddleocr --image_dir ./imgs/11.jpg --use_angle_cls true --use_gpu false
```

## PaddleSpeech 教程
- 
```bash
# 文字转语音，生成 wav 文件：https://github.com/PaddlePaddle/PaddleSpeech/issues/1620
paddlespeech tts --am fastspeech2_aishell3 --voc pwgan_aishell3 --input "你好，欢迎使用百度飞桨深度学习框架！" --spk_id 167

# 文字转语音：英文
paddlespeech tts --am fastspeech2_ljspeech --voc pwgan_ljspeech --lang en --input "hello world"
```

**在 Docker 中使用：**   
```bash
docker run --rm -v $(pwd):/paddle registry.cn-guangzhou.aliyuncs.com/devcto/paddle:dev /root/.paddle_env/bin/paddlespeech tts --am fastspeech2_aishell3 --voc pwgan_aishell3 --input "你好，欢迎使用百度飞桨深度学习框架！" 
```

## 注意
- 使用 `venv` 环境，位于 `/root/.paddle_env`

- 镜像中的环境并未设置中国镜像源。若在中国境内使用，建议预先设置源：  
  > 直接运行 `/app/mirror.sh` 修改源，并且使用 `apt update -y` 获取更新。
  - `pip 源`
  ```bash
  # 腾讯云源
  pip config set global.index-url  https://mirrors.cloud.tencent.com/pypi/simple  --trusted-host mirrors.cloud.tencent.com
  ```
  - `debian` 源设置请查看教程：https://mirrors.bfsu.edu.cn/help/debian/
