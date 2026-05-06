# .config - macOS Dotfiles

멀티 머신 동기화를 위한 dotfiles 저장소.

## 구조

```
.config/
├── .zshrc           # 메인 로더 (모듈 소싱 순서 중요)
├── zshrc/           # 모듈화된 zsh 설정
│   ├── terminal.zshrc
│   ├── brew.zshrc   # Homebrew (반드시 fnm보다 먼저 로드)
│   ├── fnm.zshrc    # Fast Node Manager
│   ├── git.zshrc    # Git aliases
│   ├── nginx.zshrc
│   ├── rancher.zshrc
│   ├── proxyman.zshrc
│   ├── claude.zshrc
│   └── work/        # 회사별 설정 (.gitignore 처리됨)
├── Brewfile         # Homebrew 패키지 목록
├── init.sh          # 부트스트랩 (zshrc 덮어쓰기)
├── install.sh       # 전체 설치 스크립트
└── backup.sh        # 설정 백업/복원
```

## 핵심 규칙

- Node.js 관리: fnm (Homebrew로 설치). nvm 아님
- zshrc 모듈 로딩 순서: brew.zshrc → fnm.zshrc (brew PATH 먼저 필요)
- 민감 정보: gh/, raycast/, zshrc/work/ 등은 .gitignore 처리
- Git author: `yongholeeme <yongholeeme@gmail.com>`

## 커밋 컨벤션

- 이모지 프리픽스 사용 (✨ 새 기능, 🧹 정리, 🐛 버그 수정 등)
- 영어, 한 줄, 50자 이내
- Claude 관련 문구 금지
