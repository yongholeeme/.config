# 🍎 macOS Dotfiles

> 맥 개발 환경을 위한 개인 설정 저장소

## ✨ 특징

- 📦 **Homebrew Bundle**: 패키지 자동 설치
- 🔧 **모듈형 zsh**: 기능별 분리된 설정
- 💾 **백업/복원**: 설정 백업 기능
- 🚀 **원클릭 설치**: 자동 설치 스크립트

## 🚀 빠른 시작

### 새 컴퓨터에서 설치

```bash
git clone https://github.com/yongholeeme/.config.git ~/.config && ~/.config/install.sh
```

### 기존 설정 업데이트

```bash
cd ~/.config && git pull && ./install.sh
```

## 📁 구조

```
.config/
├── .zshrc              # zsh 메인 로더
├── .vimrc              # vim 설정
├── init.sh             # 심링크 부트스트랩
├── install.sh          # 메인 설치 스크립트
├── backup.sh           # 백업/복원 스크립트
├── Brewfile            # Homebrew 패키지 정의
├── zshrc/              # 모듈형 zsh 설정
│   ├── brew.zshrc      # Homebrew (fnm보다 먼저)
│   ├── fnm.zshrc       # Node.js 관리 (fnm)
│   ├── git.zshrc       # Git 설정
│   └── ...             # 기타 모듈들
└── cmux/               # cmux 설정
```

## 🔧 주요 기능

### 1. 패키지 관리
- **Homebrew Bundle**: 일관된 패키지 설치
- **VS Code 확장**: 자동 설치 및 동기화
- **Mac App Store**: mas를 통한 앱 설치

### 2. 설정 모듈화
```bash
# zsh 설정이 기능별로 분리되어 관리
source $CONFIG/zshrc/brew.zshrc     # Homebrew 환경
source $CONFIG/zshrc/fnm.zshrc      # Node.js 관리
source $CONFIG/zshrc/git.zshrc      # Git aliases
```

### 3. 백업 및 복원
```bash
# 현재 설정 백업
./backup.sh backup

# 특정 시점으로 복원
./backup.sh restore 20231118_143022
```

## 🛠️ 사용법

### 새 도구 추가하기

1. **CLI 도구**: `Brewfile`에 추가
```ruby
brew "new-cli-tool"
```

2. **GUI 앱**: `Brewfile`에 추가
```ruby
cask "new-application"
```

3. **VS Code 확장**: `Brewfile`에 추가
```ruby
vscode "publisher.extension-name"
```

4. **Shell 설정**: 새 모듈 생성
```bash
echo 'export NEW_TOOL_CONFIG="value"' > zshrc/newtool.zshrc
```

### 회사별 설정

`zshrc/work/` 디렉토리는 .gitignore 처리되며, 존재하면 자동으로 로드됩니다.

```bash
mkdir -p zshrc/work
echo 'export WORK_SPECIFIC="value"' > zshrc/work/.zshrc
```

## 📋 체크리스트

새 컴퓨터 설정 시:
- [ ] `git clone` 및 `~/.config/install.sh` 실행
- [ ] 터미널 재시작 또는 `source ~/.zshrc`
- [ ] 개인 설정 (Git 사용자 정보 등) 추가

## 🔍 문제 해결

### 일반적인 문제들

**Homebrew 설치 실패**:
```bash
# Homebrew 재설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**패키지 누락**:
```bash
cd ~/.config
brew bundle install
```

**설정 파일 누락**:
```bash
./install.sh
```

## 📚 참고 자료

- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
- [Dotfiles Best Practices](https://dotfiles.github.io/)
- [macOS Defaults Commands](https://macos-defaults.com/)
