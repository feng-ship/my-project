#!/bin/bash

echo "==========================="
echo "🔍 检测 & 自动配置 VS Code C++"
echo "==========================="

# 1. 检查编译器
echo -e "\n[1] 检查编译器 clang++ ..."
if command -v clang++ &> /dev/null; then
    echo "✅ clang++ 已安装: $(clang++ --version | head -n 1)"
else
    echo "❌ clang++ 未安装，正在安装..."
    xcode-select --install
    exit 1
fi

# 2. 检查 VS Code
echo -e "\n[2] 检查 VS Code ..."
if command -v code &> /dev/null; then
    echo "✅ VS Code 命令行可用"
else
    echo "❌ VS Code 命令不可用，请在 VS Code 内执行:"
    echo "   Shell Command: Install 'code' command in PATH"
    exit 1
fi

# 3. 检查插件
echo -e "\n[3] 检查 VS Code C++ 插件 ..."
if code --list-extensions | grep -q "ms-vscode.cpptools"; then
    echo "✅ 已安装 C/C++ 插件"
else
    echo "❌ 未安装，正在安装 C/C++ 插件..."
    code --install-extension ms-vscode.cpptools
fi

# 4. 自动生成 VS Code 配置文件
echo -e "\n[4] 生成 VS Code C++ 配置..."
mkdir -p .vscode

# tasks.json
cat <<EOF > .vscode/tasks.json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build active file",
            "type": "shell",
            "command": "clang++",
            "args": [
                "-std=c++17",
                "\${file}",
                "-o",
                "\${fileDirname}/\${fileBasenameNoExtension}"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ]
}
EOF

# launch.json
cat <<EOF > .vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "C++ Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${fileDirname}/\${fileBasenameNoExtension}",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${fileDirname}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "lldb"
        }
    ]
}
EOF

# c_cpp_properties.json
cat <<EOF > .vscode/c_cpp_properties.json
{
    "configurations": [
        {
            "name": "Mac",
            "includePath": [
                "\${workspaceFolder}/**"
            ],
            "defines": [],
            "macFrameworkPath": [
                "/System/Library/Frameworks",
                "/Library/Frameworks"
            ],
            "compilerPath": "/usr/bin/clang++",
            "cStandard": "c11",
            "cppStandard": "c++17",
            "intelliSenseMode": "macos-clang-arm64"
        }
    ],
    "version": 4
}
EOF

echo "✅ VS Code 配置已生成 (.vscode 目录)"

# 5. 编译运行测试
echo -e "\n[5] 测试编译运行 ..."
TEST_CPP="hello.cpp"
cat <<EOF > $TEST_CPP
#include <iostream>
using namespace std;
int main() {
    cout << "🎉 VS Code C++ 环境已配置成功！" << endl;
    return 0;
}
EOF

clang++ $TEST_CPP -o hello && ./hello

echo -e "\n🎯 完成！现在可以在 VS Code 按 F5 编译运行 C++ 程序"
