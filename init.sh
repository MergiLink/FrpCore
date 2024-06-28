#!/bin/bash

LOCAL_FILES_DIR=$(pwd)
REPO_URL="https://github.com/fatedier/frp.git"
REPO_DIR="/tmp/frp"

if [ -d "source" ]; then
rm -rf source
fi
mkdir source

# 克隆 GitHub 仓库
if [ -d "$REPO_DIR" ]; then
 rm -rf "$REPO_DIR"
fi

git clone "$REPO_URL" "$REPO_DIR"
cd "$REPO_DIR" || exit 1

# 将本地文件复制到仓库目录
cp -r "$LOCAL_FILES_DIR"/* "$REPO_DIR"
rm -rf init.sh

# 检查并合并文件
git add .

# 提交更改
git commit -m "合并代码" || {
  echo "没有修改"
}

cp -r "$REPO_DIR"/* "$LOCAL_FILES_DIR"/source

# 解决冲突（如果有）
if git status | grep -q "conflict"; then
  git status
else
 echo "cd source"
 echo "make"
fi
