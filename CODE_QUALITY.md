# 代码质量工具

本项目已配置了完整的代码质量工具链，确保代码的一致性和质量。

## 工具配置

### 已配置的工具

1. **Black** - Python 代码自动格式化
2. **isort** - 自动排序和组织导入语句
3. **flake8** - 代码风格检查和错误检测
4. **mypy** - 静态类型检查
5. **pre-commit** - Git 提交前的自动检查

### 配置文件

- `pyproject.toml` - 包含所有工具的配置
- `.pre-commit-config.yaml` - Pre-commit hooks 配置
- `.flake8` - Flake8 特定配置

## 使用方法

### 安装开发依赖

```bash
# 安装所有开发工具
uv sync --extra dev

# 或者安装到现有环境
uv add --dev black isort flake8 mypy pre-commit
```

### 代码格式化

```bash
# 运行所有格式化工具（修复问题）
./scripts/format-fix.sh

# 仅检查代码质量（不修改文件）
./scripts/format.sh
```

### 手动运行单个工具

```bash
# 格式化代码
uv run black .

# 排序导入
uv run isort .

# 代码检查
uv run flake8 .

# 类型检查
uv run mypy backend/ main.py --ignore-missing-imports
```

### Pre-commit Hooks

```bash
# 安装 pre-commit hooks
uv run pre-commit install

# 手动运行所有 hooks
uv run pre-commit run --all-files

# 运行特定 hook
uv run pre-commit run black --all-files
```

## 代码质量标准

### Black 配置
- 行长度：88 字符
- Python 版本：3.13+
- 自动格式化所有 .py 文件

### isort 配置
- 兼容 Black 的配置
- 多行输出模式 3
- 相同的行长度限制

### flake8 配置
- 最大行长度：88
- 忽略与 Black 冲突的规则
- 排除常见目录和文件

### mypy 配置
- Python 版本：3.13
- 启用严格的类型检查
- 要求所有函数有类型注解

## 最佳实践

1. **提交前**：运行 `./scripts/format-fix.sh` 确保代码格式正确
2. **持续集成**：在 CI 中运行 `./scripts/format.sh` 检查代码质量
3. **类型注解**：为所有函数添加类型注解
4. **导入组织**：让 isort 自动处理导入排序
5. **文档字符串**：为类和函数添加清晰的文档字符串

## 故障排除

### 常见问题

1. **工具未找到**：确保已运行 `uv sync --extra dev`
2. **格式冲突**：Black 和 flake8 配置确保兼容性
3. **类型错误**：使用 `--ignore-missing-imports` 忽略第三方库的类型问题

### 性能优化

- 使用 `.pre-commit-config.yaml` 只检查修改的文件
- 在 IDE 中配置自动格式化节省时间
- 定期运行全量检查确保整体质量