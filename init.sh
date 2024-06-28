#!/bin/bash
mkdir core
cp -r * core

LOCAL_FILES_DIR="core"
REPO_URL="https://github.com/fatedier/frp.git"
REPO_DIR="frp"

# 克隆 GitHub 仓库
if [ -d "$REPO_DIR" ]; then
 rm -rf frp
fi

git clone "$REPO_URL" "$REPO_DIR"
cd "$REPO_DIR" || exit 1

# 将本地文件复制到仓库目录
cp -r "$LOCAL_FILES_DIR"/* ./

# 检查并合并文件
git add .

# 提交更改
git commit -m "合并代码" || {
  echo "没有修改"
}

# 解决冲突（如果有）
if git status | grep -q "conflict"; then
  git status
else
 echo "你可以make了"
fi
