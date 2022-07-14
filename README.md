# PaddlePaddle
PaddlePaddle 镜像   
- PaddlePaddle 官网：https://www.paddlepaddle.org.cn/
- PaddleOCR 仓库：https://github.com/PaddlePaddle/PaddleOCR

## 环境
- 基础镜像：`debian:11.4`
- 内置程序包：`paddle, paddleocr`

## PaddleOCR 教程
- https://github.com/PaddlePaddle/PaddleOCR/blob/release/2.5/doc/doc_ch/quickstart.md
```bash
# 检测+方向分类器+识别全流程：--use_angle_cls true 设置使用方向分类器识别180度旋转文字，--use_gpu false 设置不使用GPU
paddleocr --image_dir ./imgs/11.jpg --use_angle_cls true --use_gpu false
```

## 注意
- 使用 `venv` 环境，位于 `/root/.paddle_env`

- 镜像中的环境并未设置中国镜像源。若在中国境内使用，建议预先设置源：
```bash
# 腾讯云源
pip config set global.index-url  https://mirrors.cloud.tencent.com/pypi/simple  --trusted-host mirrors.cloud.tencent.com
```

- `debian` 源设置请查看下文教程：
- https://mirrors.bfsu.edu.cn/help/debian/
