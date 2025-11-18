# 🍎 macOS Dotfiles

> 맥 개발 환경을 위한 개인 설정 저장소

## ✨ 특징

- 📦 **Homebrew Bundle**: 패키지 자동 설치
- 🔧 **모듈형 zsh**: 기능별 분리된 설정
- 💾 **백업/복원**: 설정 백업 기능
- ✅ **검증 도구**: 설정 상태 확인
- 🚀 **원클릭 설치**: 자동 설치 스크립트

## 🚀 빠른 시작

### 새 컴퓨터에서 설치

```bash
# 1. 저장소 클론
git clone https://github.com/yongholeeme/.config.git ~/.config

# 2. 설치 실행
cd ~/.config
chmod +x install.sh
./install.sh
```

### 기존 설정 업데이트

```bash
cd ~/.config
git pull origin main
./install.sh
```

## 📁 구조

```
.config/
├── install.sh          # 메인 설치 스크립트
├── backup.sh           # 백업/복원 스크립트
├── validate.sh         # 설정 검증 스크립트
├── platform.sh         # OS별 분기 처리
├── Brewfile            # Homebrew 패키지 정의
├── zshrc/              # 모듈형 zsh 설정
│   ├── .zshrc          # 메인 설정 파일
│   ├── brew.zshrc      # Homebrew 관련
│   ├── git.zshrc       # Git 설정
│   ├── nvm.zshrc       # Node.js 관리
│   └── ...             # 기타 모듈들
├── nvim/               # Neovim 설정
├── gh/                 # GitHub CLI 설정
├── fish/               # Fish shell 설정
└── raycast/            # Raycast 확장
```

## 🔧 주요 기능

### 1. 패키지 관리
- **Homebrew Bundle**: 일관된 패키지 설치
- **VS Code 확장**: 자동 설치 및 동기화
- **Mac App Store**: mas를 통한 앱 설치

### 2. 설정 모듈화
```bash
# zsh 설정이 기능별로 분리되어 관리
source $CONFIG/zshrc/git.zshrc      # Git 관련 설정
source $CONFIG/zshrc/nvm.zshrc      # Node.js 관리
source $CONFIG/zshrc/docker.zshrc   # Docker 관련
```

### 3. 백업 및 복원
```bash
# 현재 설정 백업
./backup.sh backup

# 특정 시점으로 복원
./backup.sh restore 20231118_143022
```

### 4. 설정 검증
```bash
# 모든 설정 상태 확인
./validate.sh
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

### 환경별 설정

**개발/운영 환경 분리**:
```bash
# work 디렉토리 생성 (gitignore에 포함됨)
mkdir -p zshrc/work
echo 'export WORK_SPECIFIC="value"' > zshrc/work/.zshrc
```

**OS별 분기**:
```bash
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS 전용 설정
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux 전용 설정
fi
```

## 📋 체크리스트

새 컴퓨터 설정 시:
- [ ] `git clone` 및 `./install.sh` 실행
- [ ] 터미널 재시작 또는 `source ~/.zshrc`
- [ ] `./validate.sh`로 설정 확인
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

## 🤝 추가 개선 아이디어

1. **Ansible/Chef**: 더 복잡한 설정 관리
2. **Nix**: 선언적 패키지 관리
3. **Chezmoi**: 전문 dotfiles 관리 도구
4. **Docker**: 컨테이너 기반 개발 환경
5. **Cloud Sync**: 클라우드 기반 설정 동기화

## 📚 참고 자료

- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
- [Dotfiles Best Practices](https://dotfiles.github.io/)
- [macOS Defaults Commands](https://macos-defaults.com/)

---

### Brew 설치 (최초 1회)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
