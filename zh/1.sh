#!/bin/bash

# 先处理文件
find . -type f -name "*_settings.*" | while IFS= read -r file; do
  dir=$(dirname "$file")
  base=$(basename "$file")
  name="${base%_settings.*}"
  ext="${base##*.}"
  new_name="$dir/$name.$ext"
  git mv "$file" "$new_name"
done

# 再处理目录
find . -depth -type d -name "*_settings" | while IFS= read -r dir; do
  parent_dir=$(dirname "$dir")
  base=$(basename "$dir")
  new_dir="$parent_dir/${base%_settings}"
  git mv "$dir" "$new_dir"
done
