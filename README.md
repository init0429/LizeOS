# LizeOS

NASM(어셈블리)으로 밑바닥부터 만드는 학습용 OS 프로젝트입니다.
빌드는 Makefile로 관리합니다.

## 요구 사항

| 도구 | 용도 |
| ---- | ---- |
| [NASM](https://www.nasm.us/) | 어셈블러 |
| GNU Make | 빌드 자동화 |
| [QEMU](https://www.qemu.org/) | 에뮬레이터 (실행/테스트) |

macOS (Homebrew):

```sh
brew install nasm make qemu
```

Ubuntu/Debian:

```sh
sudo apt install nasm make qemu-system-x86
```

## 디렉터리 구조

```
LizeOS/
├── src/          # 어셈블리 소스 (부트로더, 커널 등)
│   └── main.asm  # 부트 섹터 (ORG 0x7C00, 16비트 리얼 모드)
├── Makefile      # 빌드 스크립트
├── commit.md     # 커밋 컨벤션
└── README.md
```

## 빌드 및 실행

> Makefile 작성 후 아래 타겟을 기준으로 정리할 예정입니다.

```sh
make          # 디스크 이미지 빌드
make run      # QEMU로 실행
make clean    # 빌드 산출물 삭제
```

수동으로 빌드할 경우:

```sh
nasm -f bin src/main.asm -o os.img
qemu-system-x86_64 -drive format=raw,file=os.img
```

## 로드맵

- [x] 부트 섹터 (512바이트, `0xAA55` 시그니처)
- [x] BIOS 인터럽트를 이용한 화면 출력
- [ ] 2단계 로더 / 커널 로드
- [ ] 보호 모드(32비트) 전환
- [ ] 인터럽트 / 키보드 입력
